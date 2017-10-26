//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

var sourceArr = [2,3,1,9,10,4,6]
// MARK: Bubble Sort
func bubbleSort(_ nums: inout [Int]) -> [Int] {
    
    for i in 0..<nums.count {
        var j = nums.count - 1
        while j > i {
            if nums[j - 1] > nums[j] {
                print("\(nums[j-1])  \(nums[j])")
                let temp = nums[j - 1]
                nums[j - 1] = nums[j]
                nums[j] = temp
            }
            
            j -= 1
        }
    }
    
    return nums
}
