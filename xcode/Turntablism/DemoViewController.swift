//
//  DemoViewController.swift
//
//
//  Created by Thibault Maekelbergh on 15/05/16.
//
//

import UIKit

class DemoViewController: UIViewController {

  @IBOutlet weak var imageview: UIImageView!

  // MARK: - Load & Unload image to the view
  override func viewDidLoad() {
    super.viewDidLoad()
    imageview.image = UIImage(named: "tt-black")
  }

  // MARK: - Set navigation title for this tab
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.tabBarController?.navigationItem.title = "PLX-1000 Demo Mode"
  }

  // MARK: - Reset the image when the tab switches
  override func viewDidDisappear(animated: Bool) {
    changeImage("black")
  }

  // MARK: - Dynamically change image trough sent color param
  func changeImage(color: String) {
    switch color {
    case "magenta":
      imageview.image = UIImage(named: "tt-black-magenta")
    case "yellow":
      imageview.image = UIImage(named: "tt-black-yellow")
    case "green":
      imageview.image = UIImage(named: "tt-black-green")
    case "orange":
      imageview.image = UIImage(named: "tt-black-orange")
    case "black":
      imageview.image = UIImage(named: "tt-black")
    default:
      imageview.image = UIImage(named: "tt-black")
    }

    //    print("Color selected: \(color)")
  }

  @IBAction func resetButton(sender: UIButton) {
    changeImage("black")
  }

  @IBAction func buttonMagenta(sender: UIButton) {
    changeImage("magenta")
  }

  @IBAction func buttonYellow(sender: UIButton) {
    changeImage("yellow")
  }

  @IBAction func buttonOrange(sender: UIButton) {
    changeImage("orange")
  }

  @IBAction func buttonGreen(sender: UIButton) {
    changeImage("green")
  }

}
