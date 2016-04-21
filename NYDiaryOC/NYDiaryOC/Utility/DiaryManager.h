//
//  DiaryManager.h
//  NYDiaryOC
//
//  Created by 倪瑶 on 4/1/16.
//  Copyright © 2016 niyao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DiaryManager : NSObject
@property (nonatomic, copy) NSString *passwordKey;
/**
 *  应用管理单例
 *
 *  @return 单例
 */
+ (instancetype)sharedManager;

@end
