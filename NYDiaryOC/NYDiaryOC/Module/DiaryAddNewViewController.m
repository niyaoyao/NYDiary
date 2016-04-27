//
//  DiaryAddNewViewController.m
//  NYDiaryOC
//
//  Created by NiYao on 4/22/16.
//  Copyright © 2016 niyao. All rights reserved.
//

#import "DiaryAddNewViewController.h"
#import "UITextView+NYTextView.h"
#import "DiaryObject.h"
#import "DiaryRequest.h"
#import "NYDiaryDefinition.h"
#import "DiaryManager.h"
#import "UIViewController+DiaryController.h"

@interface DiaryAddNewViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *completeButton;

@end

@implementation DiaryAddNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

#pragma mark - UI

- (void)setupUI {
    [self setupContentTextView];
    [self setupGuesture];
}

- (void)setupGuesture {
    UITapGestureRecognizer *endEditingTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(makeViewEndEditing)];
    [self.view addGestureRecognizer:endEditingTap];
}



- (void)setupContentTextView {
    self.contentTextView.layer.borderColor   = [UIColor lightGrayColor].CGColor;
    self.contentTextView.layer.borderWidth   = 1.0;
    self.contentTextView.layer.masksToBounds = YES;
    self.contentTextView.layer.cornerRadius  = 5.0;
    
    CGFloat padding = 5;
    CGRect placeholderFrame = CGRectMake(padding, 0, self.contentTextView.bounds.size.width, 20);
    [self.contentTextView setupPlaceholderString:@"Please Enter Content" frame:placeholderFrame];
    [self.contentTextView setupShouldTextViewEndEditingWhenReturn:NO];
}

- (IBAction)completeDiaryDataForm:(id)sender {
    // need a request singleton
    [self makeViewEndEditing];
    self.completeButton.enabled = NO;
    __weak typeof (self) weakSelf = self;
    DiaryRequest *addNewDiary = [[DiaryRequest alloc] init];
    NSDictionary *parameter = @{
                                @"nykey" : [DiaryManager sharedManager].passwordKey,
                                @"diary_title" : self.titleTextField.text,
                                @"diary_content" : self.contentTextView.text
                                };
    [addNewDiary requestWithMethod:REQUEST_HTTP_METHOD_POST url:REQUEST_URL_INSERT urlParameters:nil jsonParameters:parameter success:^(id response) {
        if (response) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakSelf.navigationController popViewControllerAnimated:YES];
            });
        }
    } failure:^(NSError *error) {
        weakSelf.completeButton.enabled = YES;
    }];
}

@end
