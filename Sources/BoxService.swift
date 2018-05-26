//
//  BoxDrawer.swift
//  BigBigNumbers
//
//  Created by Khoa Pham on 26.05.2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import UIKit
import Vision

protocol BoxServiceDelegate: class {
  func boxService(_ service: BoxService, didDetect images: [UIImage])
}

final class BoxService {
  private var layers: [CALayer] = []

  weak var delegate: BoxServiceDelegate?

  func handle(image: UIImage, results: [VNTextObservation], on view: UIView) {
    reset()

    layers = results.map({ result in
      let layer = CALayer()
      view.layer.addSublayer(layer)
      layer.borderWidth = 2
      layer.borderColor = UIColor.green.cgColor

      var transform = CGAffineTransform.identity
      transform = transform.scaledBy(x: view.frame.size.width, y: -view.frame.size.height)
      transform = transform.translatedBy(x: 0, y: -1)

      let rect = result.boundingBox.applying(transform)
      layer.frame = rect

      return layer
    })
  }

  private func reset() {
    layers.forEach {
      $0.removeFromSuperlayer()
    }

    layers.removeAll()
  }
}
