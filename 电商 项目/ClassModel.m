//
//	ClassModel.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ClassModel.h"

@interface ClassModel ()
@end
@implementation ClassModel

+ (instancetype)getTheDataSource:(NSDictionary *)dic{
    ClassModel *model = [[ClassModel alloc] init];
    model.imgView = dic[@"ImgView"];
    model.goodsType = dic[@"goodsType"];
    model.goodsTypeName = dic[@"goodsTypeName"];
    return model;
}



@end