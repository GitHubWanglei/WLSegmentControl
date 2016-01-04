//
//  WLSegmentControl.m
//
//  Created by wanglei on 15/12/30.
//  Copyright © 2015年 wanglei. All rights reserved.
//

#import "WLSegmentControl.h"

@interface WLSegmentControl ()

@property (nonatomic, assign) WLSegmentedControlStyle style;

@property (nonatomic, strong) NSMutableArray *btns;
@property (nonatomic, strong) NSMutableArray *labels;

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIView *mirrorView;

@property (nonatomic, strong) UIButton *lastSelectedBtn;
@property (nonatomic, strong) UIColor *selectedBackColor;

@property (nonatomic, strong) NSMutableArray *lines;

@end

@implementation WLSegmentControl

- (instancetype)initWithFrame:(CGRect)frame btnTitles:(NSArray *)titles cornerRadius:(CGFloat)radius style:(WLSegmentedControlStyle)style{
    self = [super initWithFrame:frame];
    if (self) {
        
        if (radius > 0) {
            self.layer.cornerRadius = radius;
        }
        
        self.clipsToBounds = YES;
        self.style = style;
        [self initViewWithTitles:titles];
    }
    return self;
}

-(void)initViewWithTitles:(NSArray *)titles{
    
    for (int i = 0; i<titles.count; i++) {
        if (![titles[i] isKindOfClass:[NSString class]] && ![titles[i] isKindOfClass:[UIImage class]]) {
            return;
        }
    }
    
    self.btns = [NSMutableArray array];
    self.backgroundColor = [UIColor whiteColor];
    
    CGFloat btn_W = self.bounds.size.width/titles.count;
    CGFloat btn_H = self.bounds.size.height;
    
    if (self.style == WLSegmentedControlStylePlain) {
        self.isHaveAnimation = YES;
        //创建 btn
        for (int i = 0; i<titles.count; i++) {
            NSString *title = titles[i];
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(btn_W*i, 0, btn_W, btn_H);
            if ([titles[i] isKindOfClass:[NSString class]]) {
                [btn setTitle:title forState:UIControlStateNormal];
                btn.titleLabel.textAlignment = NSTextAlignmentCenter;
                [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            }else{
                [btn setBackgroundImage:titles[i] forState:UIControlStateNormal];
            }
            btn.tag = i;
            [self addSubview:btn];
            [self.btns addObject:btn];
            
            [btn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        //创建选中背景 view
        CGFloat margin = 1.0f/[UIScreen mainScreen].scale;
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, margin, btn_W-margin*2, btn_H-margin*2)];
        backView.clipsToBounds = YES;
        backView.layer.cornerRadius = self.layer.cornerRadius;
        [self addSubview:backView];
        self.backView = backView;
        
        UIView *mirrorView = [[UIView alloc] initWithFrame:self.bounds];
        mirrorView.backgroundColor = [UIColor greenColor];
        self.labels = [NSMutableArray array];
        for (int i = 0; i<self.btns.count; i++) {
            if ([titles[i] isKindOfClass:[NSString class]]) {
                UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(btn_W*i, 0, btn_W-margin*2, btn_H-margin*2)];
                label.backgroundColor = [UIColor clearColor];
                label.text = ((UIButton *)self.btns[i]).titleLabel.text;
                label.textAlignment = NSTextAlignmentCenter;
                label.textColor = [UIColor whiteColor];
                label.tag = i;
                
                UIButton *maskBtn = [[UIButton alloc] initWithFrame:label.bounds];
                maskBtn.backgroundColor = [UIColor clearColor];
                maskBtn.tag = label.tag;
                [maskBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
                [label addSubview:maskBtn];
                label.userInteractionEnabled = YES;
                
                [mirrorView addSubview:label];
                [self.labels addObject:label];
                
                if (maskBtn.tag == 0) {
                    self.lastSelectedBtn = maskBtn;
                }
                
            }else{
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(btn_W*i, 0, btn_W-margin*2, btn_H-margin*2)];
                imageView.backgroundColor = [UIColor clearColor];
                imageView.image = (UIImage *)titles[i];
                imageView.tag = i;
                
                UIButton *maskBtn = [[UIButton alloc] initWithFrame:imageView.bounds];
                maskBtn.backgroundColor = [UIColor clearColor];
                maskBtn.tag = imageView.tag;
                [maskBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
                [imageView addSubview:maskBtn];
                imageView.userInteractionEnabled = YES;
                
                [mirrorView addSubview:imageView];
                [self.labels addObject:imageView];
                
                if (maskBtn.tag == 0) {
                    self.lastSelectedBtn = maskBtn;
                }
            }
            
        }
        [self.backView addSubview:mirrorView];
        self.mirrorView = mirrorView;
    }else{
        self.backgroundColor = [UIColor whiteColor];
        self.selectedBackColor = [UIColor greenColor];
        self.layer.borderWidth = 1.0f;
        self.layer.borderColor = self.selectedBackColor.CGColor;
        self.lines = [NSMutableArray array];
        //创建 btn
        for (int i = 0; i<titles.count; i++) {
            NSString *title = titles[i];
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(btn_W*i, 0, btn_W, btn_H);
            
            if ([titles[i] isKindOfClass:[NSString class]]) {
                [btn setTitle:title forState:UIControlStateNormal];
                btn.titleLabel.textAlignment = NSTextAlignmentCenter;
                [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
            }else{
                [btn setImage:titles[i] forState:UIControlStateNormal];
                [btn setImage:titles[i] forState:UIControlStateSelected];
            }
            
            [btn setBackgroundColor:[UIColor clearColor]];
            btn.tag = i;
            [self addSubview:btn];
            
            [btn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
            
            if (btn.tag == 0) {
                btn.selected = YES;
                btn.backgroundColor = self.selectedBackColor;
                self.lastSelectedBtn = btn;
            }
            
            [self.btns addObject:btn];
            
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(btn_W*i, 0, 1.0f, self.bounds.size.height)];
            line.backgroundColor = self.selectedBackColor;
            [self addSubview:line];
            [self.lines addObject:line];
            
        }
        
    }
    
}

-(void)titleClick:(UIButton *)btn{
    
    CGRect btnFrame = btn.frame;
    CGFloat margin = 1.0f/[UIScreen mainScreen].scale;
    
    if (self.style == WLSegmentedControlStylePlain) {
        
        if (self.isHaveAnimation && btn.tag != self.lastSelectedBtn.tag) {
            [UIView animateWithDuration:1/3.0f animations:^{
                self.backView.frame = CGRectMake(btnFrame.origin.x, margin, btnFrame.size.width-margin*2, btnFrame.size.height-margin*2);
                self.mirrorView.frame = CGRectMake(-btnFrame.origin.x,
                                                   0,
                                                   self.bounds.size.width,
                                                   self.bounds.size.height-2*margin);
            }];
        }else if(self.isHaveAnimation == NO && btn.tag != self.lastSelectedBtn.tag){
            self.backView.frame = CGRectMake(btnFrame.origin.x, margin, btnFrame.size.width-margin*2, btnFrame.size.height-margin*2);
            self.mirrorView.frame = CGRectMake(-btnFrame.origin.x,
                                               0,
                                               self.bounds.size.width,
                                               self.bounds.size.height-2*margin);
        }
        
        if (self.tapBlockHandle) {
            self.tapBlockHandle(btn.tag);
        }
        self.lastSelectedBtn = btn;
        
    }else{
        if (btn.tag != self.lastSelectedBtn.tag) {
            
            for (UIView *maskView in self.subviews) {
                if (maskView.tag == 10000) {
                    [maskView removeFromSuperview];
                }
            }
            
            self.lastSelectedBtn.selected = NO;
            [self.lastSelectedBtn setBackgroundColor:[UIColor clearColor]];
            btn.selected = YES;
            [btn setBackgroundColor:self.selectedBackColor];
            self.lastSelectedBtn = btn;
            
            if (self.tapBlockHandle) {
                self.tapBlockHandle(btn.tag);
            }
            
            if (btn.titleLabel.text.length == 0) {
                UIView *maskView = [[UIView alloc] initWithFrame:btn.frame];
                maskView.backgroundColor = [UIColor clearColor];
                maskView.tag = 10000;
                UIButton *maskBtn = [[UIButton alloc] initWithFrame:maskView.bounds];
                maskBtn.backgroundColor = [UIColor clearColor];
                maskBtn.tag = self.lastSelectedBtn.tag;
                [maskBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
                [maskView addSubview:maskBtn];
                [self addSubview:maskView];
            }
            
        }else{
            
            UIView *view = [self viewWithTag:10000];
            if (view == nil) {
                UIView *maskView = [[UIView alloc] initWithFrame:btn.frame];
                maskView.backgroundColor = [UIColor clearColor];
                maskView.tag = 10000;
                UIButton *maskBtn = [[UIButton alloc] initWithFrame:maskView.bounds];
                maskBtn.backgroundColor = [UIColor clearColor];
                maskBtn.tag = self.lastSelectedBtn.tag;
                [maskBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
                [maskView addSubview:maskBtn];
                [self addSubview:maskView];
            }
            
            if (self.tapBlockHandle) {
                self.tapBlockHandle(btn.tag);
            }
            
        }
    }
    
}

- (void)setTitleColor:(UIColor *)color highlightedColor:(UIColor *)highlightedColor selectedColor:(UIColor *)selectedColor{
    
    if (self.style == WLSegmentedControlStylePlain) {
        
        for (int i = 0; i<self.btns.count; i++) {
            UIButton *btn = self.btns[i];
            if (color) {
                [btn setTitleColor:color forState:UIControlStateNormal];
            }
            if (highlightedColor) {
                [btn setTitleColor:highlightedColor forState:UIControlStateHighlighted];
            }
        }
        
        for (id obj in self.labels) {
            if ([obj isKindOfClass:[UILabel class]]) {
                UILabel *label = (UILabel *)obj;
                label.textColor = selectedColor;
            }
        }
        
    }else{
        
        for (UIButton *btn in self.btns) {
            if (color) {
                [btn setTitleColor:color forState:UIControlStateNormal];
            }
            if (highlightedColor) {
                [btn setTitleColor:highlightedColor forState:UIControlStateHighlighted];
            }
            if (selectedColor) {
                [btn setTitleColor:selectedColor forState:UIControlStateSelected];
            }
        }
    }
    
}

- (void)setTitleSelectedBackgroundColor:(UIColor *)color{
    
    if (self.style == WLSegmentedControlStylePlain) {
        if (color) {
            self.mirrorView.backgroundColor = color;
        }
    }else{
        if (color) {
            self.selectedBackColor = color;
            for (UIView *line in self.lines) {
                line.backgroundColor = color;
            }
            self.layer.borderColor = color.CGColor;
        }
        for (UIButton *btn in self.btns) {
            if (btn.selected == YES) {
                [btn setBackgroundColor:self.selectedBackColor];
            }
        }
    }
    
}

- (void)setselectedImage:(UIImage *)image tag:(NSInteger)tag{
    if (self.style == WLSegmentedControlStylePlain) {
        for (id obj in self.labels) {
            if ([obj isKindOfClass:[UIImageView class]]) {
                UIImageView *imageView = (UIImageView *)obj;
                if (imageView.tag == tag) {
                    if (image) {
                        imageView.image =image;
                    }
                }
                
            }
        }
    }else{
        for (UIButton *btn in self.btns) {
            if (image) {
                if (btn.titleLabel.text.length == 0) {
                    if (btn.tag == tag) {
                        [btn setImage:image forState:UIControlStateSelected];
                    }
                }
            }
        }
    }
}

@end









