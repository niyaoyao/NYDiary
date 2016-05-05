//
//  NSString+DiaryString.m
//  NYDiaryOC
//
//  Created by NiYao on 4/17/16.
//  Copyright © 2016 niyao. All rights reserved.
//

#import "NSString+DiaryString.h"

@implementation NSString (DiaryString)

+ (NSString *)parameterStringWithParameters:(NSDictionary *)parameters {
    NSMutableString *parameterString = [[NSMutableString alloc] init];
    if(parameters.count > 0) {
        [parameterString appendString:@"?"];
    }
    NSArray *keys = parameters.allKeys;
    
    for (int i = 0 ; i < parameters.count; i++) {
        NSString *key = [keys objectAtIndex:i];
        NSValue *value = parameters[key];
        [parameterString appendString:[NSString stringWithFormat:@"%@=%@", key, value]];
        if ( i + 1 < parameters.count  ) {
            [parameterString appendString:@"&"];
        }
    }
    return parameterString;
}

- (CGFloat)heightWithSize:(CGSize)size font:(UIFont *)font {
    return [self boundingRectWithSize:size
                              options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                           attributes:@{NSFontAttributeName:font}
                              context:nil].size.height;
}

- (CGFloat)heightWithWidth:(CGFloat)width font:(UIFont *)font {
    return [self heightWithSize:CGSizeMake(width, MAXFLOAT)
                           font:font];
}

- (CGFloat)heightForScreenWithFont:(UIFont *)font {
    CGFloat maxWidth = [UIScreen mainScreen].bounds.size.width;
    return [self heightWithWidth:maxWidth font:font];
}

@end
