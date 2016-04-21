//
//  NSObject+DiaryObject.m
//  NYDiaryOC
//
//  Created by NiYao on 4/4/16.
//  Copyright © 2016 niyao. All rights reserved.
//

#import "NSObject+DiaryObject.h"

#import <objc/objc.h>
#import <objc/runtime.h>

@implementation NSObject (DiaryObject)

- (NSDictionary *)modelToDictionary {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    NSArray *allProperties = [[self class] getClassProperties];
    for (int i = 0; i < allProperties.count; i++) {
        NSValue *value = [self valueForKey:allProperties[i]];
        [dictionary setValue:value forKey:allProperties[i]];
    }
    
    return dictionary;
}

+ (NSArray *)getClassProperties {
    NSMutableArray *properties = [NSMutableArray array];
    u_int count = 0;
    objc_property_t * propertyList = class_copyPropertyList([self class], &count);
    
    for (int i = 0 ; i < count; i++) {
        const char * propertyName = property_getName(propertyList[i]);
        NSString *nameString = [NSString stringWithCString:propertyName
                                                  encoding:NSUTF8StringEncoding];
        [properties addObject:nameString];
        
    }
    return properties;
}

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary {
    id modelObject = [[self alloc] init];
    NSDictionary *mappers = [self propertyMapper];
    for (NSString *key in dictionary.allKeys) {
        NSString *modelKey = ([mappers valueForKey:key]) ? [mappers valueForKey:key] : key;
        [modelObject setValue:[dictionary objectForKey:key] forKeyPath:modelKey];
    }
    
    return modelObject;
}

+ (NSDictionary *)propertyMapper {
    return nil;
}

@end
