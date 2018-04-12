//
//  ViewController3.swift
//  Algorithm
//
//  Created by 雷神 on 2018/4/12.
//  Copyright © 2018年 雷神. All rights reserved.
//

import UIKit

class ViewController4: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var dataArray = [String]()
    
    var tableVi:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initPageView()
        
        initPageData()
        
        tableVi.reloadData()
    }
    
    
    func initPageView() {
        
        self.title = "其他经典算法问题"
        
        tableVi = UITableView.init()
        tableVi.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        tableVi.delegate = self
        tableVi.dataSource = self
        tableVi.register(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        
        view.addSubview(tableVi)
        
    }
    
    func initPageData(){
        dataArray.removeAll()
        dataArray.append("对公司几万员工年龄排序，要求时间效率O(n)")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        
        if dataArray.count-1 >= indexPath.section {
            cell.textLabel?.text = dataArray[indexPath.section]
            
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
//            UIAlertController.init(title: "", message: "", preferredStyle: <#T##UIAlertControllerStyle#>)
            
            let ing = [31,32,29,28,40,41,42,43,31,32,29,28,40,41,42,43]
            
            SortAges(agess: ing)
        } else {
            
        }
    }
    func SortAges(agess:[Int]) {
        var ages = agess
        
        guard ages.count > 0 else {
            return
        }
        
        let oldestAge = 99;
        var timesofAge = [Int].init(repeating: 0, count: 99)
        
        for age in ages {
            if (age < 0 || age > oldestAge) {
                print("age out of rang")
            }
            timesofAge[age] = timesofAge[age] + 1
        }
        // timesofAge是有序的
        var index = 0
        for i in 0..<oldestAge {
            for _ in 0..<timesofAge[i] {
                ages[index] = i
                index = index + 1
            }
        }
        
        print("ages:::\(ages)")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}




