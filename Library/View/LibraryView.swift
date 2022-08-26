//
//  ContentView.swift
//  Library
//
//  Created by user on 2022-08-25.
//

import SwiftUI

struct LibraryView: View {
    
    @EnvironmentObject var  model: LibraryModel
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                LazyVStack (alignment: .leading, spacing: 30){
                    
                    ForEach (model.books) { book in
                        
                        NavigationLink {
                            
                            StagingView(book: book)
                            
                        } label: {
                            
                            BookPreview(book: book)
                                .padding([.leading, .trailing], 20)
                            
                        }
                        
                       NavigationLink(destination: EmptyView()) {
                            EmptyView()
                        }
                    }
                }.navigationTitle("My Library")
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
            .environmentObject(LibraryModel())
    }
}
