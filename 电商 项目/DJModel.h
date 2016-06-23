#import <UIKit/UIKit.h>

@interface DJModel : NSObject
/**商品文本*/
@property (nonatomic, strong) NSString * commodityText;
/**图片*/
@property (nonatomic, strong) NSString * imgView;
/**相关ID*/
@property (nonatomic, strong) NSString * relatedId;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end