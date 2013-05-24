#import <stdio.h>
#import <Foundation/Foundation.h>

int main(int argc, const char* argv[]) {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSLog(@"Hello World!");
    printf("%s\n", "Hello from C");
    [pool drain];
    return 0;
}
