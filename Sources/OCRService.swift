//
//  OCRService.swift
//  BigBigNumbers
//
//  Created by Khoa Pham on 26.05.2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import SwiftOCR
import TesseractOCR

protocol OCRServiceDelegate: class {
  func ocrService(_ service: OCRService, didDetect texts: [String])
}

final class OCRService {
  private let instance = SwiftOCR()
  private let tesseract = G8Tesseract(language: "eng")!

  weak var delegate: OCRServiceDelegate?

  init() {
    tesseract.engineMode = .tesseractOnly
    tesseract.pageSegmentationMode = .auto
  }

  func handle(images: [UIImage]) {
    handleWithTesseract(images: images)
  }

  private func handleWithSwiftOCR(images: [UIImage]) {
    images.forEach { image in
      instance.recognize(image, { string in
        print(string)
      })
    }
  }

  private func handleWithTesseract(images: [UIImage]) {
    let texts: [String] = images.compactMap({ image in
      tesseract.image = image.g8_blackAndWhite()
      tesseract.recognize()
      return tesseract.recognizedText
    })

    delegate?.ocrService(self, didDetect: texts)
  }
}
