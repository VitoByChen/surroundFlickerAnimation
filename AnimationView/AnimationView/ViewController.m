//
//  ViewController.m
//  AnimationView
//
//  Created by KC on 17/5/18.
//  Copyright © 2017年 cgsir. All rights reserved.
//

#import "ViewController.h"
#import "TestView1.h"
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

    TestView2 *testView2 = [[TestView2 alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    testView2.backgroundColor = [UIColor clearColor];
    [self.view addSubview:testView2];
    
    
    
    TestView1 *testView1 = [[TestView1 alloc] initWithFrame:CGRectMake(100, 300, 200, 50)];
    testView1.backgroundColor = [UIColor clearColor];
    [self.view addSubview:testView1];
}



@end
