//
//  CanvasView.swift
//  Canvas
//
//  Created by 郭金涛 on 16/11/3.
//  Copyright © 2016年 Chausson. All rights reserved.
//

import Foundation

class CanvasView:NSObject  {
    var price :Float = 0.0
    var width :Float = 0.0
    var height :Float = 0.0
    public var weight:Double{
        return 1.0
    }
    var color :String?
    var texture :String?
}
class PaperCanvasView: CanvasView {
    var pages:Int = 10
}
class OilCanvasView: CanvasView {
    var author:String?
    override public var weight: Double{
        return 50.0
    }
}
