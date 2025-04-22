//
//  MovieData.swift
//  TMDBSwiftUI
//
//  Created by Damian Cichosz on 18/04/2025.
//

struct MovieResponse: Codable {
    
    let results: [Movie]
    
}

struct Movie: Codable {
    
    let id: Int
    let backdropPath: String?
    let title: String?
    let posterPath: String?
    let adult: Bool
    let voteAverage: Double?
    let overview: String?
    let releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        case id, title, adult, overview
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
    }
    
}

//"results": [
//  {
//    "adult": false,
//    "backdrop_path": "/xBrx6O1RIhjtWmVthZIANuQz7Z2.jpg",
//    "genre_ids": [
//      28,
//      80,
//      53
//    ],
//    "id": 1197306,
//    "original_language": "en",
//    "original_title": "A Working Man",
//    "overview": "Levon Cade left behind a decorated military career in the black ops to live a simple life working construction. But when his boss's daughter, who is like family to him, is taken by human traffickers, his search to bring her home uncovers a world of corruption far greater than he ever could have imagined.",
//    "popularity": 766.8163,
//    "poster_path": "/xUkUZ8eOnrOnnJAfusZUqKYZiDu.jpg",
//    "release_date": "2025-03-26",
//    "title": "A Working Man",
//    "video": false,
//    "vote_average": 6.265,
//    "vote_count": 289
//  },
