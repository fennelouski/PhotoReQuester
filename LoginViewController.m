//
//  LoginViewController.m
//  Photo ReQuester
//
//  Created by Louis Ellis on 8/20/16.
//  Copyright © 2016 Nathan Fennel. All rights reserved.
//

#import "LoginViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <Google/SignIn.h>

@interface LoginViewController () <FBSDKLoginButtonDelegate, GIDSignInDelegate, GIDSignInUIDelegate>
@property(nonatomic, strong) IBOutlet FBSDKLoginButton *fbLoginButton;
@property(nonatomic, strong) IBOutlet GIDSignInButton *signInButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.fbLoginButton.delegate = self;

    [GIDSignIn sharedInstance].uiDelegate = self;
    [GIDSignIn sharedInstance].delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*!
 @abstract Sent to the delegate when the button was used to login.
 @param loginButton the sender
 @param result The results of the login
 @param error The error (if any) from the login
 */
- (void)  loginButton:(FBSDKLoginButton *)loginButton
didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
                error:(NSError *)error {
    
    if (error) {
        // Process error
    }
    else if (result.isCancelled) {
        // Handle cancellations
    }
    else {
        NSLog(@"token string = %@", result.token.tokenString);
    }
    
}

/*!
 @abstract Sent to the delegate when the button was used to logout.
 @param loginButton The button that was clicked.
 */
- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    
}
- (void)signIn:(GIDSignIn *)signIn
didSignInForUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    // Perform any operations on signed in user here.
    NSString *userId = user.userID;                  // For client-side use only!
    NSString *idToken = user.authentication.idToken; // Safe to send to the server
    NSString *fullName = user.profile.name;
    NSString *givenName = user.profile.givenName;
    NSString *familyName = user.profile.familyName;
    NSString *email = user.profile.email;
    
    
    NSLog(@"user_id = %@", user.userID);
}

- (void)signIn:(GIDSignIn *)signIn
didDisconnectWithUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    NSLog(@"Disconnect");
}


- (void)signIn:(GIDSignIn *)signIn presentViewController:(UIViewController *)viewController {
    
}

// If implemented, this method will be invoked when sign in needs to dismiss a view controller.
// Typically, this should be implemented by calling |dismissViewController| on the passed
// view controller.
- (void)signIn:(GIDSignIn *)signIn dismissViewController:(UIViewController *)viewController{
    [viewController dismissViewControllerAnimated:YES completion:nil];
}

@end
