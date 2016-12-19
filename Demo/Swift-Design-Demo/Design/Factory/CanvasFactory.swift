//
//  CanvasFactory.swift
//  Canvas
//
//  Copyright © 2016年 Chausson. All rights reserved.
//

import Foundation
class CanvasFactory: NSObject {
    class func normalCanvas() -> CanvasView {
        let view = CanvasView()
        view.price = 5
        return view
    }
    
    class func cheapCanvas() -> CanvasView {
        let view = CanvasView()
        view.price = 0.5
        return view
    }
    
}
class OilCanvasFactory: CanvasFactory {
    override class func normalCanvas() -> OilCanvasView {
        let view = OilCanvasView()
        view.author = "作者"
        view.price = 1000
        return view
    }
    override class func cheapCanvas() -> OilCanvasView {
        let view = OilCanvasView()
        view.price = 50
        return view
    }
}
class PaperCanvasFactory: CanvasFactory {
    override class func normalCanvas() -> PaperCanvasView {
        let view = PaperCanvasView()
        view.price = 1
        return view
    }
    override class func cheapCanvas() -> PaperCanvasView {
        let view = PaperCanvasView()
        view.price = 0.5
        return view
    }
}
