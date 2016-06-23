//
//	DJModel.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DJModel.h"

@interface DJModel ()
@end
@implementation DJModel


-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    [self setValuesForKeysWithDictionary:dictionary]; 
	return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"键值不匹配");
}

@end