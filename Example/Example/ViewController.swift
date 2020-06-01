//
//  ViewController.swift
//  Example
//
//  Created by jesse on 2017/6/16.
//  Copyright © 2017年 jesse. All rights reserved.
//

import UIKit
import CcExtensions
import RxSwift

class ViewController: UIViewController {
    
    var button: CustomButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("--------- \("2.1".cgFloat())")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    @IBAction func click(_ sender: Any) {
//        UIApplication.shared.presented?.present(SecondViewController(), animated: true, completion: nil)
    }
}

class CustomButton: UIButton {
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        titleLabel?.width = self.width
//    }
}



