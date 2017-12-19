//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/// MARK: version 1
func quickSort(_ nums: inout [Int], low: Int, high: Int) {
    
    guard low < high, high < nums.count else { return }
    
    var i = low
    var j = high
    // 快速排序是选择一个基数作为一个比较点，然后进行遍历。如果是要生序排列，那么就是 小的放基数左边，大的放基数右边。基数放中间。然后数组就相当于切割成两半。继续选择基数，切割。
    let point = nums[i]
    
    while i != j {
        // j 从最高位开始往低位找起，直到 i > j
        while i < j && j > low {
            if nums[j] < point {
                break
            }
            j -= 1
        }
        // i 从最低位开始往高位遍历，直到 i > j
        while i < j && i < high {
            if nums[i] > point {
                break
            }
            i += 1
        }
        
        // 左右都找到满足条件的数，即 左边小于基数，右边大于基数 这个条件break
        // 交换位置
        nums.swapAt(i, j)
        
    }
    
    // 此时 二者应该相等了 i == j，把 基数 放到这个位置去。。刚好中间，进行分割
    nums[low] = nums[i]
    nums[i] = point
    
    // 以 i 为分界点，分成左右两部分进行递归
    quickSort(&nums, low: i + 1, high: high)
    
    quickSort(&nums, low: low, high: i)
}

var nums = [3,4,1,20,14,16,2]
quickSort(&nums, low: 0, high: nums.count - 1)


