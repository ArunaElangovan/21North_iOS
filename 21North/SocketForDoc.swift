//
//  SocketForDoc.swift
//  21North
//
//  Created by Sachin Tomar on 14/09/17.
//  Copyright © 2017 Sachin Tomar. All rights reserved.
//


@objc protocol SocketStreamDelegate1{
    func socketDidConnect(_ stream:Stream)
    func socketReady(_ stream:Stream)
    func socketDidDisconnect(_ stream:Stream, message:String)
    func socketReconnect(_ message:String)
    func unableToreachserver(_ message:String)
    func socketDidReceiveMessage(_ stream:Stream, message:String)
    func socketServerDown(_ message:String)
    func socketShutDown(_ stream:Stream)
    func socketWrote(_ message:String)
}

class SocketForDoc: NSObject, StreamDelegate {
    var delegate:SocketStreamDelegate1?
    fileprivate let bufferSize = 1024
    fileprivate var _host:String?
    fileprivate var _port:Int?
    fileprivate var clearMe:String?
    fileprivate var _messagesQueue:Array<String> = [String]()
    fileprivate var _streamHasSpace:Bool = false
    fileprivate var inputStream: InputStream?
    fileprivate var outputStream: OutputStream?
    fileprivate var inputBuffer = NSMutableData(capacity: 65536)!
    //private let terminator = "\0".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
    //private static let terminator = "\n\n".dataUsingEncoding(NSUTF8StringEncoding)!
    fileprivate var fullString = ""
    
    //port : 7410
    //ip :
    
    var x = 0
    
    fileprivate  let terminator = "\0".data(using: String.Encoding.utf8)!
    fileprivate  let terminatornl = "\n".data(using: String.Encoding.utf8)!
    
    fileprivate  let terminatorlarge = "ø".data(using: String.Encoding.utf8)!
    
    
    var host:String?{
        get{
            return self._host
        }
    }
    
    var port:Int?{
        get{
            return self._port
        }
    }
    
    deinit{
        if let inputStr = self.inputStream{
            inputStr.close()
            inputStr.remove(from: .main, forMode: RunLoopMode.defaultRunLoopMode)
        }
        if let outputStr = self.outputStream{
            outputStr.close()
            outputStr.remove(from: .main, forMode: RunLoopMode.defaultRunLoopMode)
        }
    }
    
