# https://leetcode.com/problems/two-sum/#/description

class Solution(object):
    def twoSum(self, nums, target):
        hash = {}
        for i in range(0, len(nums)):
            if not nums[i] in hash:
                hash[target - nums[i]] = i                
            else:
                return[hash[nums[i]], i]

