x=input().split()
y=int(x[0])
count=0
for i in range(1, len(x)):
    if int(x[i])==y:
        count+=1
    elif int(x[i])>y:
        y=x[i]
if count==len(x)-1:
    print("Todos iguais")
else:
    print(y)
