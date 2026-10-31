from typing import List


def read_integers() -> List[int]:
    number_string = input()
    string_list = number_string.split(",")
    number_list = []
    for string in string_list:
        number = int(string)
        number_list.append(number)
    return number_list


# do not modify the code below
print(read_integers())
print(read_integers())
print(read_integers())
