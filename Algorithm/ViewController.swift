//
//  ViewController.swift
//  Algorithm
//
//  Created by 雷神 on 2018/4/12.
//  Copyright © 2018年 雷神. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
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
        self.title = "算法"

        tableVi = UITableView.init()
        tableVi.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        tableVi.delegate = self
        tableVi.dataSource = self
        tableVi.register(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        
        view.addSubview(tableVi)

    }
    
    func initPageData(){
        dataArray.removeAll()
        dataArray.append("排序算法")
        dataArray.append("查询算法")
        dataArray.append("其他经典算法问题")
        
        
        
        
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
            navigationController?.pushViewController(ViewController2.init(), animated: true)
        } else {
            navigationController?.pushViewController(ViewController3.init(), animated: true)

        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


