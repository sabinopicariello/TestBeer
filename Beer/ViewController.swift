//
//  ViewController.swift
//  Beer
//
//  Created by Sabino Picariello on 05/04/22.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var beerData: [Beer] = []
    let beerDB = BeerDB();
    var filteredBeer: [Beer] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateTableView), name: Notification.Name("Updated"), object: nil)
        beerDB.getData()
        
        
       
        tableView.dataSource = self;
        tableView.delegate = self;
        
        searchBar.delegate = self;
    }
    
    @objc func updateTableView(){
        DispatchQueue.main.async {
            self.beerData = self.beerDB.beerData
            self.filteredBeer = self.beerData
            self.tableView.reloadData()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        filteredBeer = []
        
        if searchText == ""{
            filteredBeer = beerData
        }
        
        for beer in beerData {
            if beer.description!.lowercased().contains(searchText.lowercased()) || beer.name!.lowercased().contains(searchText.lowercased()) {
                filteredBeer.append(beer)
            }
        }
        
        self.tableView.reloadData()
    }
    
}



extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredBeer.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "beer", for: indexPath) as! BeerCell
        
        
        
        
        cell.setCard(picture: filteredBeer[indexPath.row].image_url! , name: filteredBeer[indexPath.row].name!, description: filteredBeer[indexPath.row].description!, abv: filteredBeer[indexPath.row].abv, ibu: filteredBeer[indexPath.row].ibu )
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detail = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            self.navigationController?.pushViewController(detail, animated: true)
            detail.title = filteredBeer[indexPath.row].name!
            detail.first_brewedIn = filteredBeer[indexPath.row].first_brewed
            detail.brewers_tipsIn = filteredBeer[indexPath.row].brewers_tips
            detail.food_pairingIn = filteredBeer[indexPath.row].food_pairing
        }
        
    }
}

