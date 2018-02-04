//
//  WebViewController.swift
//  WorldTroter
//
//  Created by yxhuang on 2018/2/4.
//  Copyright © 2018年 yxhuang. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    var webView: UIWebView!
    let initUrl = "https://www.baidu.com"
    
    override func loadView() {
        webView = UIWebView()
        view = webView
        
        let url = NSURL(string: initUrl)
        let request = NSURLRequest(url:url! as URL)
        webView.loadRequest(request as URLRequest)
    }
    
}
