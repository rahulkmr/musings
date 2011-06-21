#include <iostream>
#include <cstdio>

using std::cout;
using std::endl;

struct upto {
    upto(int from, int to) : from(from), to(to) {}

    int operator()() {
        if (from <= to)
            return from++;
        else
            return EOF;
    }

    private:
    int from;
    const int to;
};

int main(void)
{
    struct upto counter(5, 10);
    int val;
    while ((val = counter()) != EOF)
        cout << val << endl;
    return 0;
}
