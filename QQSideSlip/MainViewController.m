//
//  MainViewController.m
//  TestRunLoop
//
//  Created by blazer on 16/3/22.
//  Copyright © 2016年 blazer. All rights reserved.
//

#import "MainViewController.h"
#import "TopViewController.h"
#import "UIView+BLAZER.h"
#import "MYSideView.h"

@interface MainViewController ()

@property(nonatomic, strong) MYSideView *slideView;
@property(nonatomic, strong) TopViewController *topController;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self creatLocalView];
}

- (void)creatLocalView{
    self.slideView = [[MYSideView alloc] initWithFrame:CGRectMake(-[UIScreen mainScreen].bounds.size.width * 0.25, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:self.slideView];
    [self settingTopView];
}

- (void)settingTopView{
    self.topController = [[TopViewController alloc] init];
    [self addChildViewController:self.topController];
    [self.view addSubview:self.topController.view];
    self.topController.view.frame = self.view.bounds;
    [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(viewPanGesture:)]];
}


- (void)viewPanGesture:(UIPanGestureRecognizer *)pan{
    CGPoint translation = [pan translationInView:self.topController.view];
    self.topController.view.transform = CGAffineTransformTranslate(self.topController.view.transform, translation.x, 0);
    self.slideView.ttx = self.topController.view.ttx / 3;
    [pan setTranslation:CGPointZero inView:self.topController.view];     //每次算不能进行累加
    
    //确定两边的极限
    CGAffineTransform rightScopeTransform = CGAffineTransformTranslate(self.view.transform, [UIScreen mainScreen].bounds.size.width * 0.75, 0);
    if (self.topController.view.transform.tx > rightScopeTransform.tx) {
        self.topController.view.transform = rightScopeTransform;
        self.slideView.ttx = self.topController.view.ttx / 3;
    }else if (self.topController.view.transform.tx < 0.0){
        self.topController.view.transform = CGAffineTransformTranslate(self.view.transform, 0, 0);
       self.slideView.ttx = self.topController.view.ttx / 3;
    }
    if (pan.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.25 animations:^{
            if (self.topController.view.x > [UIScreen mainScreen].bounds.size.width * 0.5) {
               self.topController.view.transform = rightScopeTransform;
                self.slideView.ttx = self.topController.view.ttx / 3;
            }else{
                self.topController.view.transform = CGAffineTransformIdentity; //重置
                self.slideView.ttx = self.topController.view.ttx / 3;
            }
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}





@end
