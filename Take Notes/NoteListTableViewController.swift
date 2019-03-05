//
//  NoteListTableViewController.swift
//  Take Notes
//
//  Created by Peter Oriola on 05/03/2019.
//  Copyright © 2019 Peter Oriola. All rights reserved.
//

import UIKit

class NoteListTableViewController: UITableViewController {

    var noteListArray = ["lagos", "Design", "Keto Programme"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return noteListArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteListItemCell", for: indexPath)
       
        cell.textLabel?.text = noteListArray[indexPath.row]
        

        return cell
    }
 
    //MARK: - TABLEVIEW DELEGATE METHODS
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(noteListArray[indexPath.row])
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    //MARK: - ADD NEWS NOTES
    
    @IBAction func addNoteButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Note Title", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Note", style: .default) { (action) in
            self.noteListArray.append(textField.text!)
        }
        
        alert.addTextField { (alertTextField) in
             alertTextField.placeholder = "Creat New Note"
            
            textField = alertTextField
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
}

