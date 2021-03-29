//
//  DetailViewController.swift
//  PartyPlanner
//
//  Created by Nipuni Obe on 3/22/21.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var personResponsibleTextField: UITextField!
    
    
    
    
    
    var partyPlannerListItem: PartyPlannerListItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if partyPlannerListItem == nil {
            partyPlannerListItem = PartyPlannerListItem(item: "", personResponsible: "")
        }
        
        itemTextField.text = partyPlannerListItem.item
        personResponsibleTextField.text = partyPlannerListItem.personResponsible
        
    }
    
    
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
}
