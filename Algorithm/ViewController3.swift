//
//  ViewController3.swift
//  Algorithm
//
//  Created by 雷神 on 2018/4/12.
//  Copyright © 2018年 雷神. All rights reserved.
//

import UIKit

class ViewController3: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
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
        self.title = "查询算法"

        tableVi = UITableView.init()
        tableVi.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        tableVi.delegate = self
        tableVi.dataSource = self
        tableVi.register(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        
        view.addSubview(tableVi)
        
    }
    
    func initPageData(){
        dataArray.removeAll()
        dataArray.append("顺序查找")
        dataArray.append("二分查找 循环")
        dataArray.append("二分查找 递归")
        dataArray.append("插值查找")
        dataArray.append("斐波那契查找")
        dataArray.append("二叉排序树查找")
        dataArray.append("分块查找")
        dataArray.append("哈希查找")
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
        switch indexPath.section {
        case 0:
            break
        case 1:
            let array = [1,3,5,6,7,8,11,13,15,17]
            
            let returnNum = BinarySearch(array: array, searchValue: 13, low: 0, high: array.count - 1)
            
            if returnNum < 0{
                print("xxxxx不存在此数")
            } else {
                print("xxxxx找到了在第\(returnNum + 1)个位置")
            }
            
            break
        case 2:
            let array = [1,3,5,6,7,8,11,13,15,17]
            
            let returnInt =  BinarySearch2(array: array, searchValue: 13, low: 0, high: array.count - 1 )
            if returnInt < 0{
                print("xxx不存在此数")
            } else {
                print("xxx找到了在第\(returnInt + 1)个位置")
            }
            break
        case 3:
            let array = [3,5,13,23,19,21,20,90,1,18]
            print("插值查询：\(InsertionSearch(array, 20, low: 0, high: array.count - 1))")
            break
        case 4:
            break
        case 5:
            break
        case 6:
            break
        case 7:
            break
        case 8:
            
            break
        default:
            break
        }
    }
    
    func InsertionSearch(_ array:[Int],_ searchValue:Int, low:Int,  high:Int) -> Int{
       if low < high {
        
        let searchValue = 1
        var mid = low + (searchValue - array[low])
        let mid2 = (array[high] - array[low]) * (high - low)
        mid = mid / mid2
    
            if(array[mid]==searchValue){
                return mid
            }
            if(array[mid]>searchValue){
                return             InsertionSearch(array, searchValue, low: low, high: mid-1)
            }
            if(array[mid]<searchValue){
                return             InsertionSearch(array, searchValue, low: mid+1, high: high)
            }
        }
        
        return  -1
    }
    /*
     //插值查找
     int InsertionSearch(int a[], int value, int low, int high)
     {
     int mid = low+(value-a[low])/(a[high]-a[low])*(high-low);
     if(a[mid]==value)
     return mid;
     if(a[mid]>value)
     return InsertionSearch(a, value, low, mid-1);
     if(a[mid]<value)
     return InsertionSearch(a, value, mid+1, high);
     }
     */
    
    /*
     循环二分查找
     */
    func BinarySearch(array:[Int],searchValue:Int, low: Int, high: Int) -> Int{
        
        var low = low
        
        var high = high
        
        while low<high {
            let mid = (low + high) / 2
            if array[mid] == searchValue {
                return mid
            }
            
            if (array[mid] > searchValue) {
                high = mid - 1
            }
            
            if (array[mid] < searchValue) {
                low = mid + 1
            }
        }
        
        return -1
        
    }
    
    /*
     递归二分查找
     */
    func BinarySearch2(array:[Int],searchValue:Int, low: Int, high: Int) -> Int{
        
        let mid = (low + high) / 2
        
        if(array[mid]==searchValue)
        {
            return mid;
        }
        
        if(array[mid]>searchValue){
            return BinarySearch2(array:array,searchValue:searchValue,low:low,high:mid-1)
            
        }
        if(array[mid]<searchValue){
            return BinarySearch2(array:array,searchValue:searchValue,low:mid+1,high:high)
        }
        
        return -1
        
    }
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



