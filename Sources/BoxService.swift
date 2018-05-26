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

  func handle(results: [VNTextObservation], on view: UIView) {
    reset()

    layers = results.map({ result in
      let layer = CAShapeLayer()
      view.layer.addSublayer(layer)
      layer.borderWidth = 2
      layer.borderColor = UIColor.green.cgColor

      let rect = CGRect(
        x: result.boundingBox.minX * view.bounds.size.width,
        y: result.boundingBox.minY * view.bounds.size.height,
        width: (result.boundingBox.maxX - result.boundingBox.minX) * view.bounds.size.width,
        height: (result.boundingBox.maxY - result.boundingBox.minY) * view.bounds.size.height
      )

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
