#import <UIKit/UIKit.h>

@interface ClassModel : NSObject

@property (nonatomic, strong) NSString * goodsType;
@property (nonatomic, strong) NSString * goodsTypeName;
@property (nonatomic, strong) NSString * imgView;

+ (instancetype)getTheDataSource:(NSDictionary*)dic;

@end