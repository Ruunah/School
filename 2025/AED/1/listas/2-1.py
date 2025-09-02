x = float(input("Input the first number : "))
y = float(input("Input the second number: "))
ot = input("Input the operation(+ - / * **): ")
match ot:
    case "+":
        z=x+y
    case "-":
        z=x-y
    case "*":
        z=x*y
    case "/":   
        z=x/y
    case "**":
        z=x
        for i in range(y):
            z*=x
    case _:
        z="Error: Invalid operation selected"
print(z)
exit
