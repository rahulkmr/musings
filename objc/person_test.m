#import <Foundation/Foundation.h>
#import "Person.h"
#import "Person+PersonNameAdditions.h"

int main(int argc, const char* argv[]) {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    id person = [Person new];
    [person sayHello];
    NSLog(@"%@", [person fullName]);
    NSLog(@"%@", [person lastNameFirstNameString]);
    [pool drain];
    return 0;
}
