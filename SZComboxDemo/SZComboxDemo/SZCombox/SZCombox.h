//
//  SZCombox.h
//  SunMengMeng
//
//  Created by styshy on 16/6/7.
//  Copyright © 2016年 styshy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SZCombox;

@interface SZCombox : UILabel

@property (nonatomic, strong) NSArray *comboxDataArr;
@property (nonatomic, strong) NSArray *comboxImgArr;
@property (nonatomic, assign) NSInteger showTableRows;

@property (nonatomic, copy) NSString *selectedText;
@property (nonatomic, strong) UIImage *selectedImage;

@end
