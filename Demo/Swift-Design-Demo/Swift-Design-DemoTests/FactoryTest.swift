//
//  FactoryTest.swift
//  Swift-Design-Demo
//
//  Created by Chausson on 2016/12/19.
//  Copyright © 2016年 Chausson. All rights reserved.
//

import XCTest
@testable import Swift_Design_Demo

class FactoryTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    /* 验证是否油画的重量大于纸画*/
    func testFactory() {
        let paper = PaperCanvasFactory.normalCanvas()
        let oil = OilCanvasFactory.normalCanvas()
        XCTAssert(paper.weight < oil.weight, "油画的厚度竟然比纸还要薄")
    }

    
}
