class Solution:
    def isConsecutive(self, nums: List[int]) -> bool:
        n = len(nums)
        num_set = set(nums)
        if n != len(num_set):
            return False
        x = min(nums)
        for num in range(x, x + n):
            if num not in num_set:
                return False
        return True