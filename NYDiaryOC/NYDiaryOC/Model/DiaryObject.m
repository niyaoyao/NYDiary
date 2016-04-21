//
//  DiaryObject.m
//  NYDiaryOC
//
//  Created by NiYao on 4/4/16.
//  Copyright © 2016 niyao. All rights reserved.
//

#import "DiaryObject.h"
#import "NSObject+DiaryObject.h"

@implementation DiaryObject

+ (NSDictionary *)propertyMapper {
    return @{
             @"user" : @"userName",
             @"id" : @"diaryID"
             };
}

@end
