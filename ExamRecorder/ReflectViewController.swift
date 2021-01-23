//
//  ReflectViewController.swift
//  
//
//  Created by Sayaka Abe on 2021/01/16.
//

import UIKit

class ReflectViewController: UIViewController{
    
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func plus() {
        self.navigationController?.popToRootViewController(animated: true)
        
        let preNC = self.presentingViewController as! UINavigationController
        let preVC = preNC.viewControllers[preNC.viewControllers.count - 1] as! ViewController
        preVC.TableView.reloadData()
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
