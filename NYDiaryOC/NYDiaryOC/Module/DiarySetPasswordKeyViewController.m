//
//  DiarySetPasswordKeyViewController.m
//  NYDiaryOC
//
//  Created by 倪瑶 on 4/1/16.
//  Copyright © 2016 niyao. All rights reserved.
//

#import "DiarySetPasswordKeyViewController.h"
#import "DiaryManager.h"
#import "UIViewController+DiaryAlert.h"

@interface DiarySetPasswordKeyViewController ()
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation DiarySetPasswordKeyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)setPasswordComplete:(id)sender {
    if (self.passwordTextField.text.length == 0) {
        [self alertWithTitle:@"Password" message:@"nil"];
    } else {
        [DiaryManager sharedManager].passwordKey = self.passwordTextField.text;
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}

@end
