//
//  ESCalendarCell.m
//  TestCalendar
//
//  Created by 李乾 on 2018/5/22.
//  Copyright © 2018年 liqian. All rights reserved.
//

#import "ESCalendarCell.h"
#import "YYKit.h"

@interface ESCalendarCell ()
@property (nonatomic, assign) NSInteger type;
@end

@implementation ESCalendarCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.shapeLayer removeFromSuperlayer];
        [self.subtitleLabel removeFromSuperview];
        [self.eventIndicator removeFromSuperview];
        
        self.imageView.contentMode =UIViewContentModeScaleToFill;
    }
    return self;
}

- (void)setEmotionType:(NSInteger)type {
    _type = type;
}

- (void)layoutSubviews {
    UIFont *titleFont = [UIFont systemFontOfSize:14];
    UIColor *titleColor = [UIColor blackColor];
    if (self.isPlaceholder) {
        titleColor = [UIColor lightGrayColor];
    }

    self.imageView.frame = CGRectMake(0, 0, self.contentView.height-3, self.contentView.height-3);
    self.imageView.center = CGPointMake(self.contentView.center.x-2, self.contentView.center.y);
    if (_type == 1) {
        titleFont = [UIFont systemFontOfSize:9];
        self.imageView.hidden = NO;
        CGSize size = [self.titleLabel.text sizeForFont:[UIFont systemFontOfSize:9] size:CGSizeMake(20, 10) mode:NSLineBreakByTruncatingTail];
        self.titleLabel.frame = CGRectMake(self.imageView.right+1, self.imageView.bottom-size.height, size.width, size.height);
        titleColor = [UIColor lightGrayColor];
    }else {
        self.imageView.hidden = YES;
        self.titleLabel.frame = CGRectOffset(self.contentView.bounds, -2, 0);
    }
    
    self.titleLabel.font = titleFont;
    self.titleLabel.textColor = titleColor;
}

- (void)performSelecting {
    
}

@end
