//
//  SongDetailViewController.swift
//  NSUserActivityDemo
//
//  Created by David Johnson on 8/19/16.
//  Copyright © 2016 David Johnson. All rights reserved.
//

import UIKit
import CoreSpotlight

class SongDetailViewController: UIViewController {
  
  @IBOutlet weak var songNameLabel: UILabel!
  @IBOutlet weak var artistNameLabel: UILabel!
  
  var song: Song!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    songNameLabel.text = song.name
    artistNameLabel.text = song.artist
    
    userActivity = NSUserActivity(activityType: "me.davidjohnson.view-song")
    userActivity?.title = song.name
    
    userActivity?.eligibleForSearch = true
    userActivity?.eligibleForHandoff = false
    userActivity?.eligibleForPublicIndexing = true
    
    let userInfo = [
      "songName": song.name,
      "artistName": song.artist
    ]
    
    userActivity?.addUserInfoEntriesFromDictionary(userInfo)
    
    let attributes = CSSearchableItemAttributeSet()
    attributes.title = song.name
    attributes.contentDescription = song.artist
    
    userActivity?.contentAttributeSet = attributes
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
