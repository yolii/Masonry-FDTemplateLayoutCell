//
//  YLViewModel.m
//  Masonry-FDTemplateLayoutCell
//
//  Created by Yong Li on 5/18/16.
//  Copyright © 2016 yoli. All rights reserved.
//

#import "YLViewModel.h"
#import "YLFeed.h"

@interface YLViewModel ()

@end

@implementation YLViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initFeedArray];
    }
    return self;
}

- (void)initFeedArray {
    NSArray *contentArray = [NSArray arrayWithObjects:@"这是最为常用的格式，在平时常用的的文本编辑器中大多是这样现的：输入文本、选中文本、设置标题格式", @"这是最为常用的格式，在平时常用的的文本编辑器中大多是这样现的：输入文本、选中文本、设置标题格式。而在 Markdown 中，你只需要在文本前面加上 # 即可，同理、你还可以增加二级标题、三级标题、四级标题、五级标题和六级标题，总共六级，只需要增加 # 即可，标题字号相应降低。例如", nil];
    _feedArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        YLFeed *feed = [[YLFeed alloc] init];
        feed.imageUrl = @"http://cdn-qn0.jianshu.io/assets/default_avatar/13-8072fce67829ce128ba5df823205516c.jpg";
        feed.name = [NSString stringWithFormat:@"标题%d", i];
        feed.time = [NSString stringWithFormat:@"这里是时间%d", i];
        feed.content = [contentArray objectAtIndex:(i % 2)];
        [_feedArray addObject:feed];
    }
}

@end
