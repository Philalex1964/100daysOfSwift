//
//  ViewController.swift
//  Day32_Challenge
//
//  Created by Alexander Filippov on 4.3.21..
//  Copyright © 2021 Alexander Filippov. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var shoppingList = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "shopping list".capitalized
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "New List", style: .plain, target: self, action: #selector(newList))
        
        newList()
    }
    
    @objc func newList() {
        shoppingList.removeAll()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }
    
    @objc func addItem() {
        let ac = UIAlertController(title: "Add new item!", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let addAction = UIAlertAction(title: "Add to list!", style: .default) { [weak self, weak ac] _ in
            guard let item = ac?.textFields?[0].text else { return }
            self?.insertItem(item)
        }
        
        ac.addAction(addAction)
        present(ac, animated: true)
    }
    
    func insertItem(_ item: String) {
        let lowerCase = item.lowercased()
        
        let errorTitle: String
        
        if shoppingList.contains(lowerCase) {
            errorTitle = "You have this item already!"
            
            showErrorMessage(title: errorTitle)
        } else if item.isEmpty {
            errorTitle = "You didn't enter an item"
            
            showErrorMessage(title: errorTitle)
        } else {
            shoppingList.insert(lowerCase, at: 0)
            
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    func showErrorMessage(title: String) {
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default))
        present(ac, animated: true)
    }

}

