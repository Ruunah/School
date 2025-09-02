import math
x=input().split()
choice=int(input())
match choice:
    case 1:
        y=float(x[0])
        for i in range(x[1]):
            y*=x[0]
        print(round(y, 2))
    case 2:
        print(round(math.sqrt(x[0]), 2), round(math.sqrt(x[1]), 2))
    case _:
        print("Error non existent operation")
exit
