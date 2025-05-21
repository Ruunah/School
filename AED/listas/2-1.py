ot = input("Input the operation: ")
x = input("Input the first number : ")
y = input("Input the second number: ")
match ot:
    "+":
        z=x+y
        return "valid"
    "-":
        z=x-y
        return "valid"
    "*":
        z=x*y
