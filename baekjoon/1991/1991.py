class TreeNode:
    def __init__(self, value):
        self.value = value
        self.left = self.right = None
    
    # 주어진 문제의 입력을 처리하기 위한 함수
    def insert(self, value, lvalue, rvalue):
        # it always returns a node has value
        node = find(self, value)
        if lvalue != '.':
            node.left = TreeNode(lvalue)
        if rvalue != '.':
            node.right = TreeNode(rvalue)
    
def find(node, value):
    if node is None:
        return
    elif node.value == value:
        return node
    else:
        left = find(node.left, value)
        if left is not None:
            return  left
        right = find(node.right, value)
        return right

def preorder(node, array):
    if node is not None:
        array.append(node.value)
        preorder(node.left, array)
        preorder(node.right, array)

def inorder(node, array):
    if node is not None:
        inorder(node.left, array)
        array.append(node.value)
        inorder(node.right, array)

def postorder(node, array):
    if node is not None:
        postorder(node.left, array)
        postorder(node.right, array)
        array.append(node.value)

root = TreeNode('A')

size = int(input())
for _ in range(size):
    arr = input().split()
    root.insert(arr[0], arr[1], arr[2])

pre = []
in_arr = []
post = []
preorder(root, pre)
inorder(root, in_arr)
postorder(root, post)


print(''.join(pre))
print(''.join(in_arr))
print(''.join(post))
