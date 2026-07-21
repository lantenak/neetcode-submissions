from typing import List, Dict


def group_names_and_scores(names: List[str], scores: List[int]) -> Dict[str, int]:
    name_to_score_map = {}
    for name, score in zip(names, scores):
        name_to_score_map[name] = score
    return name_to_score_map


# do not modify below this line
print(group_names_and_scores(["Alice", "Bob", "Charlie"], [90, 80, 70]))
print(group_names_and_scores(["Jane", "Carol", "Charlie"], [25, 100, 60]))
print(group_names_and_scores(["Doug", "Bob", "Tommy"], [80, 90, 100]))
