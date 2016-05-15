//
//  VideosViewController.swift
//  Turntablism
//
//  Created by Thibault Maekelbergh on 14/05/16.
//  Copyright © 2016 Thibault Maekelbergh. All rights reserved.
//

import UIKit
import YouTubePlayer

class VideosViewController: UIViewController {

  @IBOutlet weak var video1: YouTubePlayerView!
  @IBOutlet weak var video2: YouTubePlayerView!

  override func viewDidLoad() {
    super.viewDidLoad()
    video1.loadVideoID("rMF0pYZfuQk")
    video2.loadVideoID("Rq1n2M4hGCw")
  }

  // MARK: - Set navigation title for this tab
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.tabBarController?.navigationItem.title = "PLX-1000 Product Videos"
  }

}
