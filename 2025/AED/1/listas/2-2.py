x=input("Input test scores:").split()
y=0
for i in range(len(x)):
    y+=x[i]
y/=len(x)
if z>=60:
    print("Aprovado")
else:
    print("Reprovado")
