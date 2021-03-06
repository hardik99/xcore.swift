//
// UILabel+Extensions.swift
//
// Copyright © 2014 Zeeshan Mian
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

import UIKit

extension UILabel {
    open func setLineSpacing(_ spacing: CGFloat, text: String? = nil) {
        guard let text = text ?? self.text else { return }
        attributedText = NSMutableAttributedString(string: text).setLineSpacing(spacing)
    }
}

extension UILabel {
    /// A height of the label.
    open var boundingHeight: CGFloat {
        guard let font = font else {
            return 0
        }

        return "Sphinx".size(withFont: font).height * CGFloat(numberOfLines)
    }
}

// MARK: Underline

extension UILabel {
    @objc open func underline() {
        if let attributedText = attributedText {
            self.attributedText = NSMutableAttributedString(attributedString: attributedText).underline(attributedText.string)
        } else if let text = text {
            self.attributedText = NSMutableAttributedString(string: text).underline(text)
        }
    }
}
