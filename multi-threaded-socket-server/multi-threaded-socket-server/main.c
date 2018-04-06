/*
 * The MIT License (MIT)
 * Copyright (c) 2011 Jason Ish
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use, copy,
 * modify, merge, publish, distribute, sublicense, and/or sell copies
 * of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */

/*
 * A simple chat server using libevent.
 *
 * @todo Check API usage with libevent2 proper API usage.
 * @todo IPv6 support - using libevent socket helpers, if any.
 */

#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

/* Required by event.h. */
#include <sys/time.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <errno.h>
#include <err.h>



/* On some systems (OpenBSD/NetBSD/FreeBSD) you could include
 * <sys/queue.h>, but for portability we'll include the local copy. */
#include <sys/queue.h>

/* Libevent. */
#include <event2/event.h>
#include <event2/event_struct.h>
#include <event2/bufferevent.h>
#include <event2/buffer.h>

/* Mysql. */
#include <mysql.h>

/* Port to listen on. */
#define SERVER_PORT 5568

#define BUFFER_SIZE 10

/* The libevent event base.  In libevent 1 you didn't need to worry
 * about this for simple programs, but its used more in the libevent 2
 * API. */
static struct event_base *evbase;

/**
 * A struct for client specific data.
 *
 * This also includes the tailq entry item so this struct can become a
 * member of a tailq - the linked list of all connected clients.
 */
typedef struct client {
    /* The clients socket. */
    int fd;
    
    /* The bufferedevent for this client. */
    struct bufferevent *buf_ev;
    int userid;
    
    MYSQL *conn;
    MYSQL_RES *res;
    MYSQL_ROW row;
    /*
     * This holds the pointers to the next and previous entries in
     * the tail queue.
     */
    TAILQ_ENTRY(client) entries;
}
client_t;


TAILQ_HEAD(, client) client_tailq_head;

/**
 * Set a socket to non-blocking mode.
 */
int
setnonblock(int fd)
{
    int flags;
    
    flags = fcntl(fd, F_GETFL);
    if (flags < 0)
        return flags;
    flags |= O_NONBLOCK;
    if (fcntl(fd, F_SETFL, flags) < 0)
        return -1;
    
    return 0;
}

/**
 *MYSQL code
 */

int stored_procedurerecordset(void *arg, char *storedprocedure_rs){
    
    client_t *client = (client_t *)arg;
    char *client_output;
    client_output = (char*)malloc(sizeof(char));
    memset(client_output, 0, sizeof(char));
    char sql[1024] = {' '};
    
    snprintf(sql, sizeof sql, "CALL %s()", storedprocedure_rs);
    if(mysql_query(client->conn,sql)) //remember : returns -1 on success
    {
        fprintf(stderr, "%s\n", mysql_error(client->conn));
    }
    client->res = mysql_store_result(client->conn);
    unsigned long long numRows =0 ;
    int numColumns = 0;
    if (client->res)  // there are rows
    {
        
        numRows = mysql_num_rows(client->res);
        numColumns = mysql_num_fields(client->res);
    }
    
  
    if (numRows >0)
    {
        while((client->row = mysql_fetch_row(client->res))){
            
            for(int k=0;k<numColumns;k++){
                
                client_output = (char*)realloc(client_output,(strlen(client->row[k])+3)*sizeof(char));
                strcat(client_output,client->row[k]);//client->row[x]
                strcat(client_output,",");
                
            }
            strcat(client_output,"|");
        }
        struct evbuffer *evb;
        evb = evbuffer_new();
        evbuffer_add_printf(evb, "%s\n", client_output);
        bufferevent_write_buffer(client->buf_ev, evb);
        printf("Wrote %s\n", client_output);
        evbuffer_free(evb);
        
    }
    
    return 0;
}



