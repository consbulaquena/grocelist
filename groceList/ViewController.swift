//
//  ViewController.swift
//  groceList
//
//  Created by Cons Bulaqueña on 16/03/2017.
//  Copyright © 2017 consios. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var items = [String]()
    
    
    @IBOutlet var textField: UITextField!
    
    @IBAction func addButton(_ sender: UIButton) {

        let newItem = textField.text
        items.append(newItem!)
        textField.resignFirstResponder()
        textField.text = ""
        tableView.reloadData()
    }
    
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return items.count
    
}
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    cell.textLabel?.text = items[indexPath.row]
    cell.textLabel?.textColor = UIColor.black
    
    return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedRow:UITableViewCell = tableView.cellForRow(at: indexPath)!
        
        if selectedRow.accessoryType == UITableViewCellAccessoryType.none{
            selectedRow.accessoryType = UITableViewCellAccessoryType.checkmark
            selectedRow.tintColor = UIColor.green
        }
        
        else{
            selectedRow.accessoryType = UITableViewCellAccessoryType.none
        
        } //end if else statement
            
    } //end didSelectRow function
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let deletedRow:UITableViewCell = tableView.cellForRow(at: indexPath)!
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            deletedRow.accessoryType = UITableViewCellAccessoryType.none
        }
    }
    
}
    
    
