//
//  DiaryRequest.h
//  NYDiaryOC
//
//  Created by 倪瑶 on 4/1/16.
//  Copyright © 2016 niyao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^DiaryRequestSuccess) (id response);
typedef void(^DiaryRequestFailure) (NSError *error);

@interface DiaryRequest : NSObject

/**
 *  网络请求方法
 *
 *  @param method  请求方式
 *  @param url     请求的 API 地址
 *  @param parameters 请求的参数字典类型
 *  @param success 成功回调
 *  @param failure 失败回调
 */
- (void)requestWithMethod:(NSString *)method
                      url:(NSString *)url
            urlParameters:(NSDictionary *)urlParameters
           jsonParameters:(NSDictionary *)jsonParameters
                  success:(DiaryRequestSuccess)success
                  failure:(DiaryRequestFailure)failure;
@end
