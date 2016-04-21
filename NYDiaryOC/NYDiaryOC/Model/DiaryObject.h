//
//  DiaryObject.h
//  NYDiaryOC
//
//  Created by NiYao on 4/4/16.
//  Copyright © 2016 niyao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DiaryObject : NSObject

@property (nonatomic, copy  ) NSString *title;
@property (nonatomic, copy  ) NSString *content;
@property (nonatomic, copy  ) NSString *date;
@property (nonatomic, copy  ) NSString *userName;
@property (nonatomic, strong) NSNumber *diaryID;

@end

