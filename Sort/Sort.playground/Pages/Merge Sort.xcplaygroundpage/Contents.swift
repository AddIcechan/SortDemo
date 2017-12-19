
import Foundation

var str = "Hello, playground"

// MARK: 自上而下
func mergeSortFromTopToBottom(_ nums: [Int]) -> [Int] {
    
    func merge(_ leftArr: [Int], rightArr: [Int]) -> [Int] {
        
        var left = 0, right = 0
        
        var resultArr : [Int] = []
        
        while left < leftArr.count && right < rightArr.count {
            
            if leftArr[left] < rightArr[right] {
                resultArr.append(leftArr[left])
                left += 1
                print(resultArr)
            } else if leftArr[left] > rightArr[right] {
                resultArr.append(rightArr[right])
                right += 1
                print(resultArr)
            } else {
                // 二者相等
                resultArr.append(leftArr[left])
                left += 1
                resultArr.append(rightArr[right])
                right += 1
                print(resultArr)
            }
            
        }
        
        // 如果 右数组 遍历完，左数组还有剩下，那么把左数组剩下的拼接上去
        
        for (index, element) in leftArr.enumerated() where index >= left {
            resultArr.append(element)
        }
        
        // 如果 左数组 遍历完，右数组还有剩下，那么把右数组剩下的拼接上去
        for (index, element) in rightArr.enumerated() where index >= right {
            resultArr.append(element)
        }
        
        return resultArr
        
    }

    
    // 如果数组只有一个元素，那么直接返回数组，无法拆分
    guard nums.count > 1 else {
        return nums
    }
    
    // 开始拆分
    let mid = nums.count / 2
    let leftArr = mergeSortFromTopToBottom(Array(nums[0..<mid]))
    let rightArr = mergeSortFromTopToBottom(Array(nums[mid..<nums.count]))
    
    return merge(leftArr, rightArr: rightArr)

}

// MARK: 从下而上
func mergeSorFromBottomToTop(_ nums: [Int]) -> [Int] {
    
    func compareToMerge(_ leftArr: [Int], rightArr: [Int]) -> [Int] {
        
        var left = 0, right = 0
        
        var resultArr : [Int] = []
        print(leftArr)
        print(rightArr)
        while left < leftArr.count && right < rightArr.count {
            if leftArr[left] < rightArr[right] {
                resultArr.append(leftArr[left])
                left += 1
            } else if leftArr[left] > rightArr[right] {
                resultArr.append(rightArr[right])
                right += 1
            } else {
                resultArr.append(leftArr[left])
                left += 1
                resultArr.append(rightArr[right])
                right += 1
            }
        }
        
        for (index, element) in leftArr.enumerated() where index >= left {
            resultArr.append(element)
        }
        
        for (index, element) in rightArr.enumerated() where index >= right {
            resultArr.append(element)
        }
        
        return resultArr
    }
    
    func traverse(_ nums: [[Int]]) -> [[Int]] {
        
        var tempNums : [[Int]] = []
        for (index, evenNum) in nums.enumerated() where index % 2 == 0 {
            print("index:\(index) element:\(evenNum)")
            if index == nums.count - 1 {
                // 如果刚好是最后一个。。那么直接拼接上去
                tempNums.append(evenNum)
                break
            }
            // 奇数 index：1, 3, 5, 7...
            let oddNum = nums[index + 1]
            print("index:\(index) even:\(evenNum) odd\(oddNum)")
            // 相邻两个数做比较
            let tempNum = compareToMerge(evenNum, rightArr: oddNum)
            print("排序后的 tempNum \(tempNum)")
            tempNums.append(tempNum)
            print(tempNums)
        }
        
        if tempNums.count == 1 {
            return tempNums
        }
        
        return traverse(tempNums)
    }
    
    guard nums.count > 1 else {
        return nums
    }
    
    let newNums : [[Int]] = nums.map{[$0]}
    let tempNums = traverse(newNums)
    
    return tempNums.first!
}

let nums = [3,4,1,20,14,16,2]
print(mergeSortFromTopToBottom(nums))
print(mergeSorFromBottomToTop(nums))



