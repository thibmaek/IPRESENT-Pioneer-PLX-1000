//
//  AVDemoExtension.swift
//  Turntablism
//
//  Created by Thibault Maekelbergh on 15/05/16.
//  Copyright © 2016 Thibault Maekelbergh. All rights reserved.
//

import Foundation
import AVFoundation
import CoreImage

extension DemoViewController: AVCaptureVideoDataOutputSampleBufferDelegate {

  // MARK:- Check for device & support and set up an AVCaptureSession at 480p
  func setupAVCapture() {
    session.sessionPreset = AVCaptureSessionPreset640x480
    let devices = AVCaptureDevice.devices()

    for device in devices {
      if device.hasMediaType(AVMediaTypeVideo) {
        if device.position == AVCaptureDevicePosition.Back {
          captureDevice = device as? AVCaptureDevice
          if captureDevice != nil {beginSession();done = true;break;}
        }
      }
    }
  }

  func beginSession() {
    // MARK:- Try and capture input otherwise return an error
    var err: NSError? = nil
    var deviceInput: AVCaptureDeviceInput?

    do { deviceInput = try AVCaptureDeviceInput(device: captureDevice)
    } catch let error as NSError {err = error;deviceInput = nil;}
    if err != nil {print("error: \(err?.localizedDescription)")}

    if self.session.canAddInput(deviceInput) {
      self.session.addInput(deviceInput)
    }

    // MARK:- Assign the stream to videoDataOutput
    self.videoDataOutput = AVCaptureVideoDataOutput()
    self.videoDataOutput.alwaysDiscardsLateVideoFrames = true
    self.videoDataOutputQueue = dispatch_queue_create("VideoDataOutputQueue", DISPATCH_QUEUE_SERIAL)
    self.videoDataOutput.setSampleBufferDelegate(self, queue:self.videoDataOutputQueue)
    if session.canAddOutput(self.videoDataOutput) {session.addOutput(self.videoDataOutput)}
    self.videoDataOutput.connectionWithMediaType(AVMediaTypeVideo).enabled = true

    // MARK:- Assign the AVCaptureSession to cameraLayer
    self.cameraLayer = AVCaptureVideoPreviewLayer(session: self.session)
    self.cameraLayer.videoGravity = AVLayerVideoGravityResizeAspect

    // MARK:- Initialize a CALayer and set the cameraview, start the session
    let rootLayer: CALayer = self.cameraview.layer
    self.cameraLayer.frame = rootLayer.bounds
    rootLayer.addSublayer(self.cameraLayer)
    session.startRunning()
  }

  // MARK:- Set currentFrame to the current frame from the Stream buffe
  func captureOutput(captureOutput: AVCaptureOutput!, didOutputSampleBuffer sampleBuffer: CMSampleBuffer!, fromConnection connection: AVCaptureConnection!) {
    currentFrame = self.convertImageFromCMSampleBufferRef(sampleBuffer)
  }

  func stopCamera() {
    session.stopRunning()
    done = false
  }

  func convertImageFromCMSampleBufferRef(sampleBuffer: CMSampleBuffer) -> CIImage {
    let pixelBuffer: CVPixelBufferRef = CMSampleBufferGetImageBuffer(sampleBuffer)!
    let ciImage: CIImage = CIImage(CVPixelBuffer: pixelBuffer)
    return ciImage
  }
}
