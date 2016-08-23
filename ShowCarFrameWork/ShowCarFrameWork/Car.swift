//
//  Car.swift
//  ShowCarFrameWork
//
//  Created by 李明禄 on 16/8/22.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class Car: Reflect {
    var title: String
    var cars: [Cars]
    
//    var carModelArray: NSArray

    class Cars: Reflect {
        var icon: String
        var name: String
        
        required init() {
            icon = ""
            name = ""
        }
    }

    
    required init() {
        title = ""
        cars = []
        
        
    }

}


