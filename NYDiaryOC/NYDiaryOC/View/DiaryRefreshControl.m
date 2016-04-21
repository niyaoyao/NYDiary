//
//  DiaryRefreshControl.m
//  NYDiaryOC
//
//  Created by NiYao on 4/21/16.
//  Copyright © 2016 niyao. All rights reserved.
//

#import "DiaryRefreshControl.h"

@interface DiaryRefreshControl ()

@property (nonatomic, copy  ) DiaryRefreshControlAction action;
@property (nonatomic, strong) UILabel                   *refreshPromotion;

@end

@implementation DiaryRefreshControl

- (void)setupRefreshControlAction:(DiaryRefreshControlAction)action {
    self.action = action;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint offset = scrollView.contentOffset;
    CGFloat offsetY = offset.y;
    if ( offsetY > 100) {
        
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    CGPoint offset = scrollView.contentOffset;
    CGFloat offsetY = offset.y;
    if (offsetY < 120) {
        if (self.action != nil) {
            self.action(DiaryRefreshControlStateBeginRefresh);
        }
    }
    
}

@end
