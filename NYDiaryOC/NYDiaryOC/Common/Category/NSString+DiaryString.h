//
//  NSString+DiaryString.h
//  NYDiaryOC
//
//  Created by NiYao on 4/17/16.
//  Copyright © 2016 niyao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (DiaryString)

+ (NSString *)parameterStringWithParameters:(NSDictionary *)parameters;

- (CGFloat)heightForScreenWithFont:(UIFont *)font;

- (CGFloat)heightWithSize:(CGSize)size font:(UIFont *)font;

- (CGFloat)heightWithWidth:(CGFloat)width font:(UIFont *)font;

@end
