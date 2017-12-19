//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

// MARK: Bubble Sort
func bubbleSort(_ nums: inout [Int]) {
    // 个数小于 1 的数组，没有比较的必要了～～
    guard nums.count > 1 else { return }
    
    // 冒泡排序 是 两两进行比较。
    // 开始遍历
    for i in 0..<nums.count {
        // 从 0 开始，往遍历比较。知道 i 的位置。如果检查到 nums[j] > nums[j + 1]，那么交换位置。
        for j in (0..<nums.count - 1 - i) where nums[j] > nums[j + 1] {
            nums.swapAt(j, j + 1)
        }
    }
}

var nums = [3,4,1,20,14,16,2]
bubbleSort(&nums)

