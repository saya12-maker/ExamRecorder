//
//  CellAddViewController.swift
//  ExamRecorder
//
//  Created by Sayaka Abe on 2020/11/07.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit

class CellAddViewController: UIViewController {
    @IBOutlet weak var CellTextField: UITextField!
    @IBAction func CellAddButton (_ sender: Any) {
        //cellList.append([])
        cellList[indexPath_section].append(CellTextField.text!)
        //追加ボタンを押したらフィールドを空にする
        CellTextField.text = ""
        //セルの数を1つ増やす。
        cellNum += 1
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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
