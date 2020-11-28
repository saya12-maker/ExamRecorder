//
//  TableViewController.swift
//  ExamRecorder
//
//  Created by Sayaka Abe on 2020/09/05.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit
 //2次元配列　セルの内容が入る
var cellList: [[String]] = []
 //セクションの名前が入る
var sectionTitles: [String] = []
 //セクションの数
var sectionNum = 0
 //セクションの高さ
var sectionHeight:Int = 50
 //セルの数
var cellNum: Int = 0
 //セルの高さ
var cellHeight:Int = 100
//セクション番号
var indexPath_section:Int = 0
 //セル番号
var indexPath_row:Int = 0

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.delegate = self
        TableView.dataSource = self
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    //セクション内のセル数を決めるメソッド（＊＊必須＊＊）
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellList[Int(section)].count
    }
    /*
   セルのインスタンスを生成するメソッド「表示するcellの中身を決める」（＊＊必須＊＊）
     */
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TableCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
        TableCell.textLabel!.text = cellList[indexPath.section][Int(indexPath.item)]
        return TableCell
    }
    
    /*
     テーブル内のセクション数を決めるメソッド
     */
     func numberOfSections(in tableView: UITableView) -> Int {
        return sectionNum
    }
    
    /*
     セクションの高さを設定
     */
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(sectionHeight)
    }
    
    /*
     セクションのラベルを設定する
     */
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect.zero) //zeroは目一杯に広げる
        //tableView.ounds.widthはスマホの横幅を取得するメソッド
        let label = UILabel(frame: CGRect(x:0, y:0, width: tableView.bounds.width, height: 50))
        //追加の際入力した文字を表示
        label.text = "\(sectionTitles[section])"
        //文字位置
        label.textAlignment = NSTextAlignment.center
        //文字サイズ変更
        label.font = UIFont.italicSystemFont(ofSize: 21)
        //背景色変更
        label.backgroundColor = UIColor.gray
        //文字色変更
        label.textColor = UIColor.black
        //self.view.frame.maxX は横幅の最大値を取得　基本的には左上が座標(0,0)
        let button = UIButton(frame: CGRect(x:self.view.frame.maxX - 50, y:0, width:50, height: 50))
        button.backgroundColor = UIColor.black
        button.setTitle("追加", for: .normal)
        //ボタンにタグをつける
        button.tag = section
        //追加ボタンがタップされた際に画面遷移をする(buttonTappedはタップされた際に呼び出される関数)
        button.addTarget(self, action: #selector(TableViewController.buttonTapped(sender:)), for: .touchUpInside)
        //セクションバーの上にあるviewに加える 階層として sectionBar > view > label = button
        view.addSubview(label)
        view.addSubview(button)
        return view
    }
    
    @objc func buttonTapped(sender: UIButton){
        indexPath_section = sender.tag
        //同じsttoryboard内であることをここで定義
        let storyboard: UIStoryboard = self.storyboard!
        //移動先のstoryboardを選択(Identifierを指定する)
        let second = storyboard.instantiateViewController(withIdentifier: "cellAdd")
        //実際に移動するコード
        self.present(second, animated: true, completion: nil)
    }
    
    /*
     セルを選択した時のイベントを追加
     */
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //記憶させてCellTapped.swiftで使う
        indexPath_section = indexPath.section
        indexPath_row = indexPath.row
        //同じstoryboard内であることをここで定義
        let storyboard: UIStoryboard = self.storyboard!
        //移動先のsotryboardを選択(Identtifierを指定する)
        let second = storyboard.instantiateViewController(identifier: "cellTapped")
        //実際に移動するコード
        self.present(second, animated: true, completion: nil)
    }
    
    
    
    //cellのlabelに書く文字列
    let name1: [String] = ["","",""]
    let name2: [String] = ["","",""]
    
    //遷移先のViewControllerに渡す変数
    var giveData: String = ""

    

    // MARK: - Table view data source
    
    //sectionの数を返す関数
   

    
    
    //sectionの高さを返す関数
     
    
    //sectionに載せる文字列を返す関数
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "section\(section)"
    }
    
   
        
        
    }
    
    //cellが押されたときに呼ばれる関数
    //画面遷移のもここで
    
    
    
    
   
    

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


