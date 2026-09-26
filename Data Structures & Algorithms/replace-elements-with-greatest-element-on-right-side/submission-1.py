class Solution:
    def replaceElements(self, arr: List[int]) -> List[int]:
        n = len(arr)
        res = [0] * n
        for i in range(n):
            right_max = -1
            for j in range(i + 1, n):
                right_max = max(right_max, arr[j])
            res[i] = right_max
        return res