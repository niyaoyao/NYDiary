//
//  DiaryManager.m
//  NYDiaryOC
//
//  Created by 倪瑶 on 4/1/16.
//  Copyright © 2016 niyao. All rights reserved.
//

#import "DiaryManager.h"
#import "NYDiaryDefinition.h"

@implementation DiaryManager

@synthesize passwordKey = _passwordKey;

+ (instancetype)sharedManager {
    static DiaryManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

#pragma mark - getter / setter

- (NSString *)passwordKey {
    if (_passwordKey == nil) {
        _passwordKey = [[NSUserDefaults standardUserDefaults] objectForKey:USER_DEFAULT_KEY_PASSWORD];
    }
    return _passwordKey;
}

- (void)setPasswordKey:(NSString *)passwordKey {
    if (_passwordKey != passwordKey) {
        _passwordKey = passwordKey;
        [[NSUserDefaults standardUserDefaults] setObject:_passwordKey forKey:USER_DEFAULT_KEY_PASSWORD];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

@end
