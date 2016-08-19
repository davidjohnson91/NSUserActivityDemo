//
//  FirstViewController.swift
//  NSUserActivityDemo
//
//  Created by David Johnson on 8/19/16.
//  Copyright © 2016 David Johnson. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    userActivity = NSUserActivity(activityType: "me.davidjohnson.view-first")
    userActivity?.title = "View First"
    
    userActivity?.eligibleForSearch = true
    userActivity?.eligibleForHandoff = false
    userActivity?.eligibleForPublicIndexing = true
  }

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
    userActivity?.becomeCurrent()
  }
  
  override func viewDidDisappear(animated: Bool) {
    super.viewDidDisappear(animated)
    
    userActivity?.resignCurrent()
  }
}

