def yn(x, div1, div2):
    if x == 1 and div1:
        print("Yes")
        return
    
    if X == 2 and div2:
        print("Yes")
        return
    
    print("No")
    return

R, X = map(int, input().split(" "))

div1 = False
div2 = False

if R >= 1200 and R <= 2399:
    div2 = True

if R >= 1600 and R <= 2999:
    div1 = True

yn(X,div1,div2)