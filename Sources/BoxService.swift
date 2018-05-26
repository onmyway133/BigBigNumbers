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
  private var layers: [CAShapeLayer] = []

  func handle(results: [VNTextObservation], on view: UIView) {
    reset()

    layers = results.map({ result in
      let layer = CAShapeLayer()
      view.layer.addSublayer(layer)

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
