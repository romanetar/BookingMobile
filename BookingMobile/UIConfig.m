//
//  UIConfig.m
//  MAT1
//
//  Created by Roman AG on 04/07/13.
//  Copyright (c) 2013 Roman AG. All rights reserved.
//

#import "UIConfig.h"

@implementation UIConfig

- (void)setUpButtonBackground:(UIButton *)button
{
    UIImage *buttonImage = [[UIImage imageNamed:@"blueButton.png"]
                            resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    
    UIImage *buttonImageHighlight = [[UIImage imageNamed:@"blueButtonHighlight.png"]
                                     resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:buttonImageHighlight forState:UIControlStateHighlighted];
}


@end
