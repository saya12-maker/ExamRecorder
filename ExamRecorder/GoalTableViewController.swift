//
//  ReflectViewController.swift
//
//
//  Created by Sayaka Abe on 2021/01/16.
//

import UIKit
import RealmSwift



class GoalTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    let realm = try! Realm()
    var TestArray : Results<Test>!
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TestArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TableCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
        TableCell.textLabel!.text = TestArray[indexPath.row].goal
        return TableCell
    }
    
    
    
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        TestArray = realm.objects(Test.self)
        // Do any additional setup after loading the view.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
