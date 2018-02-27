//
//  ViewController.m
//  JieTuDemo
//
//  Created by zw on 2018/2/26.
//  Copyright © 2018年 zw. All rights reserved.
//

#import "ViewController.h"
#import "ResultViewController.h"
#import "JieTuSDK.h"
@interface ViewController ()
@property (nonatomic, strong) DragView *drag;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIBarButtonItem *resetItem = [[UIBarButtonItem alloc] init];
    [resetItem setTitle:@"还原"];
    self.navigationItem.leftBarButtonItem = resetItem;
    resetItem.target = self;
    resetItem.action = @selector(resetClick);
    
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] init];
    [doneItem setTitle:@"确定"];
    self.navigationItem.rightBarButtonItem = doneItem;
    doneItem.target = self;
    doneItem.action = @selector(doneClick);
    
    _drag = [[DragView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    [_drag setImage:[UIImage imageNamed:@"top.jpg"]];
    [self.view addSubview:_drag];
    
}

-(void)resetClick
{
    [_drag resetLayout];
}

-(void)doneClick
{
    ResultViewController *result = [[ResultViewController alloc] init];
    result.resultImage = [_drag getImage];
    [self.navigationController pushViewController:result animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
