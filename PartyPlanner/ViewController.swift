//
//  ViewController.swift
//  PartyPlanner
//
//  Created by Nipuni Obe on 3/22/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editBarButton: UIBarButtonItem!
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let destination = segue.destination as! DetailViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.partyPlannerListItem = partyPlannerArray[selectedIndexPath.row]
        } else {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: selectedIndexPath, animated: true)
            }
        }
    }
    
    @IBAction func unwindFromDetail(segue: UIStoryboardSegue) {
        let source = segue.source as! DetailViewController
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            partyPlannerArray[selectedIndexPath.row] = source.partyPlannerListItem
            tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
        } else {
            let newIndexPath = IndexPath(row: partyItems.count, section: 0)
            partyPlannerArray.append(source.partyPlannerListItem)
            tableView.insertRows(at: [newIndexPath], with: .fade)
            tableView.scrollToRow(at: newIndexPath, at: .bottom, animated: true)
        }
    }
    
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        if tableView.isEditing {
            tableView.setEditing(false, animated: true)
            editBarButton.title = "Edit"
            addBarButton.isEnabled = true
        } else {
            tableView.setEditing(true, animated: true)
            editBarButton.title = "Done"
            addBarButton.isEnabled = false
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
        cell.textLabel?.text = partyPlannerArray[indexPath.row].item
        cell.detailTextLabel?.text = partyPlannerArray[indexPath.row].personResponsible
        return cell

    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            partyPlannerArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = partyPlannerArray[sourceIndexPath.row]
        partyPlannerArray.remove(at: sourceIndexPath.row)
        partyPlannerArray.insert(itemToMove, at: destinationIndexPath.row)
    }
}
