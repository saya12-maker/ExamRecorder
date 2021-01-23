//
//  TableViewController.swift
//  ExamRecorder
//
//  Created by Sayaka Abe on 2020/09/05.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit
import RealmSwift

class AddSectionViewController: UIViewController {
    
    let realm = try! Realm()
    var TestArray : Results<Test>!
    
    
    
    @IBOutlet var textField: UITextField!
    @IBOutlet weak var TableView: UITableView!
    @IBAction func Clear(_ sender: Any) {
        
    }
     let formatter = DateFormatter()
    
    let date: [String] = ["", "", ""]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "ydMMM", options: 0, locale: Locale(identifier: "ja_JP"))
         TestArray = realm.objects(Test.self)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
    
    @IBAction func save() {
        let test = Test()
        test.date = formatter.string(from: Date())
        test.score = ""
        test.subject = ""
        test.review = ""
        test.goal = textField.text!
        test.toDo = ""
        try! realm.write {
            realm.add(test)
        }
        
        
        
        let preTBC = self.presentingViewController as! UITabBarController
        let preNC = preTBC.customizableViewControllers?[1] as! UINavigationController
        let preVC = preNC.viewControllers[preNC.viewControllers.count - 1] as! GoalTableViewController
        preVC.tableView.reloadData()
        self.dismiss(animated: true, completion: nil)
        
    }
    
   
    
   
}
//self.navigationController?.popToRootViewController(animated: true)
