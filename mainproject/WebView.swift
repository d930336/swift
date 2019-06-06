//
//  WebView.swift
//  mainproject
//
//  Created by Benson Yang on 2019/3/20.
//  Copyright © 2019 Benson Yang. All rights reserved.
//

import UIKit
import WebKit
class WebView: UIViewController {
    
    
    
    @IBOutlet weak var WebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "http://www.google.com")
        let request = URLRequest(url :url!)
        
        WebView.load(request)
    
    }

}
