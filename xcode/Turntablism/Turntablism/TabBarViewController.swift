//
//  TabBarViewController.swift
//  Turntablism
//
//  Created by Thibault Maekelbergh on 11/05/16.
//  Copyright © 2016 Thibault Maekelbergh. All rights reserved.
//

import UIKit
import UIColor_Hex_Swift

class TabBarViewController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()
    self.createActionButton()
    self.selectedIndex = 2
  }

  // MARK: - Create centered action button
  func createActionButton() {
    let actionButton = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
    var actionButtonFrame = actionButton.frame
    actionButtonFrame.origin.y = self.view.bounds.height - actionButtonFrame.height-5
    actionButtonFrame.origin.x = self.view.bounds.width/2 - actionButtonFrame.size.width/2
    actionButton.frame = actionButtonFrame

    actionButton.backgroundColor = UIColor.colorWithCSS("0f57c9")
    actionButton.layer.cornerRadius = actionButtonFrame.height/2
    self.view.addSubview(actionButton)

    actionButton.setImage(UIImage(named: "DemoModeIcon"), forState: UIControlState.Normal)
    actionButton.addTarget(self, action: #selector(TabBarViewController.showActionView(_:)), forControlEvents: UIControlEvents.TouchUpInside)

    self.view.layoutIfNeeded()
  }

  // MARK: - Define action
  func showActionView(sender: UIButton) {
    self.selectedIndex = 2
  }

}