    final func close(){
        let string = "X\n"
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false)!
        self.outputStream?.write((data as NSData).bytes.bindMemory(to: UInt8.self, capacity: data.count), maxLength: data.count)
        if let inputStr = self.inputStream{
            inputStr.close()
            inputStr.remove(from: .main, forMode: RunLoopMode.defaultRunLoopMode)
        }
        if let outputStr = self.outputStream{
            outputStr.close()
            outputStr.remove(from: .main, forMode: RunLoopMode.defaultRunLoopMode)
        }
    }
    
    /**
     Opens streaming for both reading and writing, error will be thrown if you try to send a message and streaming hasn't been opened
     
     - parameter host: String with host portion
     - parameter port: Port
     */
    final func open(_ host:String!, port:Int!){
        self._host = host
        self._port = port
        self.inputStream = nil
        self.outputStream = nil
        
        //NSStream.getStreamsToHostWithName(self._host!, port: self._port!, inputStream: &inputStream, outputStream: &outputStream)
        Stream.getStreamsToHost(withName: self._host!, port: self._port!, inputStream: &inputStream, outputStream: &outputStream)
        
        if inputStream != nil && outputStream != nil {
            
            inputStream!.delegate = self
            outputStream!.delegate = self
            
            inputStream!.schedule(in: .main, forMode: RunLoopMode.defaultRunLoopMode)
            outputStream!.schedule(in: .main, forMode: RunLoopMode.defaultRunLoopMode)
            
            print("[SCKT]: Open Stream")
            
            appDelegate.reconnect = 0
            
            self._messagesQueue = Array()
            
            inputStream!.open()
            outputStream!.open()
            
            sendFile(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0].stringByAppendingPathComponent("21Doc/profileImage.jpg") as String)
        } else {
            print("[SCKT]: Failed Getting Streams")
            
            delegate?.socketServerDown("Unable to Connect")
        }
    }
    
    /**
     NSStream Delegate Method where we handle errors, read and write data from input and output streams
     
     - parameter stream: NStream that called delegate method
     - parameter eventCode:      Event Code
     */
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var serverDownCount = 0
    final func stream(_ stream: Stream, handle eventCode: Stream.Event) {
        switch eventCode {
        case Stream.Event.endEncountered:
            endEncountered(stream)
            delegate?.socketShutDown(stream)
            
            
        case Stream.Event.errorOccurred:
            print("[SCKT]: ErrorOccurred: \(String(describing: stream.streamError?.localizedDescription))")
            delegate?.socketDidDisconnect(stream, message: (stream.streamError?.localizedDescription)!)
            print("Unable to connect server")
            
        case Stream.Event.openCompleted:
            if (stream == inputStream) {
                //                print("Input stream opened")
            }
            else {
                print("output stream opened")
                openCompleted(stream)
                //self.performSelector(inBackground: #selector(self.sendAuthRequest), withObject: nil)
            }
            
        case Stream.Event.hasBytesAvailable:
            handleIncommingStream(stream)
            
        case Stream.Event.hasSpaceAvailable:
            
            writeToStream()
            delegate?.socketReady(stream)
            break;
            
        default:
            break;
        }
    }
    
    final func endEncountered(_ stream:Stream){
        
    }
    
    final func openCompleted(_ stream:Stream){
        if(self.inputStream?.streamStatus == .open && self.outputStream?.streamStatus == .open){
            delegate?.socketDidConnect(stream)
            //            sendFile("dsnjka")
        }
    }
    
    /**
     Reads bytes asynchronously from incomming stream and calls delegate method socketDidReceiveMessage
     
     - parameter stream: An NSInputStream
     */
    
    final func handleIncommingStream(_ stream: Stream){
        var result : [String] = []
        let bufferSize = 4116
        var buffer = Array<UInt8>(repeating: 0, count: bufferSize)
        
        let bytesRead = self.inputStream!.read(&buffer, maxLength: buffer.count)
        
        if bytesRead > 0
        {
            self.inputBuffer.append(&buffer, length: bytesRead)
            
            
            let terminatorRange: NSRange = self.inputBuffer.range(of: terminator,options: NSData.SearchOptions(),in: NSMakeRange(0, self.inputBuffer.length))
            
            let terminatorRangenl: NSRange = self.inputBuffer.range(of: terminatornl,options: NSData.SearchOptions(),in: NSMakeRange(0, self.inputBuffer.length))
            
            let terminatorRangelarge: NSRange = self.inputBuffer.range(of: terminatorlarge,options: NSData.SearchOptions(),in: NSMakeRange(0, self.inputBuffer.length))
            var blockString = NSString(data: self.inputBuffer as Data, encoding: String.Encoding.utf8.rawValue)
            _ = String(data: self.inputBuffer as Data, encoding: .utf8)
            print(terminatorRangelarge.location)
            
            result.append(blockString! as String)
            print(terminatorRange.location)
            //            result[0] = result[0].replacingOccurrences(of: "\0", with: "", options: NSString.CompareOptions.literal, range:nil)
            print(terminatorRangelarge.location)
            // When the terminator is found, process the data
            
            if ((terminatorRange.location != NSNotFound) || (terminatorRangelarge.location != NSNotFound) || (terminatorRangenl.location != NSNotFound)){
                //delegate?.messageReceived("".join(result))
                //closeNetworkCommunication()
                print(result[0])
                let termlocation = terminatorRange.location
                let termnllocation = terminatorRangenl.location
                var finallocation = 0;
                if (termlocation > termnllocation){
                    finallocation = termnllocation
                }
                else{
                    finallocation = termlocation
                }
                blockString = blockString?.substring(with: NSRange(location: 0, length: finallocation)) as NSString?
                self.delegate?.socketDidReceiveMessage(stream, message: (blockString! as String))
                // Clean the buffer
                let rangeToEndOfTerminator = NSMakeRange(0, self.inputBuffer.length)
                result[0] = ""
                self.inputBuffer.replaceBytes(in: rangeToEndOfTerminator, withBytes: nil, length: 0)
                
            }
        }
            
        else if bytesRead < 0
        {
            print("Input stream has less than 0 bytes")
        }
            
        else if bytesRead == 0
        {
            print("Input stream has 0 bytes")
            let mobileDictionary = ["NetworkStatus" : "Server Down", "check": "0"]
            if(x==0){
                NotificationCenter.default.post(name: Notification.Name(rawValue: "NetworkStatus"), object: nil, userInfo: mobileDictionary)
            }
        }
    }
    
    
    /*    final func handleIncommingStream(stream: NSStream){
     if let inputStream = stream as? NSInputStream {
     var buffer = Array<UInt8>(count: bufferSize, repeatedValue: 0)
     
     dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
     let bytesRead = inputStream.read(&buffer, maxLength: 1024)
     
     if bytesRead >= 0 {
     if let output = NSString(bytes: &buffer, length: bytesRead, encoding: NSUTF8StringEncoding){
     self.delegate?.socketDidReceiveMessage(stream, message: output as String)
     }
     } else {
     // Handle error
     }
     
     })
     } else {
     print("[SCKT]: \(__FUNCTION__) : Incorrect stream received")
     }
     
     }
     */
    
    
    /**
     If messages exist in _messagesQueue it will remove and it and send it, if there is an error
     it will return the message to the queue
     */
    final func writeToStream(){
        if _messagesQueue.count > 2{
            clearMe = "Disconnected."
            delegate?.unableToreachserver(clearMe!)
        }
        if _messagesQueue.count > 4{
            clearMe = "Too many messages in buffer to clear."
            //            delegate?.socketReconnect(clearMe!)
        }
        if _messagesQueue.count > 0 && self.outputStream!.hasSpaceAvailable  {
            
            
            DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async(execute: { () -> Void in
                if (self._messagesQueue.count > 0){
                    let message = self._messagesQueue.removeLast()
                    
                    //let data: NSData = message.dataUsingEncoding(NSUTF8StringEncoding)!
                    let data = message.data(using: String.Encoding.utf8, allowLossyConversion: false)!
                    //                var buffer = [UInt8](count:data.length, repeatedValue:0)
                    
                    while ( !self.outputStream!.hasSpaceAvailable )
                    {
                        Thread.sleep(forTimeInterval: 0.05)
                    }
                    //An error ocurred when writing
                    if self.outputStream!.write((data as NSData).bytes.bindMemory(to: UInt8.self, capacity: data.count), maxLength: data.count) == -1 {
                        self._messagesQueue.append(message)
                        
                    }
                    self.delegate?.socketWrote("Wrote")
                }
            })
            
        }
    }
    
    func listFilesFromDocumentsFolder() -> [String]
    {
        let theError: NSErrorPointer = nil
        let dirs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        //        if dirs != nil {
        var dir = dirs[0]
        dir = dir+"/f/"
        var fileList: [AnyObject]?
        do {
            fileList = try FileManager.default.contentsOfDirectory(atPath: dir) as [AnyObject]?
        } catch let error as NSError {
            theError?.pointee = error
            fileList = nil
        }
        return fileList as! [String]
    }
    
    final func sendFile(_ filename:String){
        if self.outputStream!.hasSpaceAvailable  {
            DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async(execute: { () -> Void in
                
                _ = FileManager.default
                let dir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0].stringByAppendingPathComponent("21Doc/") as String
                
                var fileSize : UInt64 = 0
                let theError: NSErrorPointer = nil
                var fileList: [AnyObject]?
                do {
                    fileList = try FileManager.default.contentsOfDirectory(atPath: dir) as [AnyObject]?
                } catch let error as NSError {
                    theError?.pointee = error
                    fileList = nil
                } catch {
                    fatalError()
                }
                if (fileList != nil) {
                    for i in 0 ..< fileList!.count{
                        
                        let filefolder = "\(dir)/\(fileList![i])"
                        let filename = "\(fileList![i])"
                        
                        let attr:NSDictionary? = try! FileManager.default.attributesOfItem(atPath: filefolder) as NSDictionary?
                        if let _attr = attr {
                            fileSize = _attr.fileSize();
                        }
                        let filenameupload = "FILUP,\(filename),\(fileSize)"
                        let dataopen = filenameupload.data(using: String.Encoding.utf8, allowLossyConversion: false)!
                        //var openbuffer = [UInt8](count:dataopen.length, repeatedValue:0)
                        if self.outputStream!.write((dataopen as NSData).bytes.bindMemory(to: UInt8.self, capacity: dataopen.count), maxLength: dataopen.count) == -1 {
                            print("error : opening file")
                        }
                        
                        let data = try? Data(contentsOf: URL(fileURLWithPath: filefolder))
                        var bytesWritten = 0;
                        var writeResult = 0;
                        while ( data!.count > bytesWritten ) {
                            while ( !self.outputStream!.hasSpaceAvailable )
                            {
                                Thread.sleep(forTimeInterval: 0.05)
                            }
                            
                            //An error ocurred when writing
                            writeResult = self.outputStream!.write((data! as NSData).bytes.bindMemory(to: UInt8.self, capacity: data!.count)+bytesWritten, maxLength: data!.count-bytesWritten)
                            if ( writeResult == -1 ) {
                                NSLog("error code here"); }
                            else {
                                bytesWritten = bytesWritten + writeResult;
                            }
                            
                            
                        }
                    }
                }
                
                
            })
            
        }
    }
    
    final func slowsend(_ message:String){
        _messagesQueue.insert(message, at: 0)
        if (self.outputStream != nil){
            //if (self.outputStream!.hasSpaceAvailable)
            //{
            _ = self.outputStream?.streamStatus.hashValue
            //if (self.outputStream?.streamStatus == .Open)
            //{
            writeToStream()
            //}
            //}
        }
        
    }
    
    final func send(_ message:String){
        _messagesQueue.append(message)
        if (self.outputStream != nil){
            //if (self.outputStream!.hasSpaceAvailable)
            //{
            _ = self.outputStream?.streamStatus.hashValue
            //if (self.outputStream?.streamStatus == .Open)
            //{
            writeToStream()
            //}
            //}
        }
        
    }
    
}

