import Foundation

var str = "Hello, playground"

func insertionSort(_ nums: inout [Int]) {
    
    // 从第二位开始，也就是 index 为 1
    for i in 0..<nums.count where i > 0 {
        
        let temp = nums[i]
        
        // 从 i 开始，从后往前开始遍历，只有 该元素 比 temp 大，那么才会进行插入，也就是往后移动
        var j = i - 1
        print("i:\(i)___j:\(j)___temp:\(temp)___nums:\(nums)")
        while j >= 0 && nums[j] > temp {
            nums[j + 1] = nums[j]
            print("i:\(i)___j:\(j)___nums:\(nums)")
            j -= 1
        }
        nums[j + 1] = temp
    }
    
}

var sourceArr = [2,3,3,1,9,10,4,6]
print(sourceArr)
insertionSort(&sourceArr)
print(sourceArr)



