#include <stdio.h>
#include <time.h>

int main(int argc, const char *argv[])
{
    time_t now = time(NULL);
    struct tm *tm_now = localtime(&now);
    printf("%d %d %d", tm_now->tm_hour, tm_now->tm_min, tm_now->tm_sec);
    return 0;
}
