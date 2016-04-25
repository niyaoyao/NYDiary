//
//  DiaryAddNewViewController.m
//  NYDiaryOC
//
//  Created by NiYao on 4/22/16.
//  Copyright © 2016 niyao. All rights reserved.
//

#import "DiaryAddNewViewController.h"
#import "UITextView+NYTextView.h"

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
    
    CGFloat padding = 5;
    CGRect placeholderFrame = CGRectMake(padding, 0, self.contentTextView.bounds.size.width, 20);
    [self.contentTextView setupPlaceholderString:@"Please Enter Content" frame:placeholderFrame];
}

- (IBAction)completeDiaryDataForm:(id)sender {
    
}

@end
