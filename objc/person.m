#import "Person.h"

@implementation Person
@synthesize firstName = _firstName;
@synthesize lastName = _lastName;
- (id)init {
    return [self initWithName:@"Rahul" lastName:@"Kumar"];
}

- (id)initWithName: (NSString *)aFirstName lastName: (NSString *)aLastName {
    self = [super init];
    if (self) {
        _firstName = aFirstName;
        _lastName = aLastName;
    }
    return self;
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

- (void)sayHello {
    [self saySomething:@"Hello, World!"];
}

- (void)saySomething:(NSString *)greeting {
    NSLog(@"%@", greeting);
}
@end

