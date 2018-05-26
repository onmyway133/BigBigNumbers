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
import Vision

class ViewController: UIViewController {

  private let cameraController = CameraController()
  private let visionService = VisionService()
  private let boxService = BoxService()

  override func viewDidLoad() {
    super.viewDidLoad()

    cameraController.delegate = self
    add(childController: cameraController)
    activate(
      cameraController.view.anchor.edges
    )

    visionService.delegate = self
    boxService.delegate = self
  }
}

extension ViewController: CameraControllerDelegate {
  func cameraController(_ controller: CameraController, didCapture buffer: CMSampleBuffer) {
    visionService.handle(buffer: buffer)
  }
}

extension ViewController: VisionServiceDelegate {
  func visionService(_ version: VisionService, didDetect image: UIImage, results: [VNTextObservation]) {
    boxService.handle(
      cameraLayer: cameraController.cameraLayer,
      image: image,
      results: results,
      on: cameraController.view
    )
  }
}

extension ViewController: BoxServiceDelegate {
  func boxService(_ service: BoxService, didDetect images: [UIImage]) {

  }
}
