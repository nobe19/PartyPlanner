//
//  ViewController.swift
//  PartyPlanner
//
//  Created by Nipuni Obe on 3/22/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    struct PartyPlannerListItem {
        var item: String
        var personResponsible: String
    }
    
    var partyPlannerArray: [PartyPlannerListItem] = []
    var partyItems = ["Potato Chips",
                      "Tortilla Chips",
                      "Salsa",
                      "Chili",
                      "Punch",
                      "Sudsy Beverages",
                      "Brownies",
                      "Cupcakes",
                      "Fruit salad",
                      "Ribs",
                      "Corn bread",
                      "Macaroni Salad",
                      "Sandwich Rolls",
                      "Roast Beef",
                      "Ham",
                      "Cheese",
                      "Mayo",
                      "Mustard",
                      "Hummus",
                      "Baby carrots",
                      "Celery",
                      "Veggie Dip",
                      "Napkins",
                      "Plates & Bowls",
                      "Forks and Knives",
                      "Cups"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        for partyItem in partyItems {
            let newPartyListItem = PartyPlannerListItem(item: partyItem, personResponsible: "")
            partyPlannerArray.append(newPartyListItem)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("😎 numberOfRowsInSection was just called! Returning \(partyItems.count) as our row count")
        return partyPlannerArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        print("👊 cellForRowAt is building cell at indexPath.row \(indexPath.row) with value \(partyItems[indexPath.row])")
        cell.textLabel?.text = partyPlannerArray[indexPath.row].item
        cell.detailTextLabel?.text = partyPlannerArray[indexPath.row].personResponsible
        return cell
    }
    
    
}
