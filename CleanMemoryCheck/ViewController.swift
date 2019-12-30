//
//  ViewController.swift
//  CleanMemoryCheck
//
//  Created by Matoria, Ashok on 23/12/19.
//  Copyright © 2019 Matoria, Ashok. All rights reserved.
//

import UIKit
import WebKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(action))
        navigationItem.rightBarButtonItem = button
    }
}

private extension ViewController {
    @objc private func action() {
        let alert = UIAlertController(title: "Enter any text", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Sensitive user text"
        }
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

final class TextFieldViewController: UIViewController {
    
}

final class WebViewController: UIViewController {
    private var webView: WKWebView = {
        let configuration = WKWebViewConfiguration()
        // Configure with in memory data store. This makes WebKit treat web page caches, user data etc similar to private browsing.
        configuration.websiteDataStore = WKWebsiteDataStore.nonPersistent()
        let webView = WKWebView(frame: .zero, configuration: configuration)
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
        
        // Load web page
        guard let url = URL(string: "https://google.com") else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
}

private extension WebViewController {
    func setupSubviews() {
        // Add the web view layout edge to edge
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        let layoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor),
            webView.topAnchor.constraint(equalTo: layoutGuide.topAnchor),
            webView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor)
        ])
    }
}
