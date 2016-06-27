#import <UIKit/UIKit.h>

@interface RootClass : NSObject

/**关联ID（活动ID）*/
@property (copy, nonatomic) NSString *RelatedId;

/**图片地址*/
@property (copy, nonatomic) NSString *ImgView;

/**活动描述*/
@property (copy, nonatomic) NSString *CommodityText;

@end