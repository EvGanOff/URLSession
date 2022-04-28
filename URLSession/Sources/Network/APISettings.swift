//
//  APISettings.swift
//  URLSession
//
//  Created by Евгений Ганусенко on 4/28/22.
//

import Foundation

struct MarvelAPI {
    static let apiKey = "830eadcfb11613a488cc4415277ea198"
    static let privateKey = "a795fbbc1f083e9a3f9000ba2b03198a02d3143a"
    static let request = "/v1/public/characters"
    static let ts = Date.timeIntervalSinceReferenceDate
    static let serverURL = "https://gateway.marvel.com:443"
}

struct MagicTheGatheringAPISettings {
    static let requestString = "/v1/cards"
    static let serverURL = "https://api.magicthegathering.io"
}
