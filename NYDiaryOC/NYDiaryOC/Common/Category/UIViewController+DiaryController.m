//
//  UIViewController+DiaryController.m
//  NYDiaryOC
//
//  Created by NiYao on 4/27/16.
//  Copyright © 2016 niyao. All rights reserved.
//

#import "UIViewController+DiaryController.h"

@implementation UIViewController (DiaryController)

- (void)makeViewEndEditing {
    [self.view endEditing:YES];
}

- (void)showError:(NSError *)error {
    NSString *errorMessage = error.userInfo[NSLocalizedDescriptionKey];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:errorMessage
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)showMessage:(NSString *)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Information"
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

@end
