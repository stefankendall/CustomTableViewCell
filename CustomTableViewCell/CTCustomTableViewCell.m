#import "CTCustomTableViewCell.h"

@implementation CTCustomTableViewCell
+ (instancetype)create {
    NSString *cellClassName = NSStringFromClass([self class]);

    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:cellClassName owner:self options:nil];
    NSEnumerator *nibEnumerator = [nibContents objectEnumerator];
    UITableViewCell *cell = nil;
    NSObject *nibItem = nil;
    while ((nibItem = [nibEnumerator nextObject]) != nil) {
        if ([nibItem isKindOfClass:[self class]]) {
            cell = (UITableViewCell *) nibItem;
            if ([cell.reuseIdentifier isEqualToString:cellClassName])
                break;
            else
                cell = nil;
        }
    }
    return (CTCustomTableViewCell *) cell;
}
@end