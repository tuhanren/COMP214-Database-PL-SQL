# TODO: create empty stack use list
stack = []

# TODO: PUSH
for i in range(1, 5):
 stack.append(i)

print(stack)

# TODO: pop
print(stack.pop())
print(stack)

########### Queue #########
# TODO: not use list, because remove from the beginning, O(n), inefficient, requiring moving all other elements down
from collections import deque

# TODO: create empty and adding
queue = deque()

for i in range(1, 5):
 queue.append(i)

print(queue)

# TODO: pop
print(queue.popleft())
print(queue)
