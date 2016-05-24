//
//  YLLayoutTableViewCell.m
//  Masonry-FDTemplateLayoutCell
//
//  Created by Yong Li on 5/18/16.
//  Copyright © 2016 yoli. All rights reserved.
//

#import "YLLayoutTableViewCell.h"
#import "masonry.h"

@interface YLLayoutTableViewCell()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation YLLayoutTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self setupViews];
        [self setupConstraints];
    }
    return self;
}

- (void)setupViews {
    _iconView = [[UIImageView alloc] init];
    [self.contentView addSubview:_iconView];
    
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.font = [UIFont systemFontOfSize:12];
    _nameLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_nameLabel];
    
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.font = [UIFont systemFontOfSize:12];
    _timeLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_timeLabel];
    
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.font = [UIFont systemFontOfSize:15];
    _contentLabel.numberOfLines = 0;
    [self.contentView addSubview:_contentLabel];
}

- (void)setupConstraints {
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(10);
        make.top.equalTo(10);
        make.width.equalTo(50);
        make.height.equalTo(50);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.iconView.trailing).with.offset(10);
        make.top.equalTo(self.iconView.top).with.offset(10);
        make.trailing.equalTo(-10);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.nameLabel.leading);
        make.top.equalTo(self.nameLabel.bottom).with.offset(10);
        make.trailing.equalTo(-10);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.iconView.leading);
        make.top.equalTo(self.iconView.bottom).with.offset(10);
        make.trailing.equalTo(-10);
        make.bottom.equalTo(-10);
    }];
}

- (void)setFeed:(YLFeed *)feed {
    self.nameLabel.text = feed.name;
    self.timeLabel.text = feed.time;
    self.contentLabel.text = feed.content;
//    self.iconView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:feed.imageUrl]]];
    self.iconView.image = [UIImage imageNamed:@"icon.jpg"];
}

@end
