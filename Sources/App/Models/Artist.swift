//
//  Artist.swift
//  Hello
//
//  Created by Ami Kumar on 2/18/17.
//
//

import Foundation
import HTTP
import JavaScriptCore

enum ArtistKeys: String {
    case followers = "followers"
    case genres = "genres"
    case spotifyId = "id"
    case name = "name"
    case uri = "uri"
}

struct Artist {
    public let followers: UInt
    public let genres: [String]
    public let spotifyId: String
    public let name: String
    public let uri: String
    
    
    // JSONSerialization.jsonObject(with: String(bytes: response.body.bytes!, encoding: String.Encoding.utf8)?.data(using: .utf8))
    
    init?(_ resp: Response) {
        guard let bytes = resp.body.bytes,
            let jsonString = String(bytes: bytes, encoding: String.Encoding.utf8),
            let data = jsonString.data(using: .utf8),
            let json = try? JSONSerialization.jsonObject(with: data) as? [AnyHashable: Any],
            let jsonObj = json else {
            return nil // figure out how to handle this later
        }
        
        if let followers = jsonObj[ArtistKeys.followers.rawValue] as? UInt,
            let genres = jsonObj[ArtistKeys.genres.rawValue] as? [String],
            let spotifyId = jsonObj[ArtistKeys.spotifyId.rawValue] as? String,
            let name = jsonObj[ArtistKeys.name.rawValue] as? String,
            let uri = jsonObj[ArtistKeys.uri.rawValue] as? String {
            self.followers = followers
            self.genres = genres
            self.spotifyId = spotifyId
            self.name = name
            self.uri = uri
        } else {
            return nil // TODO: determine defaults if I want them
        }
    }
    
    // Pick up next time - convert response object into a dictionary 
    // so I can read into Artist property
    // Then use this artist object to test response from artist api endpoint in SpotifyService
}







