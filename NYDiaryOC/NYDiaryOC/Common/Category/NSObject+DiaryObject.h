//
//  NSObject+DiaryObject.h
//  NYDiaryOC
//
//  Created by NiYao on 4/4/16.
//  Copyright © 2016 niyao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DiaryObject)

/**
 *  获得类属性
 *
 *  @return 属性数组
 */
+ (NSArray *)getClassProperties;

/**
 *  模型转字典
 *
 *  @return 字典数据
 */
- (NSDictionary *)modelToDictionary;

/**
 *  字典转模型
 *
 *  @param dictionary 字典
 *
 *  @return 模型实例
 */
+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary;

/**
 *  属性映射
 *
 *  @return 字典
 */
+ (NSDictionary *)propertyMapper;

@end