int stored_procedure(char *data, void *arg, int numoutput, char *storedprocedure){
    
    client_t *client = (client_t *)arg;
    
    //TODO: array size needs to become variable
    char *output_param;
    char *input_param;
    char *inout_param;
    inout_param = (char*)malloc(sizeof(char));
    memset(inout_param, 0, sizeof(char));
    input_param = (char*)malloc(sizeof(char));
    memset(input_param, 0, sizeof(char));
    output_param = (char*)malloc(sizeof(char));
    memset(output_param, 0, sizeof(char));
    char *p;
    int i=0;
    char *array[50];
    p = strtok (data,",");
    while(p!=NULL)
    {
        array[i++]=p;
        p=strtok(NULL,",");
        
    }
    //input param,output param = concat
    
    for(int j=1;j<i;j++){
        input_param = (char*)realloc(input_param,(strlen(input_param)+strlen(array[j])+3)*sizeof(char));
        if(strcmp(array[j],"\r\n")==0){
            break;
        }
        strcat(input_param,"'");
        strcat(input_param, array[j]);
        strcat(input_param,"'");
        if(j!=(i-2))
            strcat(input_param,",");
    }
   for(int k=1;k<=numoutput;k++){
        
        output_param = (char*)realloc(output_param, (strlen(output_param)+strlen("")+3)*sizeof(char));
       
       
        strcat(output_param, "@out");
        char buffer[BUFFER_SIZE];
        sprintf(buffer, "%d", k);
        strcat(output_param, buffer);
        if(k != numoutput)
            strcat(output_param,",");
    
    }
    
    if (strncmp(storedprocedure, "LOGIN", 5)==0)
    {
        
    }
    /* command check and exeCUTE */

    
    
    char sql[1024] = {' '};
    fprintf(stderr, "Success ");
    
    snprintf(sql, sizeof sql, "CALL %s(%s,%s)", storedprocedure, input_param, output_param );
    
    if (mysql_query(client->conn,sql)) //remember : returns -1 on success
    {
        fprintf(stderr, "%s\n", mysql_error(client->conn));
        //   exit(1);
    }
    snprintf(sql, sizeof sql, "select %s", output_param);
    if (mysql_query(client->conn,sql)) //remember : returns -1 on success
    {
        fprintf(stderr, "%s\n", mysql_error(client->conn));
        
        
        //   exit(1);
//        printf("%s", output_param);
    }
    //char outputclient[1024]={'\0'};
    char updateusersuccess[1000]={'\0'};
    //snprintf(updateusersuccess, sizeof updateusersuccess, "OK \n");
    /*client->res = mysql_use_result(client->conn);
    while ((client->row = mysql_fetch_row(client->res)) != NULL){
        printf("OK %s \n", client->row[0]);
    }*/
    char *outp;
    outp = (char*)malloc(sizeof(char));
    memset(outp, 0, sizeof(char));
    
    
    
    client->res = mysql_use_result(client->conn);
    while ((client->row = mysql_fetch_row(client->res)) != NULL)
    {
        for(int k=0;k<numoutput;k++){
             if (strncmp(storedprocedure, "LOGIN", 5)==0)
             {
                 client->userid = client->row[0];
             }
            char output[1024];
            snprintf(output,sizeof(output), "%s,", client->row[k]);
            outp = (char*)realloc(outp,(strlen(outp)+strlen(output)+1)*sizeof(char));
            
            strcat(outp, output);
            snprintf(updateusersuccess, sizeof updateusersuccess, "ID: %s ",client->row[k]);
        //snprintf(outputclient, sizeof(outputclient), "%s,",client->row[k]);
    
            
        }
        printf("%s",outp);
    }
    
    struct evbuffer *evb;
    evb = evbuffer_new();
    evbuffer_add_printf(evb, "%s\n", outp);
    bufferevent_write_buffer(client->buf_ev, evb);
    printf("Wrote %s\n", outp);
    evbuffer_free(evb);

    
    mysql_free_result(client->res);
    
    return 0;
    
}







/**
 * Called by libevent when there is data to read.
 */
void buffered_on_read(struct bufferevent *bev, void *arg)
{
    char *server = "localhost";
    char *user = "root";
    char *password = ""; /* set me first */
    char *database = "mydb";
    
    client_t *client = (client_t *)arg;
    
    
    char data[4096]= {' '};
    size_t n;
    
    /* Read 8k at a time and send it to all connected clients. */
    for (;;) {
        n = bufferevent_read(bev, data, sizeof(data));
        if (n <= 0) {
            /* Done. */
            break;
        }
        
        int res;
        
        if (strncmp(data, "LOGIN", 5)==0)
        {
            client->conn = mysql_init(NULL);
            
            
            fprintf(stderr, "Success ");
            
             /*Connect to database */
            
           if (!mysql_real_connect(client->conn, server,
                                    user, password, database, 0, NULL, 0)) {
                fprintf(stderr, "%s\n", mysql_error(client->conn));
                exit(1);
        }
            
            res = stored_procedure(data,client, 1, "login");
        }
        else if (strncmp(data, "ADDUSER", 7)==0)
        {
            client->conn = mysql_init(NULL);
            
            
            fprintf(stderr, "Success ");
            
            /*Connect to database */
            
            if (!mysql_real_connect(client->conn, server,
                                    user, password, database, 0, NULL, 0)) {
                fprintf(stderr, "%s\n", mysql_error(client->conn));
                exit(1);
            }
            res = stored_procedure(data,client, 1, "register");
        }
        else if (strncmp(data, "MODIFYUSER", 10)==0)
        {
            res = stored_procedure(data,client, 1, "modifyuserinfo");
        }
        else if (strncmp(data, "ADDCAR", 6)==0)
        {
            res = stored_procedure(data,client,1, "addcar");
        }
        
        else if(strncmp(data, "DELETECAR", 9)==0){
        
            res = stored_procedure(data,client,1, "deletecar");
        }
        else if(strncmp(data, "SVCADDBOOKING", 13)==0){
            
            res = stored_procedure(data,client,1, "svc_addbooking");
        }
        else if(strncmp(data, "SVCUPDATEBOOKING", 17)==0){
            
            res = stored_procedure(data,client,1,"svc_updatebooking");
        }
        else if(strncmp(data, "SVCBOOKINGNOPICK", 16)==0){
            
            res = stored_procedure(data,client,1,"svc_booking_no_pickip");
        }
        else if(strncmp(data, "SVCCANCELBOOKING", 16)==0){
            
            res = stored_procedure(data,client,1,"svc_nopickup_ccl");
        }
        
    }
    
}

