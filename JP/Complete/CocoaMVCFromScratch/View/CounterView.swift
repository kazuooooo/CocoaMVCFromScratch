//
//  CounterView.swift
//  CocoaMVCFromScratch
//
//  Created by 松本和也 on 2020/06/29.
//  Copyright © 2020 松本和也. All rights reserved.
//

import Foundation
import UIKit

class CounterView: UIView {
    
    @IBOutlet weak var countLabel: UILabel!
    public func render(count: Int){
        countLabel.text = String(count)
    }
}
