//
//  LoginViewController.m
//  MAT1
//
//  Created by Roman AG on 04/07/13.
//  Copyright (c) 2013 Roman AG. All rights reserved.
//

#import "LoginViewController.h"
#import "UIConfig.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UIConfig *uiConfig = [[UIConfig alloc] init];
    
    [uiConfig setUpButtonBackground:self.btLogin];
    [uiConfig setUpButtonBackground:self.btRegister];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
