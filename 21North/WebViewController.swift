//
//  WebViewController.swift
//  21North
//
//  Created by Aruna Elangovan on 29/12/17.
//  Copyright © 2017 Sachin Tomar. All rights reserved.
//

import UIKit
import WebKit

@objc protocol WebVCDelegate{
    func moveTableToTop()
}

class WebViewController: BaseViewController, WKUIDelegate, WKNavigationDelegate {
    
    private var webView: WKWebView!
    let shapes = Shapes()
    var urlString: String!
    var pagetitle: String?
    var shouldShowHeaderImage: Bool = false
    var headerHeight: CGFloat = 0
    
    var webVCDelegate: WebVCDelegate?
    
    /*override func loadView() {
     let webConfiguration = WKWebViewConfiguration()
     webView = WKWebView(frame: .zero, configuration: webConfiguration)
     webView.uiDelegate = self
     view = webView
     }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        let url = URL(string: urlString)
        let myRequest = URLRequest(url: url!)
        webView.load(myRequest)
    }
    
    deinit {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        if webView.isLoading {
            webView.stopLoading()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func setupUI() {
        pageTitle = pagetitle!
        let backButton = shapes.drawShapes(type: "backButton")
        let closeButtonItem = NavigationItemModel(title: "", image: backButton, highlitedImage: nil, action: #selector(backButtonClicked) , type: NavigationItemType.imageOnly)
        setLeftButtonItems(closeButtonItem)
        navigationBackgroundColor = UIColor.clear
        titleColor = UIColor.white
        let style = Style()
        titleFont = style.titleFont!
        
        headerHeight = navigationHeight
        
        if shouldShowHeaderImage{
            headerImage = UIImage(named: "servicing")
            headerHeight = (headerImage?.size.height)!
        }
        
        configWebView()
    }
    
    @objc func backButtonClicked(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        webVCDelegate?.moveTableToTop()
        self.dismiss(animated: true, completion: nil)
    }
    
    private func configWebView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        
        view.addSubview(webView)
        
        webView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(headerHeight, 0.0, 0.0, 0.0))
    }
    
    // MARK: - WKUIDelegate
    func webViewDidClose(_ webView: WKWebView) {
        
    }
    
    // MARK: - WKNavigationDelegate
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}

