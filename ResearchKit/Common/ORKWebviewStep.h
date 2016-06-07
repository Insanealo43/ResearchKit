//
//  ORKWebviewStep.h
//  ResearchKit
//
//  Created by Emily Ono on 6/1/16.
//  Copyright © 2016 researchkit.org. All rights reserved.
//

#import <ResearchKit/ResearchKit.h>

@interface ORKWebviewStep : ORKStep

@property (nonatomic, copy, nullable) NSString *htmlText;
@property (nonatomic, copy, nullable) NSURL *htmlUrl;
@end