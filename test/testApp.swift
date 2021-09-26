//
//  testApp.swift
//  test
//
//  Created by interface on 2021/9/7.
//

import SwiftUI

@main
struct testApp: App {
    @Environment(\.scenePhase) var scenePhase
    
//    状态:是否显示首次启动
    @State var isShow:Bool = !UserDefaults.standard.bool(forKey: "isNotShowLaunch")
    
    var body: some Scene {
        WindowGroup {
            if isShow {
                myController()
            }else{
                ContentView()
            }
        }.onChange(of: scenePhase) { newScenePhase in
//            动态获取APP版本号
            guard let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] else { return }
            print(version)
            DispatchQueue.main.async {
                Thread.sleep(forTimeInterval: 4)
                isShow = false
                UserDefaults.standard.set(true, forKey: "isNotShowLaunch")
                print(UserDefaults.standard.bool(forKey: "isNotShowLaunch"))
            }
            
//            打开其他APP
//            let instagramHooks = "photos-redirect://"
//            let instagramUrl = URL(string: instagramHooks)!
//            if UIApplication.shared.canOpenURL(instagramUrl)
//            {
//                UIApplication.shared.open(instagramUrl)
//            } else {
//                //redirect to safari because the user doesn't have Instagram
//                UIApplication.shared.open(URL(string: "http://instagram.com/")!)
//            }
            
            
            switch newScenePhase {
            case .active:
              print("App is active")
            case .inactive:
              print("App is inactive")
            case .background:
              print("App is in background")
            @unknown default:
              print("Oh - interesting: I received an unexpected new value.")
            }
          }
    }
}



class AppDelegate:NSObject,UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        return true
    }
}
