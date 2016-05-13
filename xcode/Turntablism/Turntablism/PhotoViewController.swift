//
//  PhotoViewController.swift
//  Turntablism
//
//  Created by Thibault Maekelbergh on 11/05/16.
//  Copyright © 2016 Thibault Maekelbergh. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  
  var index = 0
  
  var photo:Photo!
  var photoImage:UIImage {
    return UIImage(named: photo.fileName)!
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imageView.image = photoImage
  }
}
