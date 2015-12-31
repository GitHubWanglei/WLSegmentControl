//
//  WLSegmentControl.h
//
//  Created by wanglei on 15/12/30.
//  Copyright © 2015年 wanglei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, WLSegmentedControlStyle) {
    WLSegmentedControlStylePlain,     // large plain
    WLSegmentedControlStyleBordered,  // large bordered
};

typedef void(^tapBlock)(NSInteger);

@interface WLSegmentControl : UIView

//点击按钮的 Block 回调
@property (nonatomic, strong) tapBlock tapBlockHandle;

//当style=WLSegmentedControlStylePlain时,是否有动画效果
@property (nonatomic, assign) BOOL isHaveAnimation;

//titles参数可接受 NSString, UIImage 类型
- (instancetype)initWithFrame:(CGRect)frame btnTitles:(NSArray *)titles cornerRadius:(CGFloat)radius style:(WLSegmentedControlStyle)style;

//标题颜色
- (void)setTitleColor:(UIColor *)color highlightedColor:(UIColor *)highlightedColor selectedColor:(UIColor *)selectedColor;
//背景色
- (void)setTitleSelectedBackgroundColor:(UIColor *)color;
//设置选中时的图片, 当标题是字符串类型时无效
- (void)setselectedImage:(UIImage *)image tag:(NSInteger)tag;

@end
