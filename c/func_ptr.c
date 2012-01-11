#include <stdio.h>

void func(void)
{
    printf("Hello from func\n");
}

void receiver(void (*func)(void))
{
    func();
}

int main(int argc, const char *argv[])
{
    receiver(func);
    return 0;
}
