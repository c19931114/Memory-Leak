//
//  ViewController.swift
//  MemoryLeak
//
//  Created by Crystal on 2018/8/30.
//  Copyright © 2018年 Crystal. All rights reserved.
//

import UIKit

class SendingVC: UIViewController {
    
 // 會 memory leak
    
    var receivingVC: ReceivingVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        receivingVC = ReceivingVC()
        
        receivingVC = nil
    }
    
    
}

class ReceivingVC {
    
    lazy var sendingVC = SendingVC()
    var closure: (() -> Void)?
    let text = "hi, i'm in the closure"

    init() {
        print("hi")

        closure = { [weak self] in
            print(self?.text)
        }
    }
    
    deinit {
        print("bye")
    }
}

