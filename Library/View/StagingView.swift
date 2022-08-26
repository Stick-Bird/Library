//
//  BookView.swift
//  Library
//
//  Created by user on 2022-08-25.
//

import SwiftUI

struct StagingView: View {
    
    @EnvironmentObject var  model: LibraryModel
    @State private var rating = 2
    @State var imageName : String = "star"
    
  
    var book : Book
    
    var body: some View {
        
        VStack (spacing: 20) {
            
            NavigationLink {
                ReadingView()
            } label: {
                VStack {
                    
                    Text("Read Now!")
                        .font(.title)
                        .accentColor(.black)
                    
                    //Add image here
                    Image ("cover" + "\(book.id)")
                        .resizable()
                        .scaledToFit()
                    }
                    .padding()
            }
                Text ("Mark for later!")
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.black)
                
            Button(action: { model.updateFavourite(forId: book.id) }) {
                Image(systemName: book.isFavourite ? "star.fill" : "star")
                    .resizable()
                    .frame(width: 28, height: 28)
            }
            .accentColor(.yellow)
            
            Text ("Rate \(book.title)")
                .fontWeight(.bold)
                .padding()
                .foregroundColor(.black)
            
            Picker("Rate this book!", selection: $rating) {
                ForEach(1..<6) { index in
                    Text("\(index)")
                        .tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding([.leading, .trailing, .bottom], 60)
            .onChange(of: rating, perform: { value in
                model.updateRating(forId: book.id, rating: rating)
            })
        }
        .onAppear {
            if (book.isFavourite == true) {
                
            }
        }
        .onAppear { rating = book.rating }
        .navigationBarTitle("\(book.title)")
    }
}




struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = LibraryModel()
        
        StagingView(book: Book())
        
    }
}
