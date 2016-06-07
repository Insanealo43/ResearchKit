//
//  ORKWebviewViewController.m
//  ResearchKit
//
//  Created by Emily Ono on 6/1/16.
//  Copyright © 2016 researchkit.org. All rights reserved.
//

#import "ORKWebviewViewController.h"
#import "ORKTaskViewController_Internal.h"
#import "ORKStepViewController_Internal.h"
#import "ORKNavigationContainerView_Internal.h"
#import "ORKVerticalContainerView_Internal.h"
#import "ORKWebviewStep.h"
#import "ORKInstructionStepView.h"

@interface ORKWebviewViewController()
@property (nonatomic, strong, nullable) ORKVerticalContainerView *containerView;
@end

@implementation ORKWebviewViewController {
    BOOL _isCompletionStep;
}

- (ORKWebviewStep *)webviewStep {
    return (ORKWebviewStep *)self.step;
}

- (void)stepDidChange {
    [super stepDidChange];
    
    if (self.step && [self isViewLoaded]) {
        
        self.containerView = [[ORKVerticalContainerView alloc] initWithFrame:self.view.bounds];
        
        UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        CGRect frame = webView.frame;
        frame.size = CGSizeMake(frame.size.width, 150.0);
        [webView setFrame:frame];
        ORKWebviewStep *webViewStep = [self webviewStep];
        if(webViewStep.htmlUrl != nil) {
            NSURLRequest *urlRequest = [NSURLRequest requestWithURL:webViewStep.htmlUrl];
            [webView loadRequest:urlRequest];
            
        }else if(webViewStep.htmlText != nil) {
            [webView loadHTMLString:webViewStep.htmlText baseURL:nil];
        }else {
            [webView loadHTMLString:@"Enter text here." baseURL:nil];
        }
        self.containerView.stepView = webView;
        
        self.containerView.verticalCenteringEnabled = false;
        self.containerView.continueHugsContent = false;
        self.containerView.stepViewFillsAvailableSpace = !_isCompletionStep;
        
        
        
        _isCompletionStep = [webViewStep isKindOfClass:[ORKCompletionStep class]];

        [self.containerView.continueSkipContainer updateContinueAndSkipEnabled];
        
        [self.containerView tintColorDidChange];
        
        [self.containerView setNeedsUpdateConstraints];
        
        self.containerView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self.view addSubview:self.containerView];
        self.containerView.continueSkipContainer.continueButtonItem = self.continueButtonItem;
        self.containerView.headerView.learnMoreButtonItem = self.learnMoreButtonItem;
        self.containerView.continueSkipContainer.continueEnabled = YES;

    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self stepDidChange];
}

- (void)setContinueButtonItem:(UIBarButtonItem *)continueButtonItem {
    [super setContinueButtonItem:continueButtonItem];
    self.containerView.continueSkipContainer.continueButtonItem = continueButtonItem;
}

- (void)setLearnMoreButtonItem:(UIBarButtonItem *)learnMoreButtonItem {
    [super setLearnMoreButtonItem:learnMoreButtonItem];
    self.containerView.headerView.learnMoreButtonItem = learnMoreButtonItem;
}

- (void)encodeRestorableStateWithCoder:(NSCoder *)coder {
    [super encodeRestorableStateWithCoder:coder];
}

- (void)decodeRestorableStateWithCoder:(NSCoder *)coder {
    [super decodeRestorableStateWithCoder:coder];
}

@end