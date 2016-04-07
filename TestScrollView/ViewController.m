//
//  ViewController.m
//  TestScrollView
//
//  Created by Lancelot on 16/4/5.
//  Copyright © 2016年 tedu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIScrollView *scrollView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    1,初级视图
//    [self firstScrollView];
    
//    2,手动播放视图
    [self touchScrollView];
    
//    3，自动播放视图,,注意，，3自动播放动画，只负责处理自动，需要步骤2配合，只求最精炼，所以没有荣誉代码
    [self autoScrollView];
    
}

-(void)autoScrollView
{
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(turnPage) userInfo:nil repeats:YES];
}
-(void)turnPage{
    static int page;
    if (page++>2) {page = 0;}
    [scrollView scrollRectToVisible:CGRectMake(page*self.view.bounds.size.width, 0, self.view.bounds.size.width, 150) animated:NO];
}

-(void)touchScrollView
{
    //设定scrollView的大小
    CGRect bounds = [[UIScreen mainScreen] bounds];
    scrollView = [[UIScrollView alloc] initWithFrame:bounds];
    
    //设定图片的大小，及图片的初始位置，图片的大小为一个屏幕的大小，位置关系为屏幕1，屏幕2，屏幕3
//    UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(bounds.origin.x, bounds.origin.y,  bounds.size.width,bounds.size.height)];
//    imageView1.image = [UIImage imageNamed:@"shuiguo1.png"];
//    [scrollView addSubview:imageView1];
//    
//    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(bounds.size.width, bounds.origin.y,  bounds.size.width,bounds.size.height)];
//    imageView2.image = [UIImage imageNamed:@"shuiguo2.png"];
//    [scrollView addSubview:imageView2];
//    
//    UIImageView *imageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(bounds.size.width*2, bounds.origin.y,  bounds.size.width,bounds.size.height)];
//    imageView3.image = [UIImage imageNamed:@"shuiguo3.png"];
//    [scrollView addSubview:imageView3];
    for (int i=0; i<3; i++) {
        NSString *string = [NSString stringWithFormat:@"shuiguo%d.png",i+1];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(bounds.size.width*i, bounds.origin.y,  bounds.size.width,bounds.size.height)];
        imageView.image = [UIImage imageNamed:string];
        [scrollView addSubview:imageView];
    }
    //禁止反弹
    scrollView.bounces = NO;
    
    //整页显示
    scrollView.pagingEnabled = YES;
    
    //设定最大范围
    scrollView.contentSize = CGSizeMake(bounds.size.width*3, bounds.size.height);
    
    [self.view addSubview:scrollView];
}
-(void)firstScrollView
{
    //设定scrollView的大小
    CGRect bounds = [[UIScreen mainScreen] bounds];
    scrollView = [[UIScrollView alloc] initWithFrame:bounds];
    
    //初始化一张图片
    UIImageView *myView =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shuiguo2.png"]];
    [scrollView addSubview:myView];
    
    //设置需要显示内容的大小
    scrollView.contentSize = myView.frame.size;
    [self.view addSubview:scrollView];
}
@end
