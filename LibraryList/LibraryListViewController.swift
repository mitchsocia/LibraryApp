//
//  ViewController.swift
//  LibraryList
//
//  Created by Mitchell Socia on 9/5/18.
//  Copyright © 2018 Mitchell Socia. All rights reserved.
//

import UIKit

var libraryListItems: [LibraryListItems] = []

class LibraryListViewController: UITableViewController, AddItemViewControllerDelegate {
    func addItemViewController(_ controller: AddItemViewController) {
    }
    

    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = true
        super.viewDidLoad()
    populateLibraryListItems()
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return libraryListItems.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryListItem", for: indexPath)
        
         cell.textLabel?.text = libraryListItems[indexPath.row].author
        
               return cell
        }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            libraryListItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .top)
        }
    }
    
    @IBAction func addItem(_ sender: Any) {
        let newRowIndex = libraryListItems.count
        
        let newItem = LibraryListItems()
        newItem.title = "title"
        newItem.author = "author"
        libraryListItems.append(newItem)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        
        
    }
    
    func addItemViewControllerDidCancel(_ controller:AddItemViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: LibraryListItems) {
        navigationController?.popViewController(animated: true)
        
        let newRowIndex = libraryListItems.count
        libraryListItems.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItem" {
            let controller = segue.destination as! AddItemViewController
            controller.delegate = self
        }
    }

    func populateLibraryListItems() {
        let tasks = ["Greg": "Other thing", "Frank": "Frank's thing", "Berlin": "The Album", "artist" : "Album", "Some guy" : "Some pig"]
        
        for task in tasks {
            let item = LibraryListItems()
            item.author = String(item.key)
            libraryListItems.append(item)
        }
    }
    
}

