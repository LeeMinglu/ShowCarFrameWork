//
//  ViewController.swift
//  ShowCarFrameWork
//
//  Created by 李明禄 on 16/8/22.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var carModelArray:[Car] = Array()
    var tableView: UITableView!
    let screenObjc = UIScreen.mainScreen().bounds

    override func viewDidLoad() {
        super.viewDidLoad()
      
        //字典转模型
        let carsPlist = NSBundle.mainBundle().pathForResource("cars_total.plist", ofType: nil)
        let carArray = NSArray(contentsOfFile: carsPlist!)
        
        for car in carArray! {
            self.carModelArray.append(Car.parse(dict: car as! NSDictionary))
        }
        
        
        
        let tableViewFrame = CGRectMake(0, 0, screenObjc.width, screenObjc.height)
        
        let tableView = UITableView.init(frame: tableViewFrame, style: UITableViewStyle.Grouped)
        
        self.tableView = tableView
        self.view.addSubview(self.tableView)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    
    //MARK: tableView的数据源方法
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.carModelArray.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let Car = self.carModelArray[section]
        return Car.cars.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //1.创建cell
        let ID = "car"
        var cell = tableView.dequeueReusableCellWithIdentifier(ID)
        
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.Value1, reuseIdentifier: ID)
        }
        
        
        //2.将cell赋值
        let Car = self.carModelArray[indexPath.section]
        let name = Car.cars[indexPath.row].name
        let icon = UIImage.init(named: Car.cars[indexPath.row].icon)!
        
        cell?.textLabel?.text = name
        cell?.imageView?.image = icon
        
       
        //显示叹号  !
//        cell?.accessoryType = UITableViewCellAccessoryType.DetailButton
        
        //显示对号
//         cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
        
        //叹号加指示箭头
//         cell?.accessoryType = UITableViewCellAccessoryType.DetailDisclosureButton
        
        //只显示指示箭头
         cell?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        let view = UIView()
        view.backgroundColor = UIColor.purpleColor()
        
        cell?.selectedBackgroundView = view
        
        
        //3.返回cell
        return cell!
    }
    
    
    //显示分组的title
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        var index:[String] = []
        for indexString in self.carModelArray {
            index.append(indexString.title)
        }
        
        return index
  
    }
    
    //返回Header标题
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let Car = self.carModelArray[section]
        return Car.title
    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        if indexPath.row % 2 == 0 {
//            let view = UIView.init()
//            view.backgroundColor = UIColor.redColor()
//            tableView.backgroundView = view
//        }
//    }
    
    
    

   
}

