//
//  BookPreview.swift
//  Library
//
//  Created by user on 2022-08-25.
//

import SwiftUI

struct BookPreview: View {
    
    var book : Book
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 5, x: -5, y: 5)
            
            VStack (alignment: .leading, spacing: 20) {
                
                HStack {
                    
                    Text (book.title)
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                    
                    if book.isFavourite == true {
                        
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .foregroundColor(.yellow)
                    }
                    
                }
                
                Text (book.author)
                    .italic()
                
                
                Image ("cover\(book.id)")
                    .resizable()
                    .scaledToFit()
                
            }
            .padding()
        }
        .accentColor(.black)
        
    }
}

struct BookPreview_Previews: PreviewProvider {
    static var previews: some View {
        BookPreview(book: Book())
        
    }
}
