//
//  ContentView.swift
//  TMDBSwiftUI
//
//  Created by Damian Cichosz on 18/04/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var movies: [Movie] = []
    
    
    var body: some View {
        NavigationView {
            List(movies, id:\.id) { movie in
                Text(movie.title ?? "no title")
            }
            .navigationBarTitle("Movies")
            .listStyle(PlainListStyle())
        }
        .onAppear(perform: loadData)
    }
    
    private func loadData() {
        if let moviesData = JSONParser.parseMovie(fromFile: "movie_response") {
            self.movies = moviesData.results.filter {
                $0.title != nil && $0.adult == false }
        }
    }
}

#Preview {
    ContentView()
}
