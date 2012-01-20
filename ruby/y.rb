Y = lambda {|h|
  lambda {|f|
    f[f]
  }[lambda {|f|
    h[lambda {|*args| f[f][*args] }]
  }]
}

fact = lambda {|recur|
  lambda {|n|
    return 1 if n < 2
    n * recur[n - 1]
  }
}

puts Y[fact][5]
