//
//  DiaryRequest.m
//  NYDiaryOC
//
//  Created by 倪瑶 on 4/1/16.
//  Copyright © 2016 niyao. All rights reserved.
//

#import "DiaryRequest.h"
#import "NYDiaryDefinition.h"
#import "NSString+DiaryString.h"

@implementation DiaryRequest

- (void)requestWithMethod:(NSString *)method
                      url:(NSString *)url
            urlParameters:(NSDictionary *)urlParameters
           jsonParameters:(NSDictionary *)jsonParameters
                  success:(DiaryRequestSuccess)success
                  failure:(DiaryRequestFailure)failure {
    NSString *parameterString = [NSString parameterStringWithParameters:urlParameters];
    NSString *urlString = [NSString stringWithFormat:@"%@%@%@", REQUEST_BASE_URL, url, parameterString];
    NSURL *URL = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    request.HTTPMethod = method;
    
    if (jsonParameters) {
        NSData *body = [NSJSONSerialization dataWithJSONObject:jsonParameters
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:nil];
        request.HTTPBody = body;
    }
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *requestTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                if (failure != nil) {
                    failure(error);
                }
            } else {
                id object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                NSString *message = [object objectForKey:@"message"];
                id data = [object objectForKey:@"data"];
                if ([message isEqualToString:@"Success"]) {
                    if (success != nil) {
                        success(data);
                    }
                } else {
                    if (failure != nil) {
                        NSError *error = [NSError errorWithDomain:@"Request" code:1001 userInfo:@{NSLocalizedDescriptionKey:message}];
                        failure(error);
                    }
                }
                
            }
        });
    }];
    
    [requestTask resume];
}

@end
