//
//  DiaryRefreshControl.h
//  NYDiaryOC
//
//  Created by NiYao on 4/21/16.
//  Copyright © 2016 niyao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DiaryRefreshControlState) {
    DiaryRefreshControlStateBeginRefresh,
    DiaryRefreshControlStateLoading,
    DiaryRefreshControlStateEndRefresh,
    DiaryRefreshControlStateCancle,
};

typedef void (^DiaryRefreshControlAction) (DiaryRefreshControlState refreshState);

@interface DiaryRefreshControl : UIView
@property (nonatomic, strong) UIView *customView;

- (void)setupRefreshControlAction:(DiaryRefreshControlAction)action;

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;

@end
