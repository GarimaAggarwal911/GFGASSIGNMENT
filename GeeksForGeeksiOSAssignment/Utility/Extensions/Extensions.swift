//
//  Extensions.swift
//  GeeksForGeeksiOSAssignment
//
//  Created by Vibes Com on 23/07/21.
//  Copyright © 2021 garima. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
  func addCharacterSpacing(kernValue: Double = 3.15) {
    if let labelText = text, labelText.count > 0 {
      let attributedString = NSMutableAttributedString(string: labelText)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: attributedString.length - 1))
      attributedText = attributedString
    }
  }
}
