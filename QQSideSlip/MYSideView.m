//
//  MYSideView.m
//  TestRunLoop
//
//  Created by blazer on 16/3/22.
//  Copyright © 2016年 blazer. All rights reserved.
//

#import "MYSideView.h"

@implementation MYSideView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor blackColor]];
        self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        self.myTableView.delegate = self;
        self.myTableView.dataSource = self;
        [self.myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [self.myTableView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:self.myTableView];
        [self.myTableView reloadData];
    }
    return self;
}

#pragma mark UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"点击_%ld",indexPath.row];
    return cell;
}

@end
