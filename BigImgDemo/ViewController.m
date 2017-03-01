//
//  ViewController.m
//  BigImgDemo
//
//  Created by 薛晓林 on 2017/1/11.
//  Copyright © 2017年 薛晓林. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "CMPhotoBrowser.h"
#import "CMPhoto.h"
@interface ViewController ()

@property(nonatomic , strong)UIImageView *headerImg;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
}


- (void)createUI{
    self.headerImg = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.headerImg.userInteractionEnabled = YES;
    [self.headerImg sd_setImageWithURL:[NSURL URLWithString:@"http://139.196.208.240:801/images/upload/avatars/20151003163407/medium.jpg"]];
    [self.view addSubview:self.headerImg];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
    [self.headerImg addGestureRecognizer:tap];
}

- (void)tapClick{
    
    NSMutableArray *browseItemArray = [[NSMutableArray alloc]init];
    CMPhoto *browseItem = [[CMPhoto alloc]init];
    browseItem.srcImageUrl = @"http://139.196.208.240:801/images/upload/avatars/20151003163407/large.jpg";// 大图url地址
    browseItem.placeholder = self.headerImg;// 小图
    [browseItemArray addObject:browseItem];
    
    CMPhotoBrowser *bvc = [[CMPhotoBrowser alloc]init];
    bvc.currentPhotoIndex = 0;
    bvc.photos = browseItemArray;
    [bvc show];
    
}


@end
