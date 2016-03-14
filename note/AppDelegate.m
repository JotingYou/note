//
//  AppDelegate.m
//  note
//
//  Created by 姚家庆 on 16/2/29.
//  Copyright © 2016年 姚家庆. All rights reserved.
//

#import "AppDelegate.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
#import "WXApi.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import "WeiboSDK.h"


#define ShareAppKey @"fe8fa14a3d3d"


#define WXAppID @"wxeba4cdc4b8f19d65"
#define WXAppSecret @"d4624c36b6795d1d99dcf0547af5443d"


#define QQAppID @"1104911525"//QQAppID 1104911525   41DB9CA5 十六进制  1104982656

#define QQAppKey @"97ZPixmld9P8N4EB"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [ShareSDK registerApp:ShareAppKey activePlatforms:@[
                                                        @(SSDKPlatformTypeMail),
                                                        @(SSDKPlatformTypeSMS),
                                                        @(SSDKPlatformTypeCopy),
                                                        @(SSDKPlatformTypeWechat),
                                                        @(SSDKPlatformTypeQQ),
                                                       ] onImport:^(SSDKPlatformType platformType) {
                                                            switch (platformType)
                                                            {
                                                                case SSDKPlatformTypeWechat:
                                                                    [ShareSDKConnector connectWeChat:[WXApi class]];
                                                                    break;
                                                                case SSDKPlatformTypeQQ:
                                                                    [ShareSDKConnector connectQQ:[QQApiInterface class] tencentOAuthClass:[TencentOAuth class]];
                                                                    break;
                                                                case SSDKPlatformTypeSinaWeibo:
                                                                    [ShareSDKConnector connectWeibo:[WeiboSDK class]];
                                                                    break;
                                                                    //                                                               case SSDKPlatformTypeRenren:
                                                                    //                                                                   [ShareSDKConnector connectRenren:[RennClient class]];
                                                                    //                                                                   break;
                                                                default:
                                                                    break;
                                                            }
                                                        } onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo) {
                                                            switch (platformType)
                                                            {
                                                                case SSDKPlatformTypeSinaWeibo:
                                                                    //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
                                                                    [appInfo SSDKSetupSinaWeiboByAppKey:@"568898243"
                                                                                              appSecret:@"38a4f8204cc784f81f9f0daaf31e02e3"
                                                                                            redirectUri:@"http://www.sharesdk.cn"
                                                                                               authType:SSDKAuthTypeBoth];
                                                                    break;
                                                                case SSDKPlatformTypeWechat:
                                                                    [appInfo SSDKSetupWeChatByAppId:WXAppID
                                                                                          appSecret:WXAppSecret];
                                                                    break;
                                                                case SSDKPlatformTypeQQ:
                                                                    [appInfo SSDKSetupQQByAppId:QQAppID
                                                                                         appKey:QQAppKey
                                                                                       authType:SSDKAuthTypeBoth];
                                                                    break;
                                                                    //                                                               case SSDKPlatformTypeRenren:
                                                                    //                                                                   [appInfo        SSDKSetupRenRenByAppId:@"226427"
                                                                    //                                                                                                   appKey:@"fc5b8aed373c4c27a05b712acba0f8c3"
                                                                    //                                                                                                secretKey:@"f29df781abdd4f49beca5a2194676ca4"
                                                                    //                                                                                                 authType:SSDKAuthTypeBoth];
                                                                    //                                                                   break;
                                                                    //                                                               case SSDKPlatformTypeGooglePlus:
                                                                    //                                                                   [appInfo SSDKSetupGooglePlusByClientID:@"232554794995.apps.googleusercontent.com"
                                                                    //                                                                                             clientSecret:@"PEdFgtrMw97aCvf0joQj7EMk"
                                                                    //                                                                                              redirectUri:@"http://localhost"
                                                                    //                                                                                                 authType:SSDKAuthTypeBoth];
                                                                    //                                                                   break;
                                                                default:
                                                                    break;
                                                            }
                                                        }];
    /**社会化分享*/
    //    //1.添加微信应用  http://open.weixin.qq.com/
    //    [ShareSDK connectWeChatWithAppId:WXAppID
    //                           appSecret:WXAppSecret
    //                           wechatCls:[WXApi class]];
    //    
    //    //2.微信朋友圈    http://open.weixin.qq.com/
    //    [ShareSDK connectWeChatTimelineWithAppId:WXAppID appSecret:WXAppSecret wechatCls:[WXApi class]];
    //    
    //    //3.QQ   http://connect.qq.com/
    //    [ShareSDK connectQQWithAppId:QQAppID qqApiCls:[QQApiInterface class]];
    
    return YES;
}


//- (BOOL)application:(UIApplication *)application openURL:(nonnull NSURL *)url options:(nonnull NSDictionary<NSString *,id> *)options{
//    return YES;
//}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
