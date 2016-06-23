//
//  UMThirdLogin.h
//  电商 项目
//
//  Created by ma c on 16/6/21.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UMSocial.h"

typedef void(^loginSucess)(NSDictionary *returnDict);
typedef void(^loginError)();
@interface UMThirdLogin : NSObject

+ (void)qqVC:(UIViewController *)VC withMethod:(loginSucess)qqSucess error:(loginError)qqError;

@end
