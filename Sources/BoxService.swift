//
//  BoxDrawer.swift
//  BigBigNumbers
//
//  Created by Khoa Pham on 26.05.2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import UIKit
import Vision

final class BoxService {
  private var layers: [CALayer] = []

  func handle(image: UIImage, results: [VNTextObservation], on view: UIView) {
    reset()

    layers = results.map({ result in
      let layer = CAShapeLayer()
      view.layer.addSublayer(layer)
      layer.borderWidth = 2
      layer.borderColor = UIColor.green.cgColor

      var transform = CGAffineTransform.identity
      transform = transform.scaledBy(x: image.size.width, y: -image.size.height)
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
