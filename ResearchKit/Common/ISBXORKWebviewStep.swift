//
//  ISBXORKWebviewStep.swift
//  ItchAppSandbox
//
//  Created by Emily Ono on 5/31/16.
//  Copyright © 2016 ISBX. All rights reserved.
//

public class ISBXORKWebviewStep : ORKStep {
    static func stepViewControllerClass() -> ISBXORKWebviewStepViewController.Type {
        return ISBXORKWebviewStepViewController.self
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override init(identifier: String) {
        super.init(identifier: identifier)
        
        title = NSLocalizedString("Webview Step", comment: "")
        text = NSLocalizedString("Webview Step Text Here", comment: "")
    }
}

