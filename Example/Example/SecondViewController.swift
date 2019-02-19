//
//  SecondViewController.swift
//  Example
//
//  Created by jesse on 2017/7/26.
//  Copyright © 2017年 jesse. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let layer = UIView()
        layer.frame = CGRect(x: 0, y: 64, width: 100, height: 100)
        layer.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        view.addSubview(layer)
        
        layer.center = view.center

    }

    override func viewDidAppear(_ animated: Bool) {
        print("2======= \(UIApplication.shared.visibled)")
    }
    
    @IBAction func click(_ sender: Any) {
        
        let control: ViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        UIApplication.shared.navControl?.pushViewController(control, animated: true)
    }
}
