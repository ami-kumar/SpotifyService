import Vapor
import HTTP
import Foundation

let drop = Droplet()

drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}

drop.get("hello") { req in
    if drop.environment == .production {
        return "Hello world on production!"
    } else {
        return "Hello World!"
    }
}

drop.get("print_query") { req in
    if let query = req.uri.query, query != "" {
        return query
    } else {
        return "No query"
    }
}

drop.get("version") { req in
    return try JSON(node: [
        "version": "1.1"
    ])
}

drop.get("custom_key") { req in
    let customValue = drop.config["servers", "default", "custom-key"]?.string ?? "default"
    return customValue
}

drop.get("personal_welcome") { req in
    return try drop.view.make("welcome.leaf", [
        "message": "Welcome Ami"
    ])
}

drop.get("clock") { req in
    return try drop.view.make("date_time", [
        "title": req.uri.path.replacingOccurrences(of: "/", with: "").capitalized
    ])
}

drop.get("outgoing_request") { req in
    // https://vapor.github.io/documentation/http/client.html
    let googleResponse = try drop.client.get("https://www.google.com")
    return googleResponse
}

drop.get("artist") { req in
    // example: http://localhost:8080/artist?j+cole
    if let artist = req.uri.query {
        let query: [String: CustomStringConvertible] = ["type": "artist", "q": artist]
        let response = try drop.client.get("https://api.spotify.com/v1/search", query: query)
        return response
    } else {
        return "query failed"
    }
}

drop.resource("posts", PostController())

drop.run()
