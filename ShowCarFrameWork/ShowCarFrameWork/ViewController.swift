//
//  ViewController.swift
//  ShowCarFrameWork
//
//  Created by 李明禄 on 16/8/22.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var carModelArray:[Car] = Array()

    override func viewDidLoad() {
        super.viewDidLoad()
      
        //字典转模型
        let carsPlist = NSBundle.mainBundle().pathForResource("cars_total.plist", ofType: nil)
        let carArray = NSArray(contentsOfFile: carsPlist!)
        
        for car in carArray! {
            self.carModelArray.append(Car.parse(dict: car as! NSDictionary))
        }
        
        for model in self.carModelArray {
            print(model)
        }
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

