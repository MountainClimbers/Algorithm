//
//  ViewController3.swift
//  Algorithm
//
//  Created by 雷神 on 2018/4/12.
//  Copyright © 2018年 雷神. All rights reserved.
//

import UIKit

class ViewController2: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
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
        
        self.title = "排序算法"
        
        tableVi = UITableView.init()
        tableVi.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        tableVi.delegate = self
        tableVi.dataSource = self
        tableVi.register(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        
        view.addSubview(tableVi)
        
        addFooterView()
        
    }
    
    func addFooterView(){
        let vi = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 40))
//        let lbl = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 21))
//        lbl.text = "测试"
        let btn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 40))
        
        btn.setTitle("测试", for: .normal)
        btn.setTitleColor(UIColor.green, for: .normal)
        btn.addTarget(self, action: #selector(testTap3), for: .touchUpInside)
        vi.addSubview(btn)
        tableVi.tableFooterView = vi
    }
    
    @objc func testTap3(){
        
    }

   
    
    func initPageData(){
        dataArray.removeAll()
        dataArray.append("归并排序")
        dataArray.append("快速排序")
        dataArray.append("冒泡排序")
        dataArray.append("堆排序")
        dataArray.append("基数排序")
        dataArray.append("希尔shell排序")
        dataArray.append("选择排序")
        dataArray.append("直接排序")
//        dataArray.append("直接排序")

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
        case 0:  //归并排序

            let items = [62,88,58,47,62,35,73,51,99,37,93]

            AlgorithmManange.sharedInstance.mergeSort(items: items)
            
            break
        case 1://快速排序
            
            var items = [62,88,58,47,62,35,73,51,99,37,93]
            print("快速排序前：\(items)")
            AlgorithmManange.sharedInstance.quickSort(&items, left: 0, right: items.count-1)
            print("快速排序后：\(items)")
            break
        case 2://冒泡排序
            break
        case 3://堆排序
            break
        case 4://基数排序
            break
        case 5://希尔shell排序
            break
        case 6://选择排序
            break
        case 7://直接排序
            break
        default:
            break
        }
    }
   
    
    /*
     归并排序
     */
    func mergeSort(_ arr: inout [Int]) {
        var gap = 1;
        while gap < arr.count {
            mergePass(&arr, gap: gap);
            
            gap *= 2;
        }
    }
    
    //分解合并序列，gap表示子序列的元素个数
    func mergePass(_ arr: inout [Int], gap: Int) {
        var i = 0;
        let count = arr.count;

        while i + 2 * gap - 1 < count {
            print("归并1：\(arr)")
            mergeArray(&arr, low: i, mid: i + gap - 1, high: i + 2 * gap - 1);
            print("归并11：\(arr)")

            i += 2 * gap;
        }
        
        //合并剩余的序列
        if i + gap - 1 < count {
            mergeArray(&arr, low: i, mid: i + gap - 1, high: count - 1);
            print("归并2：\(arr)")

        }
    }
    
    //合并两个序列
    func mergeArray(_ arr: inout [Int], low: Int, mid: Int, high: Int) {
        
        var i = low;
        var j = mid + 1;
        var k = 0;
        
        var array = Array<Int>(repeating: 0, count: high - low + 1);
        
        while i <= mid && j <= high {
            if arr[i] < arr[j] {
                array[k] = arr[i];
                i += 1;
                k += 1;
            } else {
                array[k] = arr[j];
                j += 1;
                k += 1;
            }
        }
        
        while i <= mid {
            array[k] = arr[i];
            i += 1;
            k += 1;
        }
        
        while j <= high {
            array[k] = arr[j];
            j += 1;
            k += 1;
        }
        
        //将排序好的序列复制回原数组
        k = 0;
        for i in low...high {
            arr[i] = array[k];
            
            k += 1;
        }
    }
    
//    func footer
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



