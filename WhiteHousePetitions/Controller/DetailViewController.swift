//
//  DetailViewController.swift
//  WhiteHousePetitions
//
//  Created by Bruna Fernanda Drago on 26/06/20.
//  Copyright © 2020 Bruna Fernanda Drago. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

        var webView:WKWebView!
        var detailItem:Petition?
        
        override func loadView() {
            webView = WKWebView()
            view = webView
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()

            //Checando se o detailItem não retorna nulo
            guard let detailItem = detailItem else {
                return
            }
            //"""é uma string de multiplas linhas
            let html = """
            <html>
            <head>
            <meta name="viewport" content="width=device-width,initial-scale=1">
            <style> body { font-size:150%; } </style>
            </head>
            <body>
            \(detailItem.body)
            </body>
            </html>
            """
            
            webView.loadHTMLString(html, baseURL: nil)
        }

    }
    

