using Plots
using LaTeXStrings

function Newtons(x)

    #we must hard code our functions before hand along with the x_true value and tolerance. 
    f(x) = 0.67665e-8*(x^4)+0.266888e-5*(x^3)-0.127479e-3*(x^2)+0.018507
    dx(x) = (13533*x^3)/500000000000 + (100083*x^2)/12500000000 - (127479*x)/500000000

    x_true = 14.572530127583894
    tol = 2e-12
    iter = 50  # number of iterations allowed
    errors = []
    iters = []

    e(x_guess, x_true) = abs(x_guess - x_true) #error function
    Δx(x_new, x) = x_new - x #dx function
    nm(x) = x - (f(x)/dx(x))  #newtons method function
    err = e(x,x_true)
    append!(errors,err)

    println("initial: guess x = ", x, ", error = ", err )
   

    for i in range(1,iter)

        x_new = nm(x)

        de_x =Δx(x_new, x) 
        x += de_x
        err = e(x,x_true)
        append!(errors,err)
        println("Iter ",i,": x= ", x, ", dx = ", de_x, "error = ", err,)

        if abs(de_x) < tol
            println("The root is ", x, )
            println("it took ", i," iterations")
            println("iteration errors = ", errors)
            return errors
        end
        
    end
    print("failed")
end


function Rate_of_convergence()
    errors = Newtons(10)
    p = plot(title = L"Rate\ of\ Convergence\ (\alpha)", xlabel = L"$ln(e_i)", ylabel = L"$ln(e_{i+1)}", legend = :left)
    a_lst = []
    b_lst = []
    for i in range(1,length(errors)-1)
        a =  (log(errors[i+1]))
        b =  (log(errors[i]))
        append!(a_lst, a)
        append!(b_lst,b)
        println("For errors ", i, " and ", i+1, ": ln(ei+1)= ", a , ", ln(ei) = ", b, ", m = ",a/b )


    end
    plot!(b_lst,a_lst, label = L"\alpha_{e9} \approx 2.21 ", legendfontsize = 15)
end

Rate_of_convergence()