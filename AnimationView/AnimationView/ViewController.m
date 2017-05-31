//
//  ViewController.m
//  AnimationView
//
//  Created by KC on 17/5/18.
//  Copyright © 2017年 cgsir. All rights reserved.
//

#import "ViewController.h"
#import "TestView2.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor darkGrayColor];
    [self initView];
   
   
}


-(void)initView {

    TestView2 *testView2 = [[TestView2 alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    testView2.backgroundColor = [UIColor clearColor];
    [self.view addSubview:testView2];
}



@end
