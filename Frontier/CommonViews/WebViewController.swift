//
//  WebViewController.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/30.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    private let urlString: String?
    
    init(urlString: String?) {
        self.urlString = urlString
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var webView = WKWebView()
    private var progressView = UIProgressView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addWebView()
        addProgressView()
        loadURL()
        addLoadProgressObserver()
    }
    
    private func addWebView() {
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        webView.navigationDelegate = self
    }
    
    private func addProgressView() {
        view.addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func loadURL() {
        guard let urlString = urlString,
              let url = URL(string: urlString) else {
            showErrorAlert(title: "Error", message: APIError.badURL.localizedDescription)
            return
        }
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    private func addLoadProgressObserver() {
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            let completionRate = Float(webView.estimatedProgress)
            animateProgressBar(completionRate: completionRate)
            if completionRate == 1.0 {
                hideProgressView()
            }
        }
    }
    
    private func animateProgressBar(completionRate: Float) {
        UIView.animate(withDuration: 0.2) {
            self.progressView.setProgress(completionRate, animated: true)
        }
    }
    
    private func hideProgressView() {
        UIView.animate(withDuration: 0.2, delay: 1.0, options: .curveEaseInOut) {
            self.progressView.alpha = 0.0
        }
    }
    
    private func showErrorAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        self.navigationController?.present(alertVC, animated: true)
    }

}

extension WebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        showErrorAlert(title: "Error", message: error.localizedDescription)
    }
    
}
