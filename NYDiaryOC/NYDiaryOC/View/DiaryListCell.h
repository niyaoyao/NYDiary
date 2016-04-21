//
//  DiaryListCell.h
//  NYDiaryOC
//
//  Created by NiYao on 4/17/16.
//  Copyright © 2016 niyao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DiaryObject;

@interface DiaryListCell : UITableViewCell

- (void)updateWithDiary:(DiaryObject *)diary;
+ (CGFloat)heightWithDiary:(DiaryObject *)diary;

@end
