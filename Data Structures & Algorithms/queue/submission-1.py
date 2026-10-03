class Node:
    def __init__(self, val=0):
        self.val = val
        self.prev = None
        self.next = None

class Deque:
    
    def __init__(self):
        self.left = Node()
        self.right = Node()
        self.left.next = self.right
        self.right.prev = self.left

    def isEmpty(self) -> bool:
        return self.left.next == self.right

    def append(self, value: int) -> None:
        node, prev, next = Node(value), self.right.prev, self.right
        prev.next = node
        next.prev = node
        node.prev = prev
        node.next = next

    def appendleft(self, value: int) -> None:
        node, prev, next = Node(value), self.left, self.left.next
        prev.next = node
        next.prev = node
        node.prev = prev
        node.next = next

    def pop(self) -> int:
        if self.isEmpty():
            return -1
        node = self.right.prev
        value = node.val
        prev, next = node.prev, node.next
        prev.next = next
        next.prev = prev
        return value

    def popleft(self) -> int:
        if self.isEmpty():
            return -1
        node = self.left.next
        value = node.val
        prev, next = node.prev, node.next
        prev.next = next
        next.prev = prev
        return value