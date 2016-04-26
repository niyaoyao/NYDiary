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
#import "DiaryListCell.h"
#import "DiaryRefreshControl.h"

#import "DiaryRequest.h"
#import "NYDiaryDefinition.h"

static NSString * const reuseIdentifier = @"diaryCell";

@interface DiaryMainViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, assign) NSInteger           offset;
@property (nonatomic, strong) NSMutableArray      *diaries;
@property (nonatomic, strong) DiaryRefreshControl *refreshControl;
@property (nonatomic, assign) BOOL                isLoadingMore;

@end

@implementation DiaryMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupDatas];
    [self setupUI];
    
    if (![DiaryManager sharedManager].passwordKey) {
        DiarySetPasswordKeyViewController *setPwdVC =
        [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"DiarySetPasswordVC"];
        [self presentViewController:setPwdVC animated:YES completion:nil];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if ([DiaryManager sharedManager].passwordKey) {
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Data

- (void)setupDatas {
    self.offset = 0;
    self.diaries = [NSMutableArray array];
    [self getDiaries];
}

#pragma mark - UI

- (void)setupUI {
    [self setupRefreshControl];
}

- (void)setupRefreshControl {
    __weak typeof(self) weakSelf = self;
    self.refreshControl                 = [[DiaryRefreshControl alloc] init];
    self.refreshControl.frame           = CGRectMake(0, -150, self.view.frame.size.width, 150);
    [self.refreshControl setupRefreshControlAction:^(DiaryRefreshControlState refreshState) {
        switch (refreshState) {
            case DiaryRefreshControlStateBeginRefresh:
                [weakSelf getDiaries];
                break;
                
            default:
                break;
        }
    }];
    
    [self.tableView addSubview:self.refreshControl];
}

#pragma mark - Request 

- (void)getDiaries {
    __weak typeof (self) weakSelf = self;
    DiaryRequest *request = [[DiaryRequest alloc] init];
    [request requestWithMethod:REQUEST_HTTP_METHOD_GET url:REQUEST_URL_QUERY urlParameters:@{@"id" : @(self.offset)} jsonParameters:nil success:^(id response) {
        if (!weakSelf.isLoadingMore) {
            [weakSelf.diaries removeAllObjects];
        }
        NSArray *diaries = response;
        for (NSDictionary *diaryDic in diaries) {
            DiaryObject *diary = [DiaryObject modelWithDictionary:diaryDic];
            [self.diaries addObject:diary];
        }
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        if (error) {
            
        }
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.diaries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DiaryListCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier
                                                          forIndexPath:indexPath];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(DiaryListCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell updateWithDiary:self.diaries[indexPath.section]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [DiaryListCell heightWithDiary:self.diaries[indexPath.section]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20.0;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.refreshControl scrollViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self.refreshControl scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
}

@end
