//
//  NYDiaryDefinition.h
//  NYDiaryOC
//
//  Created by 倪瑶 on 4/1/16.
//  Copyright © 2016 niyao. All rights reserved.
//

#ifdef Debug

#define EVIRONMENT_DEPLOYMENT_DEVELOPMENT 1

#else

#define EVIRONMENT_DEPLOYMENT_DEVELOPMENT 0

#endif

#define USER_DEFAULT_KEY_PASSWORD @"userDefaultKeyPasswordKey"

//Request
#define REQUEST_BASE_URL         @"http://nycode.sinaapp.com/nydiary/api/"
#define REQUEST_URL_QUERY        @"query.php"
#define REQUEST_URL_INSERT       @"insert.php"
#define REQUEST_HTTP_METHOD_GET  @"GET"
#define REQUEST_HTTP_METHOD_POST @"POST"