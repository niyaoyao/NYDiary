//
//  DiaryAddNewViewController.m
//  NYDiaryOC
//
//  Created by NiYao on 4/22/16.
//  Copyright © 2016 niyao. All rights reserved.
//

#import "DiaryAddNewViewController.h"

@interface DiaryAddNewViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;

@end

@implementation DiaryAddNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

#pragma mark - UI

- (void)setupUI {
    [self setupContentTextView];
}

- (void)setupContentTextView {
    self.contentTextView.layer.borderColor   = [UIColor lightGrayColor].CGColor;
    self.contentTextView.layer.borderWidth   = 1.0;
    self.contentTextView.layer.masksToBounds = YES;
    self.contentTextView.layer.cornerRadius  = 5.0;
}

- (IBAction)completeDiaryDataForm:(id)sender {
    
}

@end
