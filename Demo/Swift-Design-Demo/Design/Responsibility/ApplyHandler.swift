//
//  ApplyHandler.swift
//  Design
//
//  Created by Chausson on 16/11/23.
//  Copyright © 2016年 Chausson. All rights reserved.
//

import Foundation

protocol Sale {
    func sale(paint:CanvasView) -> Bool
    var name:String{ get }
    var applyPrice:(min:Float,max:Float){get}
}
//MARK: - 拍卖抽象类
class ApplyHandler: Sale {
    var nextHandler:ApplyHandler?
    var name: String {
        return ""
    }
    
    var applyPrice:(min:Float,max:Float){
        return (0,0)
    }
    func sale(paint:CanvasView) -> Bool {
        if  paint.price >= applyPrice.min  && paint.price < applyPrice.max{
            print("\(name)卖出了画 画的价格是\(paint.price)")
            return true
        }else{
            guard let handler = nextHandler else{
                return false
            }
            return handler.sale(paint: paint)
        }
        
    }
}

class PersonApplyHandler: ApplyHandler{
    override var name: String {
        return "个人"
    }
    override var applyPrice: (min: Float, max: Float){
        return (0,100)
    }
    
}
class FundApplyHandler: ApplyHandler {
    override var name: String {
        return "基金"
    }
    override var applyPrice: (min: Float, max: Float){
        return (100,1000)
    }
}
class BankApplyHandler: ApplyHandler {
    override var name: String {
        return "银行"
    }
    override var applyPrice: (min: Float, max: Float){
        return (1000,50000)
    }
}