/**
 * Called by libevent when there is an error on the underlying socket
 * descriptor.
 */
void buffered_on_error(struct bufferevent *bev, short what, void *arg)
{
    struct client *client = (struct client *)arg;
    
    if (what & BEV_EVENT_EOF) {
        /* Client disconnected, remove the read event and the
         * free the client structure. */
        printf("Client disconnected.\n");
        mysql_close(client->conn);
        printf("Closing Mysql Connection.\n");
    }
    else {
        warn("Client socket error, disconnecting.\n");
    }
    
    /* Remove the client from the tailq. */
    TAILQ_REMOVE(&client_tailq_head, client, entries);
    
    bufferevent_free(client->buf_ev);
    close(client->fd);
    free(client);
}

/**
 * This function will be called by libevent when there is a connection
 * ready to be accepted.
 */
void on_accept(int fd, short ev, void *arg)
{
    int client_fd;
    struct sockaddr_in client_addr;
    socklen_t client_len = sizeof(client_addr);
    struct client *client;
    
    client_fd = accept(fd, (struct sockaddr *)&client_addr, &client_len);
    if (client_fd < 0) {
        warn("accept failed");
        return;
    }
    
    /* Set the client socket to non-blocking mode. */
    if (setnonblock(client_fd) < 0)
        warn("failed to set client socket non-blocking");
    
    /* We've accepted a new client, create a client object. */
    client = calloc(1, sizeof(*client));
    if (client == NULL)
        err(1, "malloc failed");
    client->fd = client_fd;
    
    client->buf_ev = bufferevent_socket_new(evbase, client_fd, 0);
    bufferevent_setcb(client->buf_ev, buffered_on_read, NULL,
                      buffered_on_error, client);
    
    /* We have to enable it before our callbacks will be
     * called. */
    bufferevent_enable(client->buf_ev, EV_READ);
    
    /* Add the new client to the tailq. */
    TAILQ_INSERT_TAIL(&client_tailq_head, client, entries);
    
    printf("Accepted connection from %s\n",
           inet_ntoa(client_addr.sin_addr));
}

int main(int argc, char **argv)
{
    
    int listen_fd;
    struct sockaddr_in listen_addr;
    struct event ev_accept;
    int reuseaddr_on;
    
    /* Initialize libevent. */
    evbase = event_base_new();
    
    /* Set signal handlers */
    
    
    /* Initialize the tailq. */
    TAILQ_INIT(&client_tailq_head);
    
    /* Create our listening socket. */
    listen_fd = socket(AF_INET, SOCK_STREAM, 0);
    if (listen_fd < 0)
        err(1, "listen failed");
    memset(&listen_addr, 0, sizeof(listen_addr));
    listen_addr.sin_family = AF_INET;
    listen_addr.sin_addr.s_addr = INADDR_ANY;
    listen_addr.sin_port = htons(SERVER_PORT);
    if (bind(listen_fd, (struct sockaddr *)&listen_addr,
             sizeof(listen_addr)) < 0)
        err(1, "bind failed");
    if (listen(listen_fd, 5) < 0)
        err(1, "listen failed");
    reuseaddr_on = 1;
    setsockopt(listen_fd, SOL_SOCKET, SO_REUSEADDR, &reuseaddr_on,
               sizeof(reuseaddr_on));
    struct timeval tv;
    tv.tv_sec = 5;  /* 5 Secs Timeout */
    tv.tv_usec = 0;  // Not init'ing this can cause strange errors
    setsockopt(listen_fd, SOL_SOCKET, SO_RCVTIMEO, (char *)&tv,sizeof(struct timeval));
    
    
    /* Set the socket to non-blocking, this is essential in event
     * based programming with libevent. */
    if (setnonblock(listen_fd) < 0)
        err(1, "failed to set server socket to non-blocking");
    
    /* We now have a listening socket, we create a read event to
     * be notified when a client connects. */
    event_assign(&ev_accept, evbase, listen_fd, EV_READ|EV_PERSIST,
                 on_accept, NULL);
    event_add(&ev_accept, NULL);
    
    
    
    
    /* Start the event loop. */
    event_base_dispatch(evbase);
    
    return 0;
}