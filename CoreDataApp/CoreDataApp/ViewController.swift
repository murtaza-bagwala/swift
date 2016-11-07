//
//  ViewController.swift
//  CoreData
//
//  Created by webonise on 04/11/16.
//  Copyright © 2016 Webonise Lab. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var people = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\"The List\""
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ cellForRowAttableView: UITableView,
                   cellForRowAt
        indexPath: IndexPath) -> UITableViewCell {
        
        let cell : CustomCell =
            tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCell
        let person = people[indexPath.row]
        
        cell.labelInfo!.text = person.value(forKey: "name") as? String
        cell.buttonDelete.addTarget(self, action: #selector(deleteName(sender:)), for: .touchUpInside)
        cell.buttonUpdate.addTarget(self, action: #selector(updateName(sender:)), for: .touchUpInside)
        cell.buttonUpdate.tag = indexPath.row;
        cell.buttonDelete.tag = indexPath.row;
        return cell
    }
    
    @IBAction func addName(_ sender: AnyObject) {
        let alert = createAlert("New Name")
        let saveAction = UIAlertAction(title: "Save",
                                       style: .default,
                                       handler: { (action:UIAlertAction) -> Void in
                                        let textField = alert.textFields!.first
                                        self.saveName(name: textField!.text!)
                                        self.tableView.reloadData()
        })
        
        alert.addAction(saveAction)
    }
    
    func deleteName(sender: UIButton){
        let buttonTag = sender.tag
        let managedContext: NSManagedObjectContext = getManagedObjectContext()
        managedContext.delete(people[buttonTag]);
        do {
            try managedContext.save()
            people.remove(at: buttonTag)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        self.tableView.reloadData()
        
    }
    
    func updateName(sender: UIButton){
        let alert = createAlert("Update")
        
        let saveAction = UIAlertAction(title: "Save",
                                       style: .default,
                                       handler: { (action:UIAlertAction) -> Void in
                                        let textField = alert.textFields!.first
                                        self.updateEntity(newName: textField!.text!, index: sender.tag)
                                        self.tableView.reloadData()
        })
        
        alert.addAction(saveAction)
    }
    
    func updateEntity(newName: String, index: Int){
        let managedContext = getManagedObjectContext();
        people[index].setValue(newName, forKey: "name")
        do {
            try managedContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }
    
    func saveName(name: String) {
        
        let managedContext: NSManagedObjectContext = getManagedObjectContext()
        let entity =  NSEntityDescription.entity(forEntityName: "Person", in: managedContext)
        let person = NSManagedObject(entity: entity!,
                                     insertInto: managedContext)
        person.setValue(name, forKey: "name")
        
        do {
            try managedContext.save()
            people.append(person)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func createAlert(_ title: String) -> UIAlertController {
        let alert = UIAlertController(title: title,
                                      message: "Add a new name",
                                      preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .default) { (action: UIAlertAction) -> Void in
        }
        
        alert.addTextField {
            (textField: UITextField) -> Void in
        }
        
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        
        return alert;
    }
    
    func getManagedObjectContext() -> NSManagedObjectContext {
        let appDel: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext: NSManagedObjectContext = appDel.persistentContainer.viewContext
        return managedContext;
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let managedContext: NSManagedObjectContext = getManagedObjectContext();
        
        let fetchRequest : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Person");
        do {
            let results =
                try managedContext.fetch(fetchRequest)
            people = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

