//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Anna Chan on 6/19/17.
//  Copyright © 2017 Anna Chan. All rights reserved.
//

import Foundation
import WebKit

class WebViewController: UIViewController {
    var webView: WKWebView!
    
    override func viewDidLoad() {
        webView = WKWebView()
        
        view = webView
        
        let myURL = URL(string: "https://www.bignerdranch.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
    }
}
