//
//  ResponsibilityTest.swift
//  Swift-Design-Demo
//
//  Created by Chausson on 2016/12/19.
//  Copyright © 2016年 Chausson. All rights reserved.
//

import XCTest
@testable import Swift_Design_Demo

class ResponsibilityTest: XCTestCase {
    var person:ApplyHandler = PersonApplyHandler()
    var fund:ApplyHandler = FundApplyHandler()
    var bank:ApplyHandler = BankApplyHandler()
    var cheapCanvas:PaperCanvasView = PaperCanvasFactory.normalCanvas()
    var oilCanvas:OilCanvasView = OilCanvasFactory.normalCanvas()
    override func setUp() {
        super.setUp()
        
        // 建立责任之间的关系
        person.nextHandler = fund
        fund.nextHandler = bank
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // 将画进行拍卖，如果卖不掉交给基金，基金卖不掉卖给银行
    func testResponsibility() {
        XCTAssert(person.sale(paint: oilCanvas))

        XCTAssert(person.sale(paint: cheapCanvas))
    }
    
  
    
}
