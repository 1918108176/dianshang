//
//  UMThirdLogin.m
//  电商 项目
//
//  Created by ma c on 16/6/21.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "UMThirdLogin.h"

@implementation UMThirdLogin

+ (void)qqVC:(UIViewController *)VC withMethod:(loginSucess)qqSucess error:(loginError)qqError {
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
    snsPlatform.loginClickHandler(VC,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        //获取微博用户名、uid、token等
        if (response.responseCode == UMSResponseCodeSuccess) {
            NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
            if (qqSucess) {
                qqSucess(dict);
            }
        }else{
            if (qqError) {
                qqError();
            }
        }
    });
}

@end
