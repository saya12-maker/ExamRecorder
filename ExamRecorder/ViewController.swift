//
//  ViewController.swift
//  ExamRecorder
//
//  Created by Sayaka Abe on 2020/08/28.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
   
    var receiveData: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose of any resources that can be recreated
        label.text = receiveData
    }
    
    
    


}

