//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArrey = [Item]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let newItem = Item()
        newItem.title = "Buy water"
        newItem.done = true
        itemArrey.append(newItem)
        
        let newItem1 = Item()
        newItem1.title = "Pay the bills"
        itemArrey.append(newItem1)
        
        let newItem2 = Item()
        newItem2.title = "Prepare dinner"
        itemArrey.append(newItem2)
        
        
//        if let items = defaults.array(forKey: "TodoListArrey") as? [String] {
//            itemArrey = items
//        }
        
    }
    
//    MARK - TableView DataSours Method
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArrey.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = itemArrey[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCells", for: indexPath)
        cell.textLabel?.text = itemArrey[indexPath.row].title
        
        if item.done == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
//    MARK: - Tableview Delegate Method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArrey[indexPath.row])
        let item = itemArrey[indexPath.row]
        
//       Do the same that
//       if item.done == false {
//           item.done = true
//       } else {
//           item.done = false
//       }
        
        item.done = !item.done
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
//    MARK: - Add New Item
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let item = Item()
        item.title = textField.text!
        
        
        let alert = UIAlertController(title: "Add new todoey item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            self.itemArrey.append(item)
            self.defaults.set(self.itemArrey, forKey: "TodoListArrey")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create a new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    


}

