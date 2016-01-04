//
//  ViewController.m
//  WLSegmentControlDemo
//
//  Created by lihongfeng on 15/12/30.
//  Copyright © 2015年 wanglei. All rights reserved.
//

#import "ViewController.h"
#import "WLSegmentControl.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //--------------------------------WLSegmentedControlStyleBordered------------------------------------------
    
    WLSegmentControl *segmentControl1 = [[WLSegmentControl alloc] initWithFrame:CGRectMake(10, 50, self.view.bounds.size.width-20, 30)
                                                                      btnTitles:@[@"title1", @"title2", [UIImage imageNamed:@"normal.png"], @"titles4"]
                                                                   cornerRadius:15
                                                                          style:WLSegmentedControlStyleBordered];
    [segmentControl1 setTitleColor:[UIColor grayColor] highlightedColor:nil selectedColor:[UIColor whiteColor]];
    [segmentControl1 setTitleSelectedBackgroundColor:[UIColor brownColor]];
    [segmentControl1 setselectedImage:[UIImage imageNamed:@"selected.png"] tag:2];
    [self.view addSubview:segmentControl1];
    
    [segmentControl1 setTapBlockHandle:^(NSInteger tag){
        NSLog(@"-----tag:%ld", (long)tag);
    }];
    
    WLSegmentControl *segmentControl11 = [[WLSegmentControl alloc] initWithFrame:CGRectMake(10, 100, self.view.bounds.size.width-20, 30)
                                                                       btnTitles:@[[UIImage imageNamed:@"normal.png"], [UIImage imageNamed:@"normal.png"], [UIImage imageNamed:@"normal.png"], [UIImage imageNamed:@"normal.png"]]
                                                                    cornerRadius:15
                                                                           style:WLSegmentedControlStyleBordered];
    [segmentControl11 setTitleColor:[UIColor grayColor] highlightedColor:nil selectedColor:[UIColor whiteColor]];
    [segmentControl11 setTitleSelectedBackgroundColor:[UIColor brownColor]];
    [segmentControl11 setselectedImage:[UIImage imageNamed:@"selected.png"] tag:0];
    [segmentControl11 setselectedImage:[UIImage imageNamed:@"selected.png"] tag:1];
    [segmentControl11 setselectedImage:[UIImage imageNamed:@"selected.png"] tag:2];
    [segmentControl11 setselectedImage:[UIImage imageNamed:@"selected.png"] tag:3];
    [self.view addSubview:segmentControl11];
    
    [segmentControl11 setTapBlockHandle:^(NSInteger tag){
        NSLog(@"-----tag:%ld", (long)tag);
    }];
    
    WLSegmentControl *segmentControl2 = [[WLSegmentControl alloc] initWithFrame:CGRectMake(10, 150, self.view.bounds.size.width-20, 30)
                                                                      btnTitles:@[@"title1", @"title2", @"title3", @"titles4"]
                                                                   cornerRadius:15
                                                                          style:WLSegmentedControlStyleBordered];
    [segmentControl2 setTitleColor:[UIColor grayColor] highlightedColor:[UIColor blackColor] selectedColor:[UIColor whiteColor]];
    [segmentControl2 setTitleSelectedBackgroundColor:[UIColor brownColor]];
    [segmentControl2 setselectedImage:[UIImage imageNamed:@"selected.png"] tag:2];
    [self.view addSubview:segmentControl2];
    
    [segmentControl2 setTapBlockHandle:^(NSInteger tag){
        NSLog(@"-----tag:%ld", (long)tag);
    }];
    
    //--------------------------------WLSegmentedControlStylePlain------------------------------------------
    
    WLSegmentControl *segmentControl3 = [[WLSegmentControl alloc] initWithFrame:CGRectMake(10, 250, self.view.bounds.size.width-20, 30)
                                                                      btnTitles:@[@"title1", @"title2", [UIImage imageNamed:@"normal.png"], @"titles4"]
                                                                   cornerRadius:15
                                                                          style:WLSegmentedControlStylePlain];
    [segmentControl3 setTitleColor:[UIColor grayColor] highlightedColor:nil selectedColor:[UIColor whiteColor]];
    [segmentControl3 setTitleSelectedBackgroundColor:[UIColor brownColor]];
    [segmentControl3 setselectedImage:[UIImage imageNamed:@"selected.png"] tag:2];
    [self.view addSubview:segmentControl3];
    
    [segmentControl3 setTapBlockHandle:^(NSInteger tag){
        NSLog(@"-----tag:%ld", (long)tag);
    }];
    segmentControl3.isHaveAnimation = NO;
    
    WLSegmentControl *segmentControl22 = [[WLSegmentControl alloc] initWithFrame:CGRectMake(10, 300, self.view.bounds.size.width-20, 30)
                                                                       btnTitles:@[[UIImage imageNamed:@"normal.png"], [UIImage imageNamed:@"normal.png"], [UIImage imageNamed:@"normal.png"], [UIImage imageNamed:@"normal.png"]]
                                                                    cornerRadius:15
                                                                           style:WLSegmentedControlStylePlain];
    [segmentControl22 setTitleColor:[UIColor grayColor] highlightedColor:nil selectedColor:[UIColor whiteColor]];
    [segmentControl22 setTitleSelectedBackgroundColor:[UIColor brownColor]];
    [segmentControl22 setselectedImage:[UIImage imageNamed:@"selected.png"] tag:0];
    [segmentControl22 setselectedImage:[UIImage imageNamed:@"selected.png"] tag:1];
    [segmentControl22 setselectedImage:[UIImage imageNamed:@"selected.png"] tag:2];
    [segmentControl22 setselectedImage:[UIImage imageNamed:@"selected.png"] tag:3];
    [self.view addSubview:segmentControl22];
    
    [segmentControl22 setTapBlockHandle:^(NSInteger tag){
        NSLog(@"-----tag:%ld", (long)tag);
    }];
    
    WLSegmentControl *segmentControl4 = [[WLSegmentControl alloc] initWithFrame:CGRectMake(10, 350, self.view.bounds.size.width-20, 30)
                                                                      btnTitles:@[@"title1", @"title2", @"title3", @"titles4"]
                                                                   cornerRadius:15
                                                                          style:WLSegmentedControlStylePlain];
    [segmentControl4 setTitleColor:[UIColor grayColor] highlightedColor:[UIColor blackColor] selectedColor:[UIColor whiteColor]];
    [segmentControl4 setTitleSelectedBackgroundColor:[UIColor brownColor]];
    [segmentControl4 setselectedImage:[UIImage imageNamed:@"selected.png"] tag:2];
    [self.view addSubview:segmentControl4];
    
    [segmentControl4 setTapBlockHandle:^(NSInteger tag){
        NSLog(@"-----tag:%ld", (long)tag);
    }];
    
    
    
}

-(void)btnClick:(UIButton *)btn{
    btn.selected = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
