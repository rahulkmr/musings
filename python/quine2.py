def quine(source):
    quote = '"' * 3
    print source + '(' + quote + source + quote + ')'

quine("""def quine(source):
    quote = '"' * 3
    print source + '(' + quote + source + quote + ')'

quine""")
