//
//  CounterModel.swift
//  CocoaMVCFromScratch
//
//  Created by 松本和也 on 2020/06/29.
//  Copyright © 2020 松本和也. All rights reserved.
//

import Foundation

class CounterModel {
    static let notificationName = "CounterModelChanged"
    
    let notificationCenter = NotificationCenter()
    // 今数値がいくらなのか保持する(データの保持)
    internal var count: Int = 0 {
        didSet {
            // Modelを監視しているコントローラーに変更を通知する
            notificationCenter.post(
                name: .init(rawValue: CounterModel.notificationName),
                object: count
            )
        }
    }
    // 数字を増やす/減らす(データの処理)
    func countUp(){ count += 1 }
    func countDown(){ count -= 1 }
}
