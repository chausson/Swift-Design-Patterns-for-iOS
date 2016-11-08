//
//  CanvasView.swift
//  Canvas
//
//  Created by 郭金涛 on 16/11/3.
//  Copyright © 2016年 Chausson. All rights reserved.
//

import UIKit

class CanvasView:UIView  {
    var price :Float
    var width :Float
    var height :Float
    var color :UIColor
    var texture :String
}
class PaperCanvasView: CanvasView {
    var texture: String = "Paper"
    var price: Float = 100
    
}
class OilCanvasView: CanvasView {
    var texture: String = "Oil"
    var price: Float = 50
    
}
