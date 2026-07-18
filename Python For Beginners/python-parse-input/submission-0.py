from typing import List


def read_integers() -> List[int]:
    user_input = input()
    string_list = user_input.split(',')
    integer_list = [int(string) for string in string_list]
    return integer_list


# do not modify the code below
print(read_integers())
print(read_integers())
print(read_integers())
