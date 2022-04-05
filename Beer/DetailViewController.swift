//
//  DetailViewController.swift
//  Beer
//
//  Created by Sabino Picariello on 05/04/22.
//

import UIKit

class DetailViewController: UIViewController {

   
    @IBOutlet weak var first_brewed: UILabel!
    
    @IBOutlet weak var brewersTips: UITextView!
    
    @IBOutlet weak var foodPairing: UITextView!
    
    var first_brewedIn: String?
    var food_pairingIn: [String]?
    var brewers_tipsIn: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        first_brewed.text = first_brewedIn
        brewersTips.text = brewers_tipsIn
        foodPairing.text = food_pairingIn?.joined(separator: ", ")
      
    }
    

   
}

