#include <stdio.h>

int counter(const int _from, const int _to) {
    static int from = _from;
    static int to = _to;
    if (from <= to)
        return from++;
    else
        return EOF;
}

int main(int argc, const char *argv[])
{
    int val;
    while((val = counter(5, 10)) != EOF)
        printf("%d \n", val);
    return 0;
}
