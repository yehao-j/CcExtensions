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
        
        button = CustomButton(frame: CGRect(x: 100, y: 300, width: 100, height: 100))
        button.titleForNormal = "瞄一眼"
        button.imageForNormal = #imageLiteral(resourceName: "icon_eye")
        button.titleForFont = UIFont.systemFont(ofSize: 17)
        button.backgroundColor = UIColor.red
        button.topIcon()
        view.addSubview(button)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("3------\(button.titleLabel?.bounds)")
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



