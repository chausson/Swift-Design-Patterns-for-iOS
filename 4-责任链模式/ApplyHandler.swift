//
//  ApplyHandler.swift
//  Design
//
//  Created by Chausson on 16/11/23.
//  Copyright © 2016年 Chausson. All rights reserved.
//

import UIKit
protocol Sale {
     func sale(paint:CanvasView) -> Bool
}
//MARK: - 拍卖抽象类
class ApplyHandler: Sale {
    var nextHandler:ApplyHandler?
    func sale(paint:CanvasView) -> Bool {

        if let handler = nextHandler{
          return handler.sale(paint: paint)
        }else{
          return false
        }
        
    }
}

class PersonApplyHandler: ApplyHandler {
    override func sale(paint: CanvasView) -> Bool {
        if  paint.price > 0  && paint.price < 100{
            return true
        }else{
            return super.sale(paint: paint)
        }
    }
}
class FundApplyHandler: ApplyHandler {
    override func sale(paint: CanvasView) -> Bool {
        if  paint.price > 1000  && paint.price < 10000{
            return true
        }else{
            return super.sale(paint: paint)
        }
    }
}
class BankApplyHandler: ApplyHandler {
    override func sale(paint: CanvasView) -> Bool {
        if  paint.price > 10000  && paint.price < 100000{
            return true
        }else{
            return super.sale(paint: paint)
        }
    }
}
