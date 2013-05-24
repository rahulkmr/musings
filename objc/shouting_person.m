#import "ShoutingPerson.h"

@implementation ShoutingPerson
- (void)saySomething:(NSString *)greeting {
    NSString *upcaseGreeting = [greeting uppercaseString];
    [super saySomething:upcaseGreeting];
}
@end
