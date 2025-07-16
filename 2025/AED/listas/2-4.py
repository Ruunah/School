x=input().split()
choice=input()
match choice:
    case 1:
        y=x[0]
        for i in range(1, len(x)):
            y+=x[i]
        print(y/len(x))
    case 2:
        y=x[0]
        z=x[0]
        for i in range(1, len(x)):
            if y>x[i]:
                y=x[i]
            if z<x[i]:
                z=x[i]
        print(y-z)
    case 3:
        y=x[0]
        for i in range(1, len(x)):
            y*=x[i]
        print(y)
    case 4:
        y=x[0]/x[1]
        print(y)
    case _:
        print("Error, non exitsent operation")
        exit
