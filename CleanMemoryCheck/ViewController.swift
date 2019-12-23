//
//  ViewController.swift
//  CleanMemoryCheck
//
//  Created by Matoria, Ashok on 23/12/19.
//  Copyright © 2019 Matoria, Ashok. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let button = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(action))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc func action() {
        autoreleasepool {
            let alert = UIAlertController(title: "Enter any text", message: nil, preferredStyle: .alert)
            alert.addTextField { (textField) in
                
            }
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

}

class TextFieldViewController: UIViewController {
    
}

class WebViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: "https://google.com") else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
