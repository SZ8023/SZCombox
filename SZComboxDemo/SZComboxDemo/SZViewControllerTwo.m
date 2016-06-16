//
//  SZViewControllerTwo.m
//  SZComboxDemo
//
//  Created by styshy on 16/6/8.
//  Copyright © 2016年 styshy. All rights reserved.
//

#import "SZViewControllerTwo.h"
#import "SZCombox.h"
@interface SZViewControllerTwo ()
@property (weak, nonatomic) IBOutlet SZCombox *combox;

@end

@implementation SZViewControllerTwo

- (void)viewDidLoad {
    self.combox.comboxDataArr = @[@"连云港",@"徐州",@"盐城",@"宿迁",@"南京",@"无锡",@"苏州",@"常州",@"南通"];
    self.combox.showTableRows = 7;
    NSMutableArray *imgArr = [NSMutableArray arrayWithCapacity:9];
    for (int i = 1; i<10; i++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"国旗%d",i]];
        [imgArr addObject:img];
    }
    self.combox.comboxImgArr = [imgArr copy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
