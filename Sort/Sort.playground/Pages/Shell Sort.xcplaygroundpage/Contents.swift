import Foundation

var str = "Hello, playground"

extension Array {
    mutating
    func toGroupingStr(_ gap: Int) -> String {
        var str = ""
        
        for i in 0..<gap {
            for index in stride(from: i, to: nums.count, by: gap) {
                str += "\(nums[index]) "
            }
            str += "\n"
        }
        
        return str
    }
}

func shellSort(_ nums: inout [Int]) {
    // 希尔排序，其实就是一种更高效的插入排序。把数组分成几个小的数组，然后各自进行插入排序。拼接。再分组，再插入。。。
    // 一般是取 数组长度 的 一半 为 分组的基数。然后循环。
    
    guard nums.count > 1 else { return }
    
    var basicGap = nums.count/2
    
    while basicGap > 0 {
        
        for gapStart in 0..<basicGap {
            
            // 开始 插入排序。从后往前遍历 直到找到对应的位置 插入
            for i in stride(from: gapStart + basicGap, to: nums.count, by: basicGap) {
                
                // 取 i 为 比较基数
                let temp = nums[i]
                var j = i
                // 从 i 开始，从后往前开始遍历，只有 该元素 比 temp 大，那么才会进行插入，也就是往后移动。
                while j >= basicGap && nums[j - basicGap] > temp {
                    nums[j] = nums[j - basicGap]
                    j -= basicGap
                }
                nums[j] = temp
                
                print("排列\(nums)\ni:\(i)\n" + nums.toGroupingStr(basicGap))
            }
            
            print(nums.toGroupingStr(basicGap))
        }
        
        basicGap /= 2
    }
}

var nums = [3,4,1,20,14,16,2]
shellSort(&nums)


