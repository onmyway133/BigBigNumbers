//
//  OCRService.swift
//  BigBigNumbers
//
//  Created by Khoa Pham on 26.05.2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import SwiftOCR

final class OCRService {
  private let instance = SwiftOCR()

  func handle(images: [UIImage]) {
    images.forEach { image in
      instance.recognize(image, { string in
        print(string)
      })
    }
  }
}
