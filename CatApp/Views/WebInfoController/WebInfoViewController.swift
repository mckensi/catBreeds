//
//  WebInfoViewController.swift
//  CatApp
//
//  Created by Daniel Steven Murcia Almanza on 31/08/20.
//  Copyright © 2020 selvamatic. All rights reserved.
//

import UIKit
import WebKit

class WebInfoViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var webView: WKWebView!
    
    var url: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = url{
            let myURL = URL(string:url)
            let myRequest = URLRequest(url: myURL!)
            webView.load(myRequest)
        }
    }
    
    init(){
        super.init(nibName: "WebInfoViewController", bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
