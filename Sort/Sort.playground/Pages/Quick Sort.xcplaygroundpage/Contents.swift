//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//sourceArr = [9,7,8,6,5,4,3,2,1]
//print(bubbleSort(&sourceArr))


// MARK: Quick Sort
/*
func quickSort(_ nums: inout [Int]) -> [Int] {
    
    // 快速排序一般以第二个数为起点，遍历，如果 数1 比 数2 大，那么交换位置，反正进行下一轮循环
    for i in 1..<nums.count {
        
        var j = i
        while j > 0 {
            if nums[j - 1] > nums[j] {
                print("\(nums[j - 1]) 大于 \(nums[j]), 交换吧")
                let temp = nums[j - 1]
                nums[j - 1] = nums[j]
                nums[j] = temp
                j -= 1
            } else {
                print("\(nums[j - 1]) 小于 \(nums[j]), 交换泥煤")
                break
            }
        }
    }
    return nums
}
 */

func quickSort(_ nums: inout [Int], low: Int, high: Int) {
    
    guard low < high else { return }
    
    var i = low
    var j = high
    let point = nums[i]
    var index = 1
    while i != j {
        
        while i < j && j > low {
            if nums[j] < point {
                break
            }
            j -= 1
        }
        
        print("第\(index)次\(j)")
        
        while i < j && i < high {
            if nums[i] > point {
                break
            }
            i += 1
        }
        print("第\(index)次\(i)")
        // 左右都找到满足条件的数，即 左边小于基数，右边大于基数 这个条件break
        // 交换位置
        let temp = nums[i]
        nums[i] = nums[j]
        nums[j] = temp
        
        print("第\(index)次的结果\(nums)")
        
        index += 1
    }
    
    // 此时 二者应该相等了 i == j，把 基数 放到这个位置去。。刚好中间，进行分割
    nums[low] = nums[i]
    nums[i] = point
    // 递归吧，已经分成两半了
    print("递归👉右边👉")
    quickSort(&nums, low: i + 1, high: high)
    print("递归👈左边👈")
    quickSort(&nums, low: low, high: i)
}

var testArr = [6, 1, 2, 7, 9, 3, 4, 5, 10, 8]


//quickSort(&testArr, low: 0, high: testArr.count - 1)

//print(testArr)

var test = [3,2,4,1,5]

quickSort(&test, low: 0, high: test.count - 1)

print(test)



