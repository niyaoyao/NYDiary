//
//  DiaryListCell.m
//  NYDiaryOC
//
//  Created by NiYao on 4/17/16.
//  Copyright © 2016 niyao. All rights reserved.
//

#import "DiaryListCell.h"
#import "DiaryObject.h"
#import "NSString+DiaryString.h"

#define FONT_17 [UIFont systemFontOfSize:17]
#define FONT_15 [UIFont systemFontOfSize:15]

@interface DiaryListCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;


@end

@implementation DiaryListCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)updateWithDiary:(DiaryObject *)diary {
    self.titleLabel.text   = diary.title;
    self.contentLabel.text = diary.content;
    self.nameLabel.text    = [NSString stringWithFormat:@"%@@%@", diary.userName, diary.date];
    self.titleLabel.font   = FONT_17;
    self.contentLabel.font = FONT_17;
    self.nameLabel.font    = FONT_17;
}

+ (CGFloat)heightWithDiary:(DiaryObject *)diary {
    CGFloat margin = 10.0;
    
    CGFloat titleLabelHeight   = [diary.title heightForScreenWithFont:FONT_17];
    CGFloat contentLabelHeight = [diary.content heightForScreenWithFont:FONT_17];
    CGFloat nameLabelHeight    = [diary.userName heightForScreenWithFont:FONT_17];
    CGFloat height             = titleLabelHeight + contentLabelHeight + nameLabelHeight + 3 * margin;
    return height;
}

@end
