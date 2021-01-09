//
//  TableViewController.swift
//  ExamRecorder
//
//  Created by Sayaka Abe on 2020/09/05.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit
import RealmSwift

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let realm = try! Realm()
    var TestArray : Results<Test>!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellList[Int(section)].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TableCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
        TableCell.textLabel!.text = TestArray[indexPath.row].date
        return TableCell
    }
    
    
    @IBOutlet weak var TableView: UITableView!
    @IBAction func Clear(_ sender: Any) {
        
    }
     let formatter = DateFormatter()
    
    let date: [String] = ["", "", ""]
    
    var cellList:[[String]] = []
    
    var sectionTitles:[[String]] = []
    
    var sectionNum = 0
    
    var sectionHeight: Int = 50
    
    var cellNum = 0
    
    var cellHeight: Int = 100
    
    var indexPath_section: Int = 0
    
    var indexPath_row: Int = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "ydMMM", options: 0, locale: Locale(identifier: "ja_JP"))
         TestArray = realm.objects(Test.self)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func addNewTest() {
        let test = Test()
        test.date = ""
        test.score = ""
        test.subject = ""
        test.review = ""
        test.goal = ""
        test.toDo = ""
        try! realm.write {
            realm.add(test)
        }
    }
    
    @IBAction func editLastTest() {
        let TestArray:Results<Test> = realm.objects(Test.self)
        let test = TestArray[0]
        try! realm.write {
            test.date = ""
            realm.add(test)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionNum
    }
 
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(sectionHeight)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(cellHeight)
    }
    
   
    
    @IBAction func buttonTapped() {
        //Realmにデータを追加する
        let test = Test()
        
        test.date = formatter.string(from: Date())
        
        try! realm.write {
            realm.add(test)
        }
        //tableをリロードする
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexPath_section = indexPath.section
        indexPath_row = indexPath.row
        let storyboard: UIStoryboard = self.storyboard!
        let second = storyboard.instantiateViewController(withIdentifier: "cellTapped")
        self.present(second, animated: true, completion: nil)
    }
    
    let preNC = self.tableViewController as! UINavigationController
    let preVC = preNC.viewControllers[preNC.viewControllers.count - 1] as TableViewController
    preVC.tableView.reloadData()
   
    
   
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
