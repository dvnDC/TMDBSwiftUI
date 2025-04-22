//
//  JSONParser.swift
//  TMDBSwiftUI
//
//  Created by Damian Cichosz on 18/04/2025.
//

import Foundation

class JSONParser {
    
    static var movie: Movie? {
        parseMovie(fromFile: "movie_response")?.results.first
    }
    
    static func parseMovie(fromFile fileName: String) -> MovieResponse? {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            print("File doesn't exit \(fileName).json")
            return nil
        }
        do {
            let data = try Data(contentsOf: url)
            let movie = try JSONDecoder().decode(MovieResponse.self, from: data)
            return movie
        } catch {
            print("JSON parssing ereror: \(error)")
            return nil
        }
    }
}
