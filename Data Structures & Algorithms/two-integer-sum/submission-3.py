class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        num_map = {}
        for ind, num in enumerate(nums):
            diff = target - num
            if diff in num_map:
                return [num_map[diff], ind]
            num_map[num] = ind