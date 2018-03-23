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
@property (weak, nonatomic) IBOutlet UIButton *testBtn;

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
//    [self.view addSubview:testView2];
    
    
    
    TestView1 *testView1 = [[TestView1 alloc] initWithFrame:CGRectMake(100, 300, 200, 50)];
    testView1.backgroundColor = [UIColor clearColor];
//    [self.view addSubview:testView1];
}

- (IBAction)testBtnClick:(UIButton *)sender {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"BuildEnvironmentList" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
 
    NSString *ip = dict[dict[@"Environment"]][@"IPAddress"];
    NSString *prot = dict[dict[@"Environment"]][@"Port"];
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:ip message:prot preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [vc addAction:action];
    [self presentViewController:vc animated:YES completion:nil];
}


@end
