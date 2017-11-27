import Foundation

var str = "Hello, playground"

func heapSort(_ nums: inout [Int]) {
    guard nums.count > 1 else {
        return
    }
    
    for i in (0..<(nums.count/2)).reversed() {
        maxHeapify(&nums, start: i, end: nums.count - 1)
        print("build max heap: \(nums)")
    }
    
//    return
    for i in (1..<nums.count).reversed() {
        let temp = nums[i]
        nums[i] = nums[0]
        nums[0] = temp
        maxHeapify(&nums, start: 0, end: i - 1)
    }
}

func maxHeapify(_ nums: inout [Int], start: Int, end: Int) {
    
    var dad = start
    var son = 2 * start + 1
    while son <= end {
        if son + 1 <= end && nums[son] >= nums[son + 1] {
            son += 1
        }
        if nums[dad] < nums[son] {
            return
        } else {
            let temp = nums[dad]
            nums[dad] = nums[son]
            nums[son] = temp
            dad = son
            son = dad * 2 + 1
        }
    }
}

var nums = [16,14,20,0]
heapSort(&nums)
print(nums)



