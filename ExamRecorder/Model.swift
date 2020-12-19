//
//  Model.swift
//  ExamRecorder
//
//  Created by Sayaka Abe on 2020/12/05.
//  Copyright © 2020 com.litech. All rights reserved.
//

import Foundation
import RealmSwift


class Test: Object {
    @objc dynamic var date = "" //日付
    @objc dynamic var score = "" //点数
    @objc dynamic var subject = "" //科目
    @objc dynamic var review = "" //反省
    @objc dynamic var goal = "" //目標
    @objc dynamic var toDo = "" //やること
}
