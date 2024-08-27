import XCTest
@testable import WWExtensions

// MARK: - StringTests

final class StringTests: XCTestCase {
    private let testData = Data([0x1F, 0x2D, 0x3C])

    func testInitData() throws {
        XCTAssertEqual("0x1f2d3c".ww.hexData, testData)
        XCTAssertEqual("0x1F2d3C".ww.hexData, testData)
        XCTAssertEqual("1F2d3C".ww.hexData, testData)
    }

    func testStripPrefix() throws {
        XCTAssertEqual("0x1f2d3c".ww.stripHexPrefix(), "1f2d3c")
        XCTAssertEqual("1f2d3c".ww.stripHexPrefix(), "1f2d3c")
    }

    func testReversedHexData() throws {
        XCTAssertEqual("0x1f2d3c".ww.reversedHexData, Data([0x3c, 0x2d, 0x1f]))
    }

}

func byteArrayLittleEndian(int: Int) -> [UInt8] {
    [
        UInt8(int & 0x000000FF),
        UInt8((int & 0x0000FF00) >> 8),
        UInt8((int & 0x00FF0000) >> 16),
        UInt8((int & 0xFF000000) >> 24),
    ]
}
