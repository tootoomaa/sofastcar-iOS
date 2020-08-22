//
//  AppDelegate.swift
//  sofastcar
//
//  Created by 김광수 on 2020/08/21.
//  Copyright © 2020 김광수. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    let viewContoller = ViewController()
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = viewContoller
    window?.makeKeyAndVisible()
    
    return true
  }
}
