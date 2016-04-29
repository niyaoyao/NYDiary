//
//  UIViewController+DiaryController.h
//  NYDiaryOC
//
//  Created by NiYao on 4/27/16.
//  Copyright © 2016 niyao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (DiaryController)
/**
 *  结束编辑
 */
- (void)makeViewEndEditing;
/**
 *  显示报错
 *
 *  @param error 错误实例
 */
- (void)showError:(NSError *)error;
@end
