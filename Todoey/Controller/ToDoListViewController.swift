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
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        print(dataFilePath)
        
        loaditems()
        
        
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
        cell.textLabel?.text = item.title
        
        
        
//        if item.done == true {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
//        Do the same with ternary operator
//        value = contitions ? valueTrue : valueFalse
        cell.accessoryType = item.done ? .checkmark : .none
        
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
        saveDataItem()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
//    MARK: - Add New Item
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add new todoey item", message: "", preferredStyle: .alert)
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create a new item"
        }
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            if let text = alert.textFields?.first?.text {
                let newItem = Item()
                newItem.title = text
                self.itemArrey.append(newItem)
                
                self.saveDataItem()
            }
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }

    func saveDataItem () {
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(itemArrey)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error encoding item array, \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    func loaditems() {
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                itemArrey = try decoder.decode([Item].self, from: data)
            } catch {
                print("Error decoding items array, \(error)")
            }
        }
    }

}

