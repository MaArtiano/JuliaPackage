module MyPackage

# Testing

function rse_sum(x)

    return +(x...)
    
    end
    
    function rse_mean(x; Σ = rse_sum(x), L = length(x))
    
    return Σ/L
    
    end
    
    function rse_std(x,Mean = rse_mean(x), L = length(x))
    
    return sqrt.(rse_sum((x.-Mean).^2)/(L-1))
    
    end
    
    
    # With the dot comma we are introducing options, if we put it explicitily then he's gonna use the one we used, otherwise he's gonna evaluate it as we said it to be.
    function rse_tstat(x; σ = rse_std(x),L = length(x), Mean = rse_mean(x))
    
    return (Mean/σ).*sqrt(L)
    
    end
    
    
    struct StatResult
    x
    n
    std
    tvalue
    end
    
    function StatResult(x)
    
    return StatResult(x,length(x),rse_std(x),rse_tstat(x))   
    
    end
    
    function print(s::StatResult)
        println("The vector is the following:",lenght(s.x))
        println("Its length is: ",length(s.n))
        println("Std of x is:", length(s.std))
        println("Tvalues are:",length(s.tvalue))
    end    
    

    function printOwner()
            println("Marco Artiano")
    end
    #export rse_sum
    #export rse_mean
    #export rse_std
    #export rse_stat
    #export print
    #export StatResult

end # module MyPackage
