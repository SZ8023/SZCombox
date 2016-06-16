//
//  SZViewControllerOne.m
//  SZComboxDemo
//
//  Created by styshy on 16/6/8.
//  Copyright © 2016年 styshy. All rights reserved.
//

#import "SZViewControllerOne.h"
#import "SZCombox.h"

@interface SZViewControllerOne ()

@property (nonatomic, weak) SZCombox *combox;

@end

@implementation SZViewControllerOne

- (void)loadView {
    UIScrollView *szView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.view = szView;
    szView.contentSize = CGSizeMake(szView.bounds.size.width, 1500);
    szView.backgroundColor = [UIColor darkGrayColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"文字模式",@"混合模式"]];
    seg.frame = CGRectMake(120, 300, 200, 40);
    [self.view addSubview:seg];
    
    [seg addTarget:self action:@selector(chooseMode:) forControlEvents:UIControlEventValueChanged];
}

- (void)chooseMode:(UISegmentedControl *)segVc {
    [self.combox removeFromSuperview];
    if (segVc.selectedSegmentIndex == 0) {
        SZCombox *combox =  [[SZCombox alloc] initWithFrame:CGRectMake(30, 380,self.view.bounds.size.width - 60, 50)];
        self.combox = combox;
        [self.view addSubview:combox];
        self.combox.comboxDataArr = @[@"连云港",@"徐州",@"盐城",@"宿迁",@"南京",@"无锡",@"苏州",@"常州",@"南通"];
        self.combox.showTableRows = 7;
    } else {
        SZCombox *combox =  [[SZCombox alloc] initWithFrame:CGRectMake(30, 380,self.view.bounds.size.width - 60, 50)];
        self.combox = combox;
        [self.view addSubview:combox];
        self.combox.comboxDataArr = @[@"连云港",@"徐州",@"盐城",@"宿迁",@"南京",@"无锡",@"苏州",@"常州",@"南通"];
        self.combox.showTableRows = 7;
        NSMutableArray *imgArr = [NSMutableArray arrayWithCapacity:9];
        for (int i = 1; i<10; i++) {
            UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"国旗%d",i]];
            [imgArr addObject:img];
        }
        self.combox.comboxImgArr = [imgArr copy];
    }
}


@end
