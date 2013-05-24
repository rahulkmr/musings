#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    size_t mem_size = (size_t)1 * 1024 * 1024 * 1024;
    void *p = malloc(mem_size);
    if (p == NULL)
        printf("Unable to allocate memory");
    else
        printf("Allocated %lu bytes", mem_size);
    free(p);
    return 0;
}
