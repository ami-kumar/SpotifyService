//
//  SpotifyService.swift
//  Hello
//
//  Created by Ami Kumar on 2/14/17.
//
//

import Foundation
import HTTP

struct Query {
    let type: String
    let query: String
    
    var formattedQuery: [String: String] {
        return ["type": type, "q": query]
    }
}

class SpotifyService {
    // https://dev.twitter.com/oauth/application-only
    // OR try with spotify https://developer.spotify.com/web-api/tutorial/
    private let basePublicAddress = "https://api.spotify.com"
    private let baseAuthorizationAddress = "https://accounts.spotify.com"
    
    init() {}
    
    private func call(endpoint: String, args: Query) throws -> Response {
        let response = try drop.client.get(endpoint, query: args.formattedQuery)
        return response
    }
    
    public func getArtistInfo(_ artist: String) throws -> Response {
        // maybe extrapolate endpoint -> type mapping in a data structure
        let endpoint = "\(basePublicAddress)/v1/search"
        let query = Query(type: "artist", query: artist)
        return try self.call(endpoint: endpoint, args: query)
    }
    
    // create function to find out "me" 
    // https://api.spotify.com/v1/me
    // to practice sending authorization tokens
    
}
