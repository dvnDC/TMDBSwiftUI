//
//  MovieDetailView.swift
//  TMDBSwiftUI
//
//  Created by Damian Cichosz on 19/04/2025.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(
                    url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath ?? "")"),
                    content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(12)
                    },
                    placeholder: {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 200)
                            .cornerRadius(12)
                    }
                )
                
                Text(movie.title ?? "Unknown title")
                    .font(.title)
                    .fontWeight(.bold)
                
                HStack {
                    Text("★ \(String(format: "%.1f", movie.voteAverage ?? 0 ))")
                        .foregroundColor(.orange)
                    
                    if let date = movie.releaseDate {
                        Text("Premiera: \(date)")
                            .foregroundColor(.secondary)
                    }
                }
                .font(.subheadline)
                
                Text(movie.overview ?? "")
                    .font(.body)
                    .foregroundColor(.primary)
            }
            .padding()
        }
        .navigationTitle(movie.title ?? "")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    if let movie = JSONParser.movie {
        MovieCardView(movie: movie)
    }
}
