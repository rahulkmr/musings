let rec isOdd n = (n = 1) ||  isEven (n-1)
and isEven n = (n = 0) || isOdd(n-1)
