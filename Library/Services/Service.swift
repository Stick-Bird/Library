//
//  Service.swift
//  Library
//
//  Created by user on 2022-08-25.
//

import Foundation

// create a data service class with a static method


class DataService {
    
   static func getLocalData() -> [Book] {
      
        // Parse local json file
        
        //Get a url path to the JSON file
        
        let pathString = Bundle.main.path(forResource: "library", ofType: "json")
        
        // Check if pathString is not nil, otherwise ...
        
        guard pathString != nil else {
            return [Book]()
        }
        
        //Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            //Create a data object
            let data = try Data(contentsOf: url)
            
            //Decode the data with a JSON decoder
            
            let decoder = JSONDecoder()
            
            do {
                let bookData = try decoder.decode([Book].self, from: data)
                
                //Add unique IDs
                
               /* for r in recipeData {
                    r.id = UUID()
                    
                    //Add unique IDs to recipe ingredients
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }*/
                //Return the recipes
                return bookData
            }
            catch {
                //error with parsing JSON
                print (error)
            }
        
        }
        catch {
            //error with getting date
            print (error)
        }
    
        return [Book]()
        
    }
    
}
