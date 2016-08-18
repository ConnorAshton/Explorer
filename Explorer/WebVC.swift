//
//  WebVC.swift
//  Explorer
//
//  Created by Connor Ashton on 12/08/2016.
//  Copyright © 2016 Connor Ashton. All rights reserved.
//

import UIKit
import WebKit

class WebVC: UIViewController {
    
    var webView: WKWebView!
    
    override func loadView() {
        
        webView = WKWebView()
        view = webView
        
        let url = NSURL(string: "https://www.lonelyplanet.com")
        let requestURL = NSURLRequest(URL: url!)
        webView.loadRequest(requestURL)
        
        
        
    }
    
}