//
//  BeerDB.swift
//  Beer
//
//  Created by Sabino Picariello on 05/04/22.
//

import UIKit

class BeerDB{
    
    var beerData: [Beer] = [] ;
     
    func getData() {
        
        let url = "https://api.punkapi.com/v2/beers"
       
        URLSession.shared.dataTask(with: URL(string: url)!,  completionHandler:  {data, response, error in
            guard let data = data, error == nil else {
                print("get error")
                
                return
            }
        
            do {
                self.beerData = try JSONDecoder().decode([Beer].self,from: data)
                NotificationCenter.default.post(name: Notification.Name("Updated"), object: nil)
            }
            catch {
                print("decoding error")
            }
            
        }).resume()
    

    }
    
   
    
    
}



struct Beer: Hashable, Codable {
    let image_url: String?
    let name: String?
    let description: String?
    let abv: Double?
    let ibu: Double?
    let first_brewed: String?
    let brewers_tips: String?
    let food_pairing: [String]?
}
