//
//  RhythmBoxTests.swift
//  RhythmBox
//
//  Created by Manuel on 2/2/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import XCTest
import RhythmBox

class RhythmBoxTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let rhythmBox = RhythmBox(bpm: 120, timeSignature: (4,4))
        
        XCTAssertNotNil(rhythmBox, "rhythmBox should not be nil")

    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
