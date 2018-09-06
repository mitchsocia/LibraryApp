//
//  AddItemViewController.swift
//  LibraryList
//
//  Created by Mitchell Socia on 9/5/18.
//  Copyright © 2018 Mitchell Socia. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    
    func addItemViewControllerDidCancel(_ controller: AddItemViewController)
    
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: LibraryListItems)
    
}
class AddItemViewController: UITableViewController {
    
    weak var delegate: AddItemViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    @IBAction func done() {
        navigationController?.popViewController(animated: true)
        
        let item = LibraryListItems()
        item.author = textField.text!
        item.title = textField.text!
        
        delegate?.addItemViewController(self, didFinishAdding: item)
    }

    @IBOutlet weak var textField: UITextField!

    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }

}
