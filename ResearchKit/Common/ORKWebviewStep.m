//
//  ORKWebviewStep.m
//  ResearchKit
//
//  Created by Emily Ono on 6/1/16.
//  Copyright © 2016 researchkit.org. All rights reserved.
//

#import "ORKWebviewStep.h"
#import "ORKWebviewViewController.h"
@implementation ORKWebviewStep

+ (Class) stepViewControllerClass {
    return [ORKWebviewViewController class];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {

    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [super encodeWithCoder:aCoder];
}

@end