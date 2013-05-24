#import "Person+PersonNameAdditions.h"

@implementation Person (PersonNameAdditions)
- (NSString *)lastNameFirstNameString {
    return [NSString stringWithFormat:@"%@, %@", [self lastName], [self firstName]];
}
@end
