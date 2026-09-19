import math


class AreaCalc:
    def calculate(self, length: int, width: int = None) -> None:
        if width is None:
            radius = length
            return round(math.pi * radius**2, 2)
        return length * width

    
# Don't modify the following code
calc = AreaCalc()
print(calc.calculate(5))    
print(calc.calculate(4, 6))
