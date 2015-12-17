//
//  ViewController.m
//  fbLogin
//
//  Created by iLab on 12/16/15.
//  Copyright (c) 2015 TaipeiTech. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    
    loginButton.readPermissions =
    @[@"public_profile", @"email", @"user_friends"];
    
    // Optional: Place the button in the center of your view.
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
    
    [FBSDKProfile enableUpdatesOnAccessTokenChange:YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(profileUpdated:)
                                                 name:FBSDKProfileDidChangeNotification
                                               object:nil];
    
}

-(void)profileUpdated:(NSNotification *) notification{
    
    
    NSMutableDictionary* parameters = [NSMutableDictionary dictionary];
    [parameters setValue:@"id,name,email" forKey:@"fields"];
    
    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:parameters]
     startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                  id result, NSError *error) {
         if(result!=nil)
         {
             statusLabel.text = @"Login";
         }
         else
         {
             statusLabel.text = @"Logout";
         }
         emailLabel.text = [result valueForKey:@"email"];
         nameLabel.text = [result valueForKey:@"name"];
         fbIdLabel.text = [result valueForKey:@"id"];
         loginView.profileID =[result valueForKey:@"id"];
         
         // aHandler(result, error);
     }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
