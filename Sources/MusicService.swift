//
//  MusicService.swift
//  BigBigNumbers
//
//  Created by Khoa Pham on 26.05.2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import Foundation
import AVFoundation

final class MusicService {

  private let player = AVPlayer()

  func handle(texts: [String]) {
    let numbers = texts.compactMap({ parseNumber(text: $0) })
    handle(numbers: numbers)
  }

  private func handle(numbers: [Int]) {
    play(fileName: "7")
  }

  func play(fileName: String) {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: "m4a") else {
      return
    }

    let item = AVPlayerItem(url: url)
    player.replaceCurrentItem(with: item)
    player.play()
  }

  private func parseNumber(text: String) -> Int? {
    let characters = text
      .replacingOccurrences(of: "\n", with: "")
      .filter({ "0"..."9" ~= $0 })

    return Int(String(characters))
  }
}
