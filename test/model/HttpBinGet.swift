// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let hTTPBinGet = try? newJSONDecoder().decode(HTTPBinGet.self, from: jsonData)

import Foundation

// MARK: - HTTPBinGet
struct HTTPBinGet: Codable {
    let args: Args
    let headers: Headers
    let origin: String
    let url: String
}

// MARK: - Args
struct Args: Codable {
}

struct Headers:Codable {
}

