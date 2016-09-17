//
//  SZCombox.m
//  SunMengMeng
//
//  Created by styshy on 16/6/7.
//  Copyright © 2016年 styshy. All rights reserved.
//

#import "SZCombox.h"

#define ComboxWidth self.bounds.size.width
#define ComboxHeight self.bounds.size.height
#define SZWIDTH [UIScreen mainScreen].bounds.size.width
#define SZHEIGHT [UIScreen mainScreen].bounds.size.height

@interface SZCombox()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, weak) UIImageView *dropImg;
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) UIControl *viewControl;
@property (nonatomic, weak) UIImageView *imgView;
@property (nonatomic, assign) CGRect selectedImgFrame;
@property (nonatomic, assign) CGRect selectedTextFrame;
@property (nonatomic ,copy) void (^comboxTapClick)(NSInteger selectedIndex,NSString *selectedText,UIImage *selectedImage);

@end

@implementation SZCombox

-(void)drawTextInRect:(CGRect)rect {
    return [super drawTextInRect:self.selectedTextFrame];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initSubView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initSubView];
    }
    return self;
}

- (void)initSubView {
    self.selectedIndex = -1;
    self.selectedText = nil;
    self.selectedImage = nil;
    
    self.selectedTextFrame = CGRectMake(16, 0, ComboxWidth, ComboxHeight);
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.userInteractionEnabled = YES;
    self.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.layer.shadowOpacity = 1.0f;
    self.backgroundColor = [UIColor whiteColor];
    
    self.text = @"-- 请选择 --";
    
    UIImageView *dropImg= [[UIImageView alloc] init];
    self.dropImg = dropImg;
    self.dropImg.image = [UIImage imageNamed:@"szResource.bundle/triangle_down.png"];
    [self addSubview:self.dropImg];
    
    self.viewControl = [[UIControl alloc] init];
    [self.viewControl addTarget:self action:@selector(controlPressed) forControlEvents:UIControlEventTouchUpInside];
    self.viewControl.alpha = 1.0f;
    
    
    UITableView *tableView = [[UITableView alloc] init];
    self.tableView = tableView;
    [self.viewControl addSubview:self.tableView];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = self.bounds.size.height;
    self.tableView.layer.borderWidth = 1.0;
    self.tableView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [self addGestureRecognizer:tapGestureRecognizer];
    
}



- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat imgH = ComboxHeight * 0.5;
    CGFloat imgW = imgH;
    CGFloat imgX = ComboxWidth - imgH * 1.5;
    CGFloat imgY = imgH * 0.5;
    self.dropImg.frame = CGRectMake(imgX, imgY, imgW, imgH);
    
    self.viewControl.frame = CGRectMake(0, 0, SZWIDTH, SZHEIGHT);
    
    [self bringSubviewToFront:self.dropImg];
    [self bringSubviewToFront:self.imgView];
}

#pragma mark UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.comboxDataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *comboxID = @"comboxID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:comboxID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:comboxID];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.textLabel.text = self.comboxDataArr[indexPath.row];
    if (self.comboxImgArr != nil && self.comboxImgArr.count > 0) {
        cell.imageView.image = self.comboxImgArr[indexPath.row];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    self.selectedIndex = indexPath.row;
    
    self.selectedText = self.comboxDataArr[indexPath.row];
    self.text = self.selectedText;
    
    if (self.comboxImgArr != nil && self.comboxImgArr.count > 0) {
        self.selectedImage = self.comboxImgArr[indexPath.row];
        
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        self.selectedImgFrame = cell.imageView.frame;
        self.selectedTextFrame = cell.textLabel.frame;
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:self.selectedImgFrame];
        self.imgView = imgView;
        self.imgView.image =  self.selectedImage;
        [self addSubview:self.imgView];
    }
    [self controlPressed];
    
    if (self.comboxTapClick) {
        self.comboxTapClick(self.selectedIndex,self.selectedText,self.selectedImage);
    }
    
}

- (void)comboxTapClick:(void (^)(NSInteger, NSString *, UIImage *))comboxClick {
    self.comboxTapClick = comboxClick;
}


- (void)tapped:(UITapGestureRecognizer *)gesture {
    UIWindow *mainWindow = [[UIApplication sharedApplication] keyWindow];
    [mainWindow addSubview:self.viewControl];
    
    CGRect convertRect = [self.superview convertRect:self.frame toView:mainWindow];
    
    CGFloat tabX = convertRect.origin.x;
    CGFloat tabY = convertRect.origin.y + convertRect.size.height;
    if (self.showTableRows == 0) {
        self.showTableRows = 6;
    }
    CGFloat tabH = self.showTableRows * ComboxHeight;
    
    if ((tabY + tabH) > SZHEIGHT ) {
        self.tableView.frame = CGRectMake(tabX, tabY - convertRect.size.height/2, ComboxWidth, 0);
        [UIView animateWithDuration:0.5 animations:^{
            self.viewControl.backgroundColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0f];
            self.tableView.bounds = CGRectMake(0, 0, ComboxWidth, tabH);
            if (tabH > SZHEIGHT) {
                self.tableView.frame = CGRectMake(tabX, 0, ComboxWidth, SZHEIGHT);
            } else {
                self.tableView.center = self.viewControl.center;
            }
        }];
    } else {
        self.tableView.frame = CGRectMake(tabX, tabY, ComboxWidth, 0);
        [UIView animateWithDuration:0.3 animations:^{
            self.tableView.frame = CGRectMake(tabX, tabY, ComboxWidth, tabH);
        }];
    }
}

- (void)controlPressed {
    UIWindow *mainWindow = [[UIApplication sharedApplication] keyWindow];
    [mainWindow addSubview:self.viewControl];
    
    CGRect convertRect = [self.superview convertRect:self.frame toView:mainWindow];
    
    CGFloat tabX = convertRect.origin.x;
    CGFloat tabY = convertRect.origin.y + convertRect.size.height;
    if (self.showTableRows == 0) {
        self.showTableRows = 6;
    }
    CGFloat tabH = self.showTableRows * ComboxHeight;
    
    if ((tabY + tabH) > SZHEIGHT ) {
        CGFloat tempTabX = self.tableView.frame.origin.x;
        
        [UIView animateWithDuration:0.5 animations:^{
            self.viewControl.backgroundColor = [UIColor clearColor];
            self.tableView.frame = CGRectMake(tempTabX,tabY - convertRect.size.height/2, ComboxWidth, 0);
        } completion:^(BOOL finished) {
            [self.viewControl removeFromSuperview];
        }];
    } else {
        [UIView animateWithDuration:0.3 animations:^{
            self.tableView.frame = CGRectMake(tabX, tabY, ComboxWidth, 0);
        }completion:^(BOOL finished) {
            [self.viewControl removeFromSuperview];
        }];
    }
    
}
@end
