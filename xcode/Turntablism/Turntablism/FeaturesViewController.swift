//
//  FeaturesViewController.swift
//  Turntablism
//
//  Created by Thibault Maekelbergh on 14/05/16.
//  Copyright © 2016 Thibault Maekelbergh. All rights reserved.
//

import UIKit

class FeaturesViewController: UIViewController {

  @IBOutlet weak var textview: UITextView!

  override func viewDidLoad() {
    super.viewDidLoad()
    textview.backgroundColor = UIColor.colorWithCSS("333")

    // MARK:- Create the Scrollview
    let scrollview = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height/2+100))
    view.addSubview(scrollview)

    //MARK:- Create images & add to the Scrollview
    var xPos = CGFloat(0)

    for index in 1...2 {
      let image = UIImage(named: String("Glam\(index)"))
      let imageview = UIImageView(image: image)
      imageview.frame = CGRectMake(xPos, 0, image!.size.width, image!.size.height)
      scrollview.addSubview(imageview)
      xPos = image!.size.width
      scrollview.contentSize = CGSizeMake(xPos, 0)
      scrollview.pagingEnabled = true
      scrollview.bounces = false
    }
  }

  // MARK: - Set navigation title for this tab
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    self.tabBarController?.navigationItem.title = "Pioneer PLX-1000 Key Features"
  }

}
