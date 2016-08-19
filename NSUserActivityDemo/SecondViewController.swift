//
//  SecondViewController.swift
//  NSUserActivityDemo
//
//  Created by David Johnson on 8/19/16.
//  Copyright © 2016 David Johnson. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView! {
    didSet {
      tableView.dataSource = self
      tableView.delegate = self
    }
  }
  
  let songs: [Song] = [
    Song(name: "Billion Dollar Babies", artist: "Alice Cooper"),
    Song(name: "Wolves", artist: "Kanye West"),
    Song(name: "Sound and Color", artist: "Alabama Shakes"),
    Song(name: "Death of a Interiour Decorator", artist: "Death Cab for Cutie")
  ]
  
  var selectedSong: Song!

  func displaySongDetails(song: Song) {
    selectedSong = song
    performSegueWithIdentifier("showSongDetail", sender: nil)
  }
}

extension SecondViewController: UITableViewDataSource {
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return songs.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell = UITableViewCell(style: .Subtitle, reuseIdentifier: nil)
    
    let song = songs[indexPath.row]
    
    cell.textLabel?.text = song.name
    cell.detailTextLabel?.text = song.artist
    
    cell.accessoryType = .DisclosureIndicator
    
    return cell
  }
}

extension SecondViewController: UITableViewDelegate {
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    displaySongDetails(songs[indexPath.row])
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    guard segue.identifier == "showSongDetail"
      else { return }
    
    guard let destinationVC = segue.destinationViewController as? SongDetailViewController
      else { return }
    
    destinationVC.song = selectedSong
  }
}