//
//  DiaryMainViewController.m
//  NYDiaryOC
//
//  Created by 倪瑶 on 4/1/16.
//  Copyright © 2016 niyao. All rights reserved.
//

#import "DiaryMainViewController.h"
#import "DiaryManager.h"
#import "DiarySetPasswordKeyViewController.h"
#import "NSObject+DiaryObject.h"
#import "DiaryObject.h"

#import "DiaryRequest.h"
#import "NYDiaryDefinition.h"

static NSString * const reuseIdentifier = @"diaryCell";

@interface DiaryMainViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, assign) NSInteger offset;
@property (nonatomic, strong) NSMutableArray *diaries;

@end

@implementation DiaryMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.offset = 0;
    self.diaries = [NSMutableArray array];
    // Do any additional setup after loading the view.
    if (![DiaryManager sharedManager].passwordKey) {
        DiarySetPasswordKeyViewController *setPwdVC =
        [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"DiarySetPasswordVC"];
        [self presentViewController:setPwdVC animated:YES completion:nil];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if ([DiaryManager sharedManager].passwordKey) {
        DiaryRequest *request = [[DiaryRequest alloc] init];
        [request requestWithMethod:REQUEST_HTTP_METHOD_GET url:REQUEST_URL_QUERY urlParameters:@{@"id" : @(self.offset)} jsonParameters:nil success:^(id response) {
            NSArray *diaries = response;
            for (NSDictionary *diaryDic in diaries) {
                DiaryObject *diary = [DiaryObject modelWithDictionary:diaryDic];
                [self.diaries addObject:diary];
            }
            [self.tableView reloadData];
        } failure:^(NSError *error) {
            
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier
                                                            forIndexPath:indexPath];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.diaries.count;
}
@end
