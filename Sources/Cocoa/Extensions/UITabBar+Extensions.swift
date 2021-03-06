//
// UITabBar+Extensions.swift
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

extension UITabBar {
    private struct AssociatedKey {
        static var isTransparent = "isTransparent"
    }

    open var isTransparent: Bool {
        get { return associatedObject(&AssociatedKey.isTransparent, default: false) }
        set {
            guard newValue != isTransparent else { return }
            setAssociatedObject(&AssociatedKey.isTransparent, value: newValue)

            guard newValue else {
                backgroundImage = nil
                return
            }

            backgroundImage = UIImage()
            shadowImage = UIImage()
            isTranslucent = true
            backgroundColor = .clear
        }
    }

    open var isBorderHidden: Bool {
        get { return value(forKey: "_hidesShadow") as? Bool ?? false }
        set { setValue(newValue, forKey: "_hidesShadow") }
    }

    open func setBorder(color: UIColor, thickness: CGFloat = 1) {
        isBorderHidden = true
        addBorder(edges: .top, color: color, thickness: thickness)
    }
}
