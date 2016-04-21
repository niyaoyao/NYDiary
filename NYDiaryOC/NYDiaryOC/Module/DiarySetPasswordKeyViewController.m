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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setPasswordComplete:(id)sender {
    if (self.passwordTextField.text.length == 0) {
        [self alertWithTitle:@"Password" message:@"nil"];
    } else {
        [DiaryManager sharedManager].passwordKey = self.passwordTextField.text;
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
