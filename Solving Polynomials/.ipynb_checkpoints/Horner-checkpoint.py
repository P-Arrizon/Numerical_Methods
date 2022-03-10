# Pedro Arrizon
# 
#  This is an algorithm to evaluate a 
# polynomial using the Horner algorithm
# 
#  Polynomial must be in decending order of the powers of x

def main(p, n, x):

    #We first find the temp answer of our nested
    #equation from left to right
    ans = p[0]

    #We then go from left to right using a for loop 
    # starting from the second term in P(x)
    for i in range(1,n): 

        ans = ans*x + p[i]
    
    return(ans)



 
p = input('Give coefficients in decending order of power: (seperated by a space)')
p = p.split()
n = len(p)
x = input('evaluate at x = ')
 
print("Value of polynomial is " , main(p, n, x))