//
//  AppDelegate.swift
//  IMcloudTest
//
//  Created by Anson on 2017/5/23.
//  Copyright © 2017年 Anson. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, RCIMUserInfoDataSource {

    var window: UIWindow?

    func getUserInfo(withUserId userId: String!, completion: ((RCUserInfo?) -> Void)!) {
        let userInfo = RCUserInfo()
        userInfo.userId = userId
        switch userId {
        case "Anson":
            userInfo.name = "安"
            userInfo.portraitUri = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495639170366&di=bafef3e472f39125abaa587b9ddbebce&imgtype=0&src=http%3A%2F%2Fwww.ysg88.com%2FUploadFiles%2FFCK%2F2014-08%2F201408110V06J8L4J4.jpg"
            NSLog("用户1")
        case "Anson1":
            userInfo.name = "安"
            userInfo.portraitUri = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495639170366&di=bafef3e472f39125abaa587b9ddbebce&imgtype=0&src=http%3A%2F%2Fwww.ysg88.com%2FUploadFiles%2FFCK%2F2014-08%2F201408110V06J8L4J4.jpg"
            NSLog("用户2")
        default:
            NSLog("无此用户")
        }
        return completion(userInfo)
    }
    
    func connectServer(completion:@escaping ()->Void){
        //let deviceTokenCache = UserDefaults.standard.object(forKey: "kDeviceToken") as? String;
        RCIM.shared().initWithAppKey("pvxdm17jpg6tr");
        
        RCIM.shared().connect(withToken: "ACvSPz/bc2B39gGeJBf8eSUQ9ylX+LJnJqGNHWe76fkeWyW/7cJYl4OM/UPNgG539BJPbaX/SOohZcLjEnnVoA==", success: {(_)->Void in print("连接成功")
            let currentUser = RCUserInfo(userId: "Anson1", name: "安", portrait: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495639170366&di=bafef3e472f39125abaa587b9ddbebce&imgtype=0&src=http%3A%2F%2Fwww.ysg88.com%2FUploadFiles%2FFCK%2F2014-08%2F201408110V06J8L4J4.jpg")
            RCIMClient.shared().currentUserInfo = currentUser
            //print("链接成功1")
            //异步操作线程
            
            DispatchQueue.main.async(execute: {()->Void
                in  completion()})
        }, error: { (_)->Void in print("连接失败")}) {
            (_)->Void in print("Token不正确")
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //查询保存的token
        
        
        RCIM.shared().userInfoDataSource = self
        
       
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

