//
//  UIViewController+DiaryAlert.m
//  NYDiaryOC
//
//  Created by 倪瑶 on 4/1/16.
//  Copyright © 2016 niyao. All rights reserved.
//

#import "UIViewController+DiaryAlert.h"

@implementation UIViewController (DiaryAlert)

- (void)alertWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

@end
