//
//  SectionAddViewController.swift
//  ExamRecorder
//
//  Created by Sayaka Abe on 2020/11/07.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit

class SectionAddViewController: UIViewController {
    @IBOutlet weak var SectionTextField: UITextField!
    @IBAction func SectionAddButton(_ sender: Any) {
        //配列に入力内容を入れる
        sectionTitles.append(SectionTextField.text!)
        //追加ボタンを押したらフィールドを空にする
        SectionTextField.text = ""
        //セクションの数を1つ増やす。
        sectionNum += 1
        cellList.append([])
    }
    
    @IBAction func save() {
        
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
