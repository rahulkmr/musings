#import <Foundation/Foundation.h>

@interface Person : NSObject {
    NSString *_firstName;
    NSString *_lastName;
}
@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString *lastName;
@property (readonly) NSString *fullName;
- (id)initWithName: (NSString *)firstName lastName: (NSString *)aLastName;
- (void)sayHello;
- (void)saySomething:(NSString *)greeting;
@end
