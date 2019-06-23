//
//  song.swift
//  FinalProject
//
//  Created by kevin on 2019/6/19.
//  Copyright © 2019 kevin. All rights reserved.
//

import Foundation

struct Song: Codable {
    var artistName: String
    var trackName: String
    var collectionName: String?
    var previewUrl: URL
    var trackPrice: Double?
    var releaseDate: Date
    
    static let documentsDirectory =
        FileManager.default.urls(for: .documentDirectory,in: .userDomainMask).first!
    
    static func saveToFile(songs: [Song]) {
        let propertyEncoder = PropertyListEncoder()
        if let data = try? propertyEncoder.encode(songs) {
            let url = Song.documentsDirectory.appendingPathComponent("song").appendingPathExtension("plist")
            try? data.write(to: url)
        }
        
    }
    static func readSongFromFile() -> [Song]? {
        let propertyDecoder = PropertyListDecoder()
        let url =
            Song.documentsDirectory.appendingPathComponent("song").appendingPathExtension("plist")
        if let data = try? Data(contentsOf: url), let songs = try?
            propertyDecoder.decode([Song].self, from: data) {
            return songs
        } else {
            return nil
        }
    }
        
}
struct SongResults: Codable {
    var resultCount: Int
    var results: [Song]
    
    init()
    {
        self.resultCount = 0
        self.results = []
    }
    init(resultCount: Int , results: [Song])
    {
        self.resultCount = resultCount
        self.results = results
    }
    
    
}

