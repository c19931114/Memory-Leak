//
//  ViewController.swift
//  MemoryLeak
//
//  Created by Crystal on 2018/8/30.
//  Copyright © 2018年 Crystal. All rights reserved.
//

import UIKit

protocol SendDataDelegate: class {
    
}

class SendingVC: UIViewController {
    
//    weak var delegate: SendDataDelegate? // 不會 memory leak
    var delegate: SendDataDelegate? // 會 memory leak
    
    var receivingVC: ReceivingVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        receivingVC = ReceivingVC()

        receivingVC = nil
    }
    
}

class ReceivingVC: SendDataDelegate {
    
    lazy var sendingVC = SendingVC()
    
    init() {
    
        print("hi")
        
        sendingVC.delegate = self // self refers to ReceivingVC object
        // 傳送端的 delegate 是接收端
    }
    
    deinit {
        print("bye")
    }
}

