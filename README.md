# WLSegmentControl
自定义 segmentControl
示例代码:

    //--------------------------------示例代码------------------------------------------
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
    //--------------------------------示例代码------------------------------------------

示例图片:

![image](https://raw.githubusercontent.com/GitHubWanglei/WLSegmentControl/master/Simulator%20Screen%20Shot%202016%E5%B9%B41%E6%9C%884%E6%97%A5%2011.45.15.png)
