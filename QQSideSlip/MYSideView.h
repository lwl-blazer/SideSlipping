//
//  MYSideView.h
//  TestRunLoop
//
//  Created by blazer on 16/3/22.
//  Copyright © 2016年 blazer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MYSideView : UIView<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) UITableView *myTableView;

@end
