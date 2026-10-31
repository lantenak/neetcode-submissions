def add_two_numbers() -> int:
    line = input()
    nums = line.split(",")
    num1, num2 = int(nums[0]), int(nums[1])
    return num1 + num2


# do not modify below this line
print(add_two_numbers())
print(add_two_numbers())
print(add_two_numbers())
print(add_two_numbers())
