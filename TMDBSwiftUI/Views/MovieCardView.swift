//
//  MovieCardView.swift
//  TMDBSwiftUI
//
//  Created by Damian Cichosz on 19/04/2025.
//

import SwiftUI

struct MovieCardView: View {
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AsyncImage(url: URL(string:
                                    "https://image.tmdb.org/t/p/w500\(movie.posterPath ?? "")"))
            { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
            }   placeholder: {
                    Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 200)
            }
            .cornerRadius(10)
            
            HStack {
                Text(movie.title ?? "Unknown title")
                    .font(.title3)
                    .fontWeight(.bold)
                    .lineLimit(2)
                
                Spacer()
                
                Text("★ \(String(format: "%.1f", movie.voteAverage ?? 0))")
                    .font(.subheadline)
                    .foregroundStyle(.orange)
            }
            
            if let overview = movie.overview {
                Text(overview)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .lineLimit(4)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    if let movie = JSONParser.movie {
        MovieCardView(movie: movie)
    }
}
