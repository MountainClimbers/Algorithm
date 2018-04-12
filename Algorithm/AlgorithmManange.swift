//
//  AlgorithmManange.swift
//  Algorithm
//
//  Created by qj.huang on 2018/4/12.
//  Copyright © 2018年 雷神. All rights reserved.
//

import UIKit

/*
 单例
 */
let AlgorithmManangeSingle = AlgorithmManange()

class AlgorithmManange: NSObject {

    class var sharedInstance : AlgorithmManange {
        return AlgorithmManangeSingle
    }
    
    /*
     归并排序 循环
     */
     func mergeSort(items:[Int]){
        print("归并排序前：\(items)")
        
        /*原理
         拆分+合并
         */
        var tempArray = [[Int]]()
        for item in items {
            var subArray = [Int]()
            subArray.append(item)
            tempArray.append(subArray)/*
             拆分
             [62, 88, 58, 47, 62, 35, 73, 51, 99, 37, 93] 拆分成
             [[62], [88], [58], [47], [62], [35], [73], [51], [99], [37], [93]]
             */
        }
        
//        print("list\(tempArray)")
        while tempArray.count != 1 {
            var i=0
            while i < tempArray.count - 1 {
//                print("将\(tempArray[i])与\(tempArray[i+1])合并")
                /*
                 合并
                 i = 0  mergeArrayxxxxx后tempArray[0]被赋值 tempArray[1]变删除了
                 再i+1 遍历第三个数组和第四个数字tempArray[1] 和 tempArray[2]
                 */
                tempArray[i] = mergeArray(tempArray[i], tempArray[i+1])
//                print("tempArray[i]\(tempArray[i])")
                tempArray.remove(at: i+1)
                i += 1
                
            }
        }
        if let arr = tempArray.first {
            print("归并排序后：\(arr)")
        }
        
//        return tempArray.first
    }
    /*
     归并排序：array1 array2均为两个有序数组
     return: 返回值新的有序数组
     */
    private func mergeArray(_ array1:[Int], _ array2:[Int]) -> [Int] {
        let a = array1
        let b = array2
        var c = [Int]()
        var i=0
        var j=0
        while (i<a.count && j<b.count) {//下标要小于数组个数
            if(a[i]<b[j]){
                c.append(a[i])
                /*
                 c只取小的
                 通过下标来取。
                 取到数值小的数组下标加1 再比较
                 */
                i += 1
            }else {
                c.append(b[j])
                /*
                 c只取小的
                 通过下标来取。
                 取到数值小的数组下标加1 再比较
                 */
                j += 1
            }
        }
        while (i<a.count) { /*如果进入循环代表该数组还有数没添加到c数组。表示很大的数*/
            //下标要小于数组个数
            c.append(a[i])
            i += 1
        }
        
        while (j<b.count) {  /*如果进入循环代表该数组还有数没添加到c数组。表示很大的数*/
            //下标要小于数组个数
            c.append(b[j])
            j += 1
        }
        return c
    }
    
    /*
     快速排序 循环
     */
    func quickSort(_  array: inout [Int] ,left: Int, right:Int){
        if left >= right {//如果数组长度为0或1时返回
            return
        }
        
        var i = left
        var j = right
        
        //记录比较基准数
        let key = array[i]
        
        while(i<j){
            /**** 首先从右边j开始查找比基准数小的值 ***/
//            print("j是从右边往左边比较，找到比key\(key)小的数。把小数往前面抛 当前下标j为\(j),当前数\(array[j])")
            while(i<j && array[j] >= key) {
                j -= 1
            }
//            print("当前下标j为：\(j)")

            //如果比基准数小，则将查找到的小值调换到i的位置
            array[i] = array[j]
            
            /**** 当在zu边查找到一个比基准数小的值时，就从i开始往后找比基准数大的值 ***/
//            print("i是从左边往右边比较，找到比key\(key)大的数。把大数往后面抛，当前下标i为\(i),当前数\(array[i])")
            while(i<j && array[i] <= key){
                i += 1
            }
//            print("当前下标i为：\(i)")

            //如果比基准数大，则将查找到的大值调换到j的位置
            array[j] = array[i]

        }
        
        //当i==j表示已经把所有比key小的放到它的前面，把所有比key大的放到它的后面。最后将基准数放到正确位置
        array[i] = key
        
        /**** 递归排序 ***/
        //排序基准数左边的
        quickSort(&array, left: left, right: i-1)
        //排序基准数右边的
        quickSort(&array, left: i+1, right: right)

    }
 
    /*
     快速排序 递归
     */
    func quickSort2(_ array: inout [Int] ,left: Int, right:Int){
        if left >= right {//如果数组长度为0或1时返回
            return
        }
        
        var i = left
        var j = right
        
        //记录比较基准数
        let key = array[i]
        
        while(i<j){
            /**** 首先从右边j开始查找比基准数小的值 ***/
            //            print("j是从右边往左边比较，找到比key\(key)小的数。把小数往前面抛 当前下标j为\(j),当前数\(array[j])")
            while(i<j && array[j] >= key) {
                j -= 1
            }
            //            print("当前下标j为：\(j)")
            
            //如果比基准数小，则将查找到的小值调换到i的位置
            array[i] = array[j]
            
            /**** 当在zu边查找到一个比基准数小的值时，就从i开始往后找比基准数大的值 ***/
            //            print("i是从左边往右边比较，找到比key\(key)大的数。把大数往后面抛，当前下标i为\(i),当前数\(array[i])")
            while(i<j && array[i] <= key){
                i += 1
            }
            //            print("当前下标i为：\(i)")
            
            //如果比基准数大，则将查找到的大值调换到j的位置
            array[j] = array[i]
            
        }
        
        //当i==j表示已经把所有比key小的放到它的前面，把所有比key大的放到它的后面。最后将基准数放到正确位置
        array[i] = key
        
        /**** 递归排序 ***/
        //排序基准数左边的
        quickSort2(&array, left: left, right: i-1)
        //排序基准数右边的
        quickSort2(&array, left: i+1, right: right)

    }
    
}
