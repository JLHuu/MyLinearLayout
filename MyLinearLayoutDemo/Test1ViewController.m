//
//  Test1ViewController.m
//  MyLinearLayoutDemo
//
//  Created by apple on 15/6/21.
//  Copyright (c) 2015年 SunnadaSoft. All rights reserved.
//

#import "Test1ViewController.h"
#import "MyFrameLayout.h"
#import "MyLinearLayout.h"

@interface Test1ViewController ()

@end

@implementation Test1ViewController

-(UIView*)createView:(BOOL)autoAdjustSize autoAdjustDir:(LineViewAutoAdjustDir)autoAdjustDir
{
    MyLinearLayout *ll = [[MyLinearLayout alloc] initWithFrame:CGRectMake(0, 0, 100,200)];
    ll.leftMargin = 10;
    ll.orientation = LVORIENTATION_VERT;
    ll.autoAdjustSize = autoAdjustSize;
    ll.autoAdjustDir = autoAdjustDir;
    ll.backgroundColor = [UIColor grayColor];
    
    //不再需要指定y的偏移值了。
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
    v1.backgroundColor = [UIColor redColor];
    v1.topMargin = 4;
    v1.leftMargin = 10;
    [ll addSubview:v1];
    
    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 60)];
    v2.backgroundColor = [UIColor greenColor];
    v2.topMargin = 6;
    v2.leftMargin = 20;
    [ll addSubview:v2];
    
    
    UIView *v3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 75, 30)];
    v3.backgroundColor = [UIColor blueColor];
    v3.topMargin = 3;
    v3.bottomMargin = 4;
    v3.leftMargin = 15;
    [ll addSubview:v3];
    
    return ll;
}

-(void)loadView
{
    self.view = [MyFrameLayout new];
    
    MyLinearLayout *test1ll = [MyLinearLayout new];
    test1ll.orientation = LVORIENTATION_HORZ; //水平布局
    test1ll.marginGravity = MGRAVITY_CENTER;  //本视图在父视图中居中
    test1ll.gravity = MGRAVITY_HORZ_CENTER;   //本视图里面的所有子视图整体水平居中停靠
    test1ll.wrapContent = YES;  //本视图的高度由子视图中最高的决定。
    [self.view addSubview:test1ll];
    
    //标尺视图
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 200)];
    v.backgroundColor = [UIColor blackColor];
    v.leftMargin = 10;
    [test1ll addSubview:v];
    
    [test1ll addSubview:[self createView:NO autoAdjustDir:LVAUTOADJUSTDIR_TAIL]];
    [test1ll addSubview:[self createView:YES autoAdjustDir:LVAUTOADJUSTDIR_TAIL]];
    [test1ll addSubview:[self createView:YES autoAdjustDir:LVAUTOADJUSTDIR_CENTER]];
    [test1ll addSubview:[self createView:YES autoAdjustDir:LVAUTOADJUSTDIR_HEAD]];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"自动调整大小";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end