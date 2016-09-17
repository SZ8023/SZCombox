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

/** 需要显示的文本数组 */
@property (nonatomic, strong) NSArray *comboxDataArr;
/** 需要显示的图片数组 */
@property (nonatomic, strong) NSArray *comboxImgArr;
/** 需要显示多少行，默认显示6行 */
@property (nonatomic, assign) NSInteger showTableRows;

/** 获取选中的索引 */
@property (nonatomic, assign) NSInteger selectedIndex;
/** 获取选中的文本 */
@property (nonatomic, copy) NSString *selectedText;
/** 获取选中的图片 */
@property (nonatomic, strong) UIImage *selectedImage;


/**
 *  点击combox选项之后触发的事件
 */
- (void)comboxTapClick:(void (^)(NSInteger selectedIndex,NSString *selectedText,UIImage *selectedImage))comboxClick;

@end
