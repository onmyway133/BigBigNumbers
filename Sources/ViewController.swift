//
//  ViewController.swift
//  BigBigNumbers
//
//  Created by Khoa Pham on 26.05.2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import UIKit
import Anchors
import AVFoundation

class ViewController: UIViewController {

  private let cameraController = CameraController()

  override func viewDidLoad() {
    super.viewDidLoad()

    cameraController.delegate = self
    add(childController: cameraController)
    activate(
      cameraController.view.anchor.edges
    )
  }
}

extension ViewController: CameraControllerDelegate {
  func cameraController(_ controller: CameraController, didCapture buffer: CMSampleBuffer) {

  }
}
