//
//  ISBXORKWebviewStepViewController.swift
//  ItchAppSandbox
//
//  Created by Emily Ono on 5/31/16.
//  Copyright © 2016 ISBX. All rights reserved.
//


class ISBXORKWebviewStepViewController : ORKStepViewController {
    var webView : UIWebView!
    
    var webViewStep : ISBXORKWebviewStep? {
        return step as? ISBXORKWebviewStep
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepDidChange()
    }
    
    override func goForward() {
        super.goForward()
        
    }
    
    func stepDidChange() {
        guard step != nil && isViewLoaded() else {return}
        
        webView = UIWebView(frame: view.bounds)
        let htmlString:String! = "<br /><h2>Welcome to SourceFreeze!!!</h2>"
        webView.loadHTMLString(htmlString, baseURL: nil)
       // view.addSubview(webView)
        continueButtonTitle = "Emily"
        learnMoreButtonTitle = "HEY"
    
        
        
    }
    
    
}