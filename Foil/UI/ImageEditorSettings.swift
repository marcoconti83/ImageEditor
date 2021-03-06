//
//
// Copyright (c) 2018 Marco Conti
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
    

import Foundation

/// A callback invoked when a bitmap has been selected
public typealias BitmapPicker = (NSImage?)->()

public struct ImageEditorSettings<Reference: Hashable> {
    
    /// List of available
    public var possibleBitmaps: [NSImage] = []
    /// If true, bitmaps can be loaded from image files
    public var allowImagesFromFile: Bool = true
    /// A function to select a custom bitmap
    public var customBitmapPicker: ((BitmapPicker)->())? = nil
    /// Background image
    public var backgroundImage: NSImage? = nil
    /// Size of the canvas. If the size is not defined, it will use the
    /// background image size, if any.
    public var size: NSSize? = nil
    /// Additional toolbar items
    public var toolbarItems: [ToolbarItem<Reference>] = []
    
    public init() {}
    
    var canAddBitmap: Bool {
        return !self.possibleBitmaps.isEmpty
            || self.allowImagesFromFile
            || self.customBitmapPicker != nil
    }
}

public struct ToolbarItem<Reference: Hashable> {
    
    public typealias buttonCallback = (_ editView: ImageEditView<Reference>, _ button: NSButton)->()

    let icon: NSImage
    let tooltip: String
    let action: buttonCallback
    
    public init(icon: NSImage, tooltip: String, action: @escaping buttonCallback) {
        self.action = action
        self.icon = icon
        self.tooltip = tooltip
    }
}
