//
//  AppDelegate.swift
//  NSUserActivityDemo
//
//  Created by David Johnson on 8/19/16.
//  Copyright © 2016 David Johnson. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Override point for customization after application launch.
    return true
  }

  func application(application: UIApplication, continueUserActivity userActivity: NSUserActivity, restorationHandler: ([AnyObject]?) -> Void) -> Bool {
    
    guard let tabBar = window?.rootViewController as? UITabBarController
      else { return false }
    
    switch userActivity.activityType {
    case "me.davidjohnson.view-first":
      tabBar.selectedIndex = 0
      return true
      
    case "me.davidjohnson.view-song":
      
      tabBar.selectedIndex = 1
      
      guard let songListVC = tabBar.viewControllers?.last?.childViewControllers.first as? SecondViewController
        else { return false }
      
      guard let songName = userActivity.userInfo?["songName"] as? String,
        let artistName = userActivity.userInfo?["artistName"] as? String
        else { return false }
      
      let song = Song(name: songName, artist: artistName)
      
      songListVC.displaySongDetails(song)
      
      return true
    
    default:
      return false
    }
  }
}

