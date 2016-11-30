//
//  CanvasView.swift
//  Canvas
//
//  Created by 郭金涛 on 16/11/3.
//  Copyright © 2016年 Chausson. All rights reserved.
//

import UIKit

class CanvasView:UIView  {
    var price :Float = 0.0
    var width :Float = 0.0
    var height :Float = 0.0
    var color :UIColor?
    var texture :String = "CanvasView"
}
class PaperCanvasView: CanvasView {
    override var texture: String {
        get{
            return "Paper"
        }
        set{
            
        }
    }
    override var price: Float {
        get{
            return 100
        }
        set{
            
        }
    }
    
}
class OilCanvasView: CanvasView {
//    var texture: String? = "Oil"
//    var price: Float = 50
    override var texture: String {
        get{
            return "Oil"
        }
        set{
            
        }
    }
    override var price: Float {
        get{
            return 50
        }
        set{
            
        }
    }
    
}

func main() {
    let canvas:OilCanvasView =  OilCanvasView()
    ApplyHandler().sale(canvas)
}
