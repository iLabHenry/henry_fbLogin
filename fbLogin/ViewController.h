//
//  ViewController.h
//  fbLogin
//
//  Created by iLab on 12/16/15.
//  Copyright (c) 2015 TaipeiTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

@interface ViewController : UIViewController

{
    
    IBOutlet FBSDKProfilePictureView *loginView;
    
    IBOutlet UILabel *statusLabel;
    
    IBOutlet UILabel *nameLabel;
    
    IBOutlet UILabel *emailLabel;
    
    IBOutlet UILabel *fbIdLabel;
    
    IBOutlet UIButton *mapButton;
}

@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;


@end

