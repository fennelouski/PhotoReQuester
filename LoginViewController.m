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
#import "AFNetworking.h"
#import "ViewController.h"

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
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:@"http://172.16.81.127:3000/api/v1/auth/google"]];
        [request setHTTPMethod:@"POST"];
        
        
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
        
        NSMutableDictionary * modelDictionary = [NSMutableDictionary new];
//        modelDictionary[@"fb_access_token"] = user.profile.email;
//        modelDictionary[@"fb_user_id"] = user.authentication.idToken;
        
        
        NSError *writeError;
        
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:modelDictionary options:NSJSONWritingPrettyPrinted error:&writeError];
        
        NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[jsonData length]];
        
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setHTTPBody:jsonData];
        
        NSURLSessionDataTask *requestTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
            
            if (error == nil && (httpResponse.statusCode >= 200 && httpResponse.statusCode < 400)){
                NSDictionary *jData =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
                NSLog(@"Data = %@", jData);
                
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                
                // set the value
                [defaults setObject:jData[@"token"] forKey:@"token"];
                [defaults synchronize];
                
                [self.navigationController pushViewController:[[ViewController alloc] init] animated:YES];
                
            }
            else {
                
            }
        }];
        
        [requestTask resume];
        

        
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
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://172.16.81.127:3000/api/v1/auth/google"]];
    [request setHTTPMethod:@"POST"];
    
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    
    NSMutableDictionary * modelDictionary = [NSMutableDictionary new];
    modelDictionary[@"email"] = user.profile.email;
    modelDictionary[@"google_id_token"] = user.authentication.idToken;
    
    
    NSError *writeError;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:modelDictionary options:NSJSONWritingPrettyPrinted error:&writeError];
    
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[jsonData length]];
    
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:jsonData];
    
    NSURLSessionDataTask *requestTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        
        if (error == nil && (httpResponse.statusCode >= 200 && httpResponse.statusCode < 400)){
            NSDictionary *jData =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            NSLog(@"Data = %@", jData);
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            // set the value
            [defaults setObject:jData[@"token"] forKey:@"token"];
            [defaults synchronize];
            
            [self.navigationController pushViewController:[[ViewController alloc] init] animated:YES];
            
            }
        else {
          
        }
    }];
    
    [requestTask resume];
}

- (void)signIn:(GIDSignIn *)signIn
didDisconnectWithUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    NSLog(@"Disconnect");
}


- (void)signIn:(GIDSignIn *)signIn presentViewController:(UIViewController *)viewController {
    [self presentViewController:viewController animated:YES completion:nil];
}

// If implemented, this method will be invoked when sign in needs to dismiss a view controller.
// Typically, this should be implemented by calling |dismissViewController| on the passed
// view controller.
- (void)signIn:(GIDSignIn *)signIn dismissViewController:(UIViewController *)viewController{
    [viewController dismissViewControllerAnimated:YES completion:nil];
}

@end
