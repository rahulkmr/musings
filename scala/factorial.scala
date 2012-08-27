def factorial(i: Int): Int = {
    def fact(i: Int, acc: Int): Int =
        if (i <= 1)
            acc
        else
            fact(i-1, i*acc)
    fact(i, 1)
}

def factorial2(i: BigInt): BigInt = {
    def fact(i: BigInt, acc: BigInt): BigInt = i match {
        case _ if i == 1 => acc
        case _ => fact(i-1, i*acc)
    }
    fact(i, 1)
}

println(factorial(4))
println(factorial2(4))
