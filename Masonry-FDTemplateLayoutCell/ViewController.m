//
//  ViewController.m
//  Masonry-FDTemplateLayoutCell
//
//  Created by Yong Li on 5/18/16.
//  Copyright © 2016 yoli. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "YLLayoutTableViewCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "YLViewModel.h"

NSString * const kYLLayoutTableViewCell  = @"YLLayoutTableViewCell";

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) YLViewModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel = [[YLViewModel alloc] init];

    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[YLLayoutTableViewCell class] forCellReuseIdentifier:kYLLayoutTableViewCell];
    [self.view addSubview:_tableView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.feedArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YLLayoutTableViewCell * cell = [_tableView dequeueReusableCellWithIdentifier:kYLLayoutTableViewCell];
    [cell setFeed:[self.viewModel.feedArray objectAtIndex:indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView fd_heightForCellWithIdentifier:kYLLayoutTableViewCell cacheByIndexPath:indexPath configuration:^(YLLayoutTableViewCell *cell) {
        [cell setFeed:[self.viewModel.feedArray objectAtIndex:indexPath.row]];
    }];
}

@end
