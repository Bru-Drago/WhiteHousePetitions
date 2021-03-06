//
//  MainTableViewController.swift
//  WhiteHousePetitions
//
//  Created by Bruna Fernanda Drago on 26/06/20.
//  Copyright © 2020 Bruna Fernanda Drago. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var petitions = [Petition]()
    
        override func viewDidLoad() {
        super.viewDidLoad()

 //MARK:- Método para fazer o GET na API
        let urlString: String

        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        } else {
            urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=10000&limit=100"
        }

        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                return
            }
        }

        showError()
    }
    
//MARK:- Método para fazer o parse do JSONDATA
    func parse(json: Data){
        
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try?decoder.decode(Petitions.self, from: json){
            
            petitions = jsonPetitions.results
            tableView.reloadData()
        }
        
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return petitions.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        cell.textLabel?.text = petitions[indexPath.row].title
        cell.detailTextLabel?.text = petitions[indexPath.row].body
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
  //MARK:- Método para criar um alerta
    func showError(){
        
        let alert = UIAlertController(title:"Loading Error", message: "There was a problem loanding the feed , please check your connection and try again", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        present(alert, animated: true)
        
    }
    
    
}



