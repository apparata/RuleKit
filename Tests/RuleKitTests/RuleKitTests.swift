import XCTest
@testable import RuleKit

final class RuleKitTests: XCTestCase {
    
    func testIntRules() {
        XCTAssertTrue(7.satisfies(.odd))
        XCTAssertFalse(8.satisfies(.not(.even)))
        XCTAssertTrue(7.satisfies(.both(.odd, .not(.even))))
        XCTAssertTrue(8.satisfies(.all(.even, .lessThan(10))))
        XCTAssertTrue(8.satisfies(.any(.even, .odd)))
        XCTAssertEqual([1, 2, 3, 4, 5, 6, 7].satisfying(.all(.even, .atMost(5))), [2, 4])
    }

    static var allTests = [
        ("testIntRules", testIntRules),
    ]
}
