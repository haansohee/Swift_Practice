//
//  ViewController.swift
//  Web
//
//  Created by 한소희 on 2022/06/24.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    
    // 웹 페이지의 주소를 url의 인수를 통해 전달해서 웹 페이지를 보여 주는 함수.
    // 웹을 처음 시작할 때 기본적으로 특정 웹 페이지를 보여 주기 위해 웹 페이지를 로드하는 함수.
    func loadWebPage(_ url : String) {
        let myUrl = URL(string: url)  // 상수 myUrl은 url 값을 받아 URL 형으로 선언
        let myRequest = URLRequest(url: myUrl!)  // 상수 myRequest는 상수 myUrl 값을 받아 URLRequest 형으로 선언
        myWebView.load(myRequest)  // UIWebView 형의 myWebView 클래스의 load 메서드를 호출
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        loadWebPage("http://2sam.net")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    func checkUrl(_ url : String) -> String {  // "http://" 문자열을 자동으로 추가하는 함수
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")  // "http://"를 가지고 있는지 확인한 값을 flag 에 넣음
        if !flag  // "http://" 를 가지고 있지 않다면 변수 strUrl에 "http://" 를 추가하고 이를 return
        {
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
    
    @IBAction func btnGotoSite1(_ sender: UIButton) {
        loadWebPage("http://fallinmac.tistory.com")
    }
    
    @IBAction func btnGotoSite2(_ sender: UIButton) {
        loadWebPage("http://blog.2sam.net")
    }
    
    @IBAction func btnGotoHtmlString(_ sender: UIButton) {
        let htmlString = "<h1> HTML String </h1> <p> String 변수를 이용한 웹 페이지 </p> <p><a href = \" http://2sam.net\">2sam</a>으로 이동</p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)  // loadHTMLString 함수를 이용하여 변수에 저장된 HTML문을 웹 뷰에 나타냄.
    }
    
    @IBAction func btnGotoHtmlFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")  // htmlView.html의 파일에 대한 패스 변수 생성
        let myUrl = URL(fileURLWithPath: filePath!)  // 패스 변수 이용하여 URL 변수 생성
        let myRequest = URLRequest(url: myUrl)  // URL 변수 이용하여 Request 변수 생성
        myWebView.load(myRequest)  // Request 변수를 이용하여 HTML 파일을 로딩
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()  // 웹 페이지의 로딩을 중지시키는 함수
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()  // 웹 페이지를 재로딩시키는 함수
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()  // 이전 웹 페이지로 이동시키는 함수
    }
    
    @IBAction func btnGoFoward(_ sender: UIBarButtonItem) {
        myWebView.goForward()  // 다음 웹 페이지로 이동시키는 함수
    }
    
}

