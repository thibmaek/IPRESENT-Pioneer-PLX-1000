//
//  SliderViewController.swift
//  Turntablism
//
//  Created by Thibault Maekelbergh on 11/05/16.
//  Copyright © 2016 Thibault Maekelbergh. All rights reserved.
//

import UIKit

struct Photo {
  let fileName:String
}

class SliderViewController: UIViewController, UIPageViewControllerDataSource {
  
    var pageViewController:UIPageViewController!
    var photoViewControllers = [PhotoViewController]()
  
    var currentPhotoViewController:PhotoViewController!

    override func viewDidLoad() {
      super.viewDidLoad()
      
      let photo1 = Photo(fileName: "Glam1")
      let photo2 = Photo(fileName: "Glam2")
      let photo3 = Photo(fileName: "Glam3")
      
      let photos = [photo1, photo2, photo3]
      
      for(index, photo) in photos.enumerate() {
        let photoVC = storyboard?.instantiateViewControllerWithIdentifier("PhotoViewController") as! PhotoViewController
        photoVC.photo = photo
        photoVC.index = index
        
        photoViewControllers.append(photoVC)
      }
      
      let firstPhotoViewController = photoViewControllers.first
      
      pageViewController.setViewControllers([firstPhotoViewController!], direction: .Forward, animated: true, completion: nil)
      pageViewController.dataSource = self
      
      currentPhotoViewController = photoViewControllers[0]
    }
  
    // MARK: - Segue methods
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      if(segue.identifier == "sgPageController"){
        pageViewController = segue.destinationViewController as! UIPageViewController
      }
    }
  
    // MARK: - Pagination methods
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
      let pageVC = viewController as! PhotoViewController
      let prevPageIndex = pageVC.index - 1
      
      if prevPageIndex < 0 {
        return nil
      }
      
      currentPhotoViewController = photoViewControllers[prevPageIndex]
      return photoViewControllers[prevPageIndex]
    }
  
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
      let pageVC = viewController as! PhotoViewController
      let nextPageIndex = pageVC.index + 1
      
      if nextPageIndex > photoViewControllers.count - 1 {
        return nil
      }
      
      currentPhotoViewController = photoViewControllers[nextPageIndex]
      return photoViewControllers[nextPageIndex]
    }
  
}
