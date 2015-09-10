//
//  tstTests.swift
//  tstTests
//
//  Created by Takuya Okamoto on 2015/09/08.
//  Copyright © 2015年 Uniface. All rights reserved.
//

import XCTest
import UIKit

@testable import tst
@testable import Bond

class tstTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testQiitaAPITest() {
        let expextion : XCTestExpectation = self.expectationWithDescription("📡 fetch article.")
        print("💨test start")
        QiitaAPI.fetchArticles(QiitaAPI.randomURL()) { articles in
            print("✨ok!!")
            XCTAssert(articles.count != 0)
            expextion.fulfill()
        }
        self.waitForExpectationsWithTimeout(5) { error in
            if error != nil {
                print("❌ Error")
                print(error)
            }
        }
    }
    
    func testTapStreamTest() {
        let expextion : XCTestExpectation = self.expectationWithDescription("👆→📰 tap to get article.")
        
        class Test: tapToGetQiitaArticles {
            var exp:XCTestExpectation? = nil
            let start = NSDate()

            func test(exp:XCTestExpectation) {
                self.exp = exp
                print("🎃 test ....")
                let refreshButton = UIButton()
                startTapToGetStream(refreshButton.bnd_tap).next()
            }
            func didGetNewArticle(articles:[QiitaArticle]) {
                print("🔰 Get New article!")
                let elapsed = NSDate().timeIntervalSinceDate(start)
                print(elapsed)
                XCTAssert(articles.count != 0)
                exp?.fulfill()
            }
        }
        
        let test = Test()
        test.test(expextion)

        self.waitForExpectationsWithTimeout(5) { error in
            if error != nil {
                print("❌ Error")
                print(error)
            }
        }
    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}
