import XCTest
@testable import WWExtensions

final class ArrayTests: XCTestCase {
    private let testArray = ["a", "b", "c", "d", "e"]

    func testUnique() throws {
        let doubleArray = testArray + testArray
        XCTAssertEqual(testArray, doubleArray.ww.unique.sorted(by: <))
    }

    func testChunks() throws {
        XCTAssertEqual(testArray.ww.chunked(into: 2), [["a", "b"], ["c", "d"], ["e"]])
    }

    func testAtIndex() throws {
        XCTAssertEqual(testArray.ww.at(2), "c")
        XCTAssertEqual(testArray.ww.at(5), nil)
    }

}
