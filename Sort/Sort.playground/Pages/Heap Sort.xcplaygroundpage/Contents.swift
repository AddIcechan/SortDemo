import Foundation

var str = "Hello, playground"

extension Array {
    
    /// 把 数组 转成 二叉树 的形式，字符串
    var binaryTreeStr : String {
        var str = ""
        var depth = 1
        for (index, element) in enumerated() {
            
            if index == 1 << (depth - 1) - 1 {
                str += "\n"
                depth += 1
            }
            str += "\(element) "
        }
        return str
    }
    
}

func heapSort(_ nums: inout [Int]) {
    let length = nums.count
    
    guard length > 1 else {
        return
    }
    
    // 堆，其实是一种二叉树的结构。二叉树有深度的概念，也就是 length/2。简单的理解，其实就是 层数 。也就是 nums.count / 2。
    let depthOfNums = length / 2
    // 创建最大堆，从 nums.count/2 的位置，往前算
    for i in (0..<depthOfNums).reversed() {
        maxHeapify(&nums, start: i, end: length - 1)
        print("build max heap: " + nums.binaryTreeStr)
    }
    // 得到最大堆了。最大堆：元素最大的置顶
    print("max heap: " + nums.binaryTreeStr)
    // 调整最大堆。去除最大的堆顶，剩下的按照 最大堆 调整
    
    for i in (1..<length).reversed() {
        // 最后一位数 和 堆顶进行交换，得到新的数组。排除最后一个元素，也就是 之前的堆顶，继续进行最大堆排序。循环，一直到只有一个元素位置。此时得到的就是 一个 升序排列 的数组了。
        
        // 1. 交换 堆顶和最后一个元素
        nums.swapAt(0, i)
        print("exchange max heap num to last one: " + nums.binaryTreeStr)
        // 2. 继续最大堆排列
        maxHeapify(&nums, start: 0, end: i - 1)
        print("new heap without last \(i) num: " + nums.binaryTreeStr)
    }
}

func maxHeapify(_ nums: inout [Int], start: Int, end: Int) {
    
    var dad = start
    var son = 2 * start + 1
    
    while son <= end {
        // 如果 右子树 存在，并且 左子树 的 元素 小于 右子树，那么 将 son + 1。某种程度上，可以说直接比较右子树和父节点。
        if son + 1 <= end && nums[son] <= nums[son + 1] {
            son += 1
        }
        // 如果父节点 > 子树，那么跳出循环，没必要比较。如果 父节点 <= 子树，那么交换子树。此时。父节点的 index 和 原先的子树 index 进行交换，并且更新子树。其实准备下一株 迷你树 的比较。一层接着一层比较。对。就酱紫。因为最大堆是从最下面一层开始调整的，所以也可以看成是从 一层 比较完，再往上比较多一层。
        if nums[dad] > nums[son] {
            return
        } else {
            // 交换
            nums.swapAt(dad, son)
            // 更新 父节点 和 子树
            dad = son
            son = dad * 2 + 1
        }
    }
}

var nums = [3,4,1,20,14,16,2]
print("source binary tree" + nums.binaryTreeStr)
heapSort(&nums)


