//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

var sourceArr = [2,3,3,1,9,10,4,6]
// MARK: Bubble Sort
func bubbleSort(_ nums: inout [Int]) {
    // 个数小于 1 的数组，没有比较的必要了～～
    guard nums.count > 1 else { return }
    
    // 开始遍历
    for i in 0..<nums.count {
        // 从数组后面开始，往前遍历比较。知道 i 的位置。如果检查到 nums[j-1] > nums[j]，那么交换位置。
        for j in (i..<nums.count).reversed() where j > i {
            if nums[j - 1] > nums[j] {
                nums.swapAt(j, j - 1)
            }
        }
    }
}

bubbleSort(&sourceArr)

print(sourceArr)
