//
//  TwitterServiceTests.swift
//  Hello
//
//  Created by Ami Kumar on 2/14/17.
//
//

import XCTest
@testable import App
//@testable import Hello
//@testable import SpotifyService

class SpotifyServiceTests: XCTestCase {
    // run buy building to a device
    // make sure to name functions starting with "test"
    let spotifyService = SpotifyService()
    
    func testPass() {
        XCTAssertEqual(1, 1)
    }
    
    func testFail() {
        XCTFail()
    }
    
    func testArtistEndpoint() {
        do {
            let response = try spotifyService.getArtistInfo("J Cole")
            guard let _ = Artist(response) else {
                XCTFail("Casting response to Artist object failed")
                return
            }
        } catch {
            XCTFail("API call failed")
        }
        
    } // Next: Try to figure out how to get this to actually run and not fail on imports
    // Running it in terminal tells us it can't find this source file (maybe delete this file
    // and move tests to AppTests.swift? Or figure out how to allow test module to have multiple
    // files)
    
}
