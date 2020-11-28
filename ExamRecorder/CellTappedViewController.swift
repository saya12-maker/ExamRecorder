//
//  CellTappedViewController.swift
//  ExamRecorder
//
//  Created by Sayaka Abe on 2020/11/07.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit

class CellTappedViewController: UIViewController {
    @IBOutlet weak var CellName: UILabel!
    @IBOutlet weak var CellNumber: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        CellName.text = cellList[indexPath_section][Int(indexPath_row)]
        CellNumber.text = "第\(indexPath_section)セクションの\(indexPath_row)個目のセル"

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
