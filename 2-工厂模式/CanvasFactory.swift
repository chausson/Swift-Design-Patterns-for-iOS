//
//  CanvasFactory.swift
//  Canvas
//
//  Copyright © 2016年 Chausson. All rights reserved.
//

import UIKit
class CanvasFactory: NSObject {
    func normalCanvas() -> CanvasView {
        let view = CanvasView()
        return view
    }
    
    class func cheapCanvas() -> CanvasView {
        let view = CanvasView()
        view.price = 10
        return view
    }
    
}
public class OilCanvasFactory: CanvasFactory {
    class func normalCanvas() -> OilCanvasView {
        let view = OilCanvasView()
        return view
    }
}
public class PaperCanvasFactory: CanvasFactory {
    class func normalCanvas() -> PaperCanvasView {
        let view = PaperCanvasView()
        return view
    }
}
func main(){
    let paper = PaperCanvasFactory.normalCanvas()
    let oil = OilCanvasFactory.normalCanvas()
    let cheapOil  = OilCanvasFactory.cheapCanvas()
    let cheapPaper  = PaperCanvasFactory.cheapCanvas()
    
}
