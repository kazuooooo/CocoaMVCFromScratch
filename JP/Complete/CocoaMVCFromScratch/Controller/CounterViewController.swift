//
//  ViewController.swift
//  CocoaMVCFromScratch
//
//  Created by 松本和也 on 2020/06/29.
//  Copyright © 2020 松本和也. All rights reserved.
//

import UIKit

class CounterViewController: UIViewController {
    // ViewとModelの参照を保持する
    @IBOutlet var counterView: CounterView!
    private(set) lazy var counterModel = CounterModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Modelの変更を監視する
        counterModel.notificationCenter.addObserver(
            self,
            selector: #selector(self.handleCountChange(_:)),
            name: .init(NSNotification.Name(rawValue: CounterModel.notificationName)), object: nil
        )
    }
    
    // 変更を検知する
    @objc func handleCountChange(_ notification: Notification) {
        if let count = notification.object as? Int {
            // Viewに描画処理を依頼する
            counterView.render(count: count)
        }
    }
    
    // 入力を受け付ける
    @IBAction func OnPlusButtonTapped(_ sender: Any) {
        // Modelに処理を依頼する
        counterModel.countUp()
    }
    
    @IBAction func OnMinusButtonTapped(_ sender: Any) {
        counterModel.countDown()
    }
}

