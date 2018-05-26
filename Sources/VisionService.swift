//
//  VisionService.swift
//  BigBigNumbers
//
//  Created by Khoa Pham on 26.05.2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import Vision
import AVFoundation

final class VisionService {

  func handle(buffer: CMSampleBuffer) {
    guard
      let pixelBuffer = CMSampleBufferGetImageBuffer(buffer)
    else {
      return
    }

    makeRequest(pixelBuffer: pixelBuffer)
  }

  private func makeRequest(pixelBuffer: CVPixelBuffer) {
    let handler = VNImageRequestHandler(
      cvPixelBuffer: pixelBuffer,
      options: [VNImageOption: Any]()
    )

    let request = VNDetectTextRectanglesRequest(completionHandler: { [weak self] request, error in
      self?.handle(request: request, error: error)
    })

    request.reportCharacterBoxes = true
    do {
      try handler.perform([request])
    } catch {
      print(error as Any)
    }
  }

  private func handle(request: VNRequest, error: Error?) {
    guard
      let results = request.results as? [VNTextObservation]
    else {
      return
    }
    
  }
}
