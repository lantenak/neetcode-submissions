class TreeNode:
    def __init__(self, key: int, val: int):
        self.key = key
        self.val = val
        self.left = None
        self.right = None


class TreeMap:
    def __init__(self):
        self.root = None

    def insert(self, key: int, val: int) -> None:
        new_node = TreeNode(key, val)
        if not self.root:
            self.root = new_node
            return
        curr = self.root
        while True:
            if key < curr.key:
                if not curr.left:
                    curr.left = new_node
                    return
                curr = curr.left
            elif key > curr.key:
                if not curr.right:
                    curr.right = new_node
                    return
                curr = curr.right
            else:
                curr.val = val
                return

    def get(self, key: int) -> int:
        curr = self.root
        while curr:
            if key < curr.key:
                curr = curr.left
            elif key > curr.key:
                curr = curr.right
            else:
                return curr.val
        return -1

    def findMin(self, node: TreeNode) -> TreeNode:
        curr = node
        while curr and curr.left:
            curr = curr.left
        return curr

    def getMin(self) -> int:
        curr = self.findMin(self.root)
        return curr.val if curr else -1

    def getMax(self) -> int:
        curr = self.root
        while curr and curr.right:
            curr = curr.right
        return curr.val if curr else -1

    def removeHelper(self, node: TreeNode, key: int) -> TreeNode:
        if not node:
            return
        curr = node
        if key < curr.key:
            curr.left = self.removeHelper(curr.left, key)
        elif key > curr.key:
            curr.right = self.removeHelper(curr.right, key)
        else:
            if not curr.left:
                return curr.right
            if not curr.right:
                return curr.left
            min_node = self.findMin(curr.right)
            curr.key = min_node.key
            curr.val = min_node.val
            curr.right = self.removeHelper(curr.right, min_node.key)
        return curr

    def remove(self, key: int) -> None:
        self.root = self.removeHelper(self.root, key)

    def inorderTraversal(self, res: List[int], node: TreeNode) -> None:
        if not node:
            return
        self.inorderTraversal(res, node.left)
        res.append(node.key)
        self.inorderTraversal(res, node.right)

    def getInorderKeys(self) -> List[int]:
        res = []
        self.inorderTraversal(res, self.root)
        return res
