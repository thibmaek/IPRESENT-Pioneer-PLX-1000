//
//  DemoViewController.swift
//
//
//  Created by Thibault Maekelbergh on 15/05/16.
//
//

import UIKit
import AVFoundation
import Social

class DemoViewController: UIViewController {

  @IBOutlet weak var imageview: UIImageView!
  var cameraview: UIView!

  // MARK:- Initialize vars for changing the led & model
  var model: String!
  var currentColor: String!

  // MARK:- Initialize vars for capturing video trough AVFoundation
  var videoDataOutput: AVCaptureVideoDataOutput!
  var videoDataOutputQueue: dispatch_queue_t!
  var cameraLayer: AVCaptureVideoPreviewLayer!
  var captureDevice: AVCaptureDevice!
  let session=AVCaptureSession()
  var currentFrame: CIImage!
  var done = false

  override func viewDidLoad() {
    // MARK: - Load & Unload image to the view
    super.viewDidLoad()
    currentColor = "blue"
    model = "black"
    imageview.image = UIImage(named: "tt-black")

    // MARK: - Create a new UIView as AVCapture background
    self.cameraview = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height))
    self.cameraview.contentMode = UIViewContentMode.ScaleAspectFill
    view.insertSubview(cameraview, belowSubview: imageview)

    self.setupAVCapture()
  }

  // MARK: - Set navigation title for this tab
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    if !done {session.startRunning()}
    self.tabBarController?.navigationItem.title = "PLX-1000 Demo Mode"
  }

  // MARK: - Reset the image when the tab switches
  override func viewDidDisappear(animated: Bool) {
    self.stopCamera()
    changeImage(currentColor, model: model)
  }

  override func didReceiveMemoryWarning() {
    self.stopCamera()
    let alert = UIAlertController(title: "Memory Warning", message: "Live preview stopped due to insufficient memory available for device.", preferredStyle: UIAlertControllerStyle.Alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
    self.presentViewController(alert, animated: true, completion: nil)
  }

  // MARK: - If the device rotates, make sure the AVCapture layer does too
  override func shouldAutorotate() -> Bool {
    if (UIDevice.currentDevice().orientation == UIDeviceOrientation.LandscapeLeft ||
      UIDevice.currentDevice().orientation == UIDeviceOrientation.LandscapeRight ||
      UIDevice.currentDevice().orientation == UIDeviceOrientation.Unknown) {
      return false
    } else {return true}
  }

  // MARK: - Dynamically change image trough sent color param
  func changeImage(color: String, model: String) {
    currentColor = color

    switch color {
    case "magenta":
      imageview.image = UIImage(named: "tt-\(model)-magenta")
    case "yellow":
      imageview.image = UIImage(named: "tt-\(model)-yellow")
    case "green":
      imageview.image = UIImage(named: "tt-\(model)-green")
    case "orange":
      imageview.image = UIImage(named: "tt-\(model)-orange")
    case "blue":
      imageview.image = UIImage(named: "tt-\(model)")
    default:
      imageview.image = UIImage(named: "tt-\(model)")
    }
  }

  @IBAction func modelChanged(sender: UISwitch) {
    if sender.on {
      model = "gold"
      changeImage(currentColor, model: model)
    } else {
      model = "black"
      changeImage(currentColor, model: model)
    }
  }


  // MARK:- IBActions for changing the LED
  @IBAction func resetButton(sender: UIButton) {
    changeImage("blue", model: model)
  }
  @IBAction func buttonMagenta(sender: UIButton) {
    changeImage("magenta", model: model)
  }
  @IBAction func buttonYellow(sender: UIButton) {
    changeImage("yellow", model: model)
  }
  @IBAction func buttonOrange(sender: UIButton) {
    changeImage("orange", model: model)
  }
  @IBAction func buttonGreen(sender: UIButton) {
    changeImage("green", model: model)
  }

  // MARK:- IBAction for sharing to Facebook
  @IBAction func shareButton(sender: UIButton) {
    if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
      let facebookview = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
      facebookview.addImage(imageview.image)
      presentViewController(facebookview, animated: true, completion: nil)
    } else {
      let alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: UIAlertControllerStyle.Alert)
      alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
      self.presentViewController(alert, animated: true, completion: nil)
    }
  }

}
