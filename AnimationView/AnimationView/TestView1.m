//
//  TextView1.m
//  AnimationView
//
//  Created by KC on 17/6/2.
//  Copyright © 2017年 cgsir. All rights reserved.
//

#import "TestView1.h"

@implementation TestView1

-(instancetype)initWithFrame:(CGRect)frame {
    self =  [super initWithFrame:frame];
    if ( self) {
        //运动轨迹 Clockwise  YES 顺时针 NO 逆时针
        [self pathWithClockwise:NO];
    }
    return self;
}

-(void)pathWithClockwise:(BOOL)clockwise {
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    CGPoint startPointOne = CGPointMake(0, 0);//第一个闪烁开始的点
    CGPoint startPointTwo = CGPointMake(width, height);//第二个闪烁开始的点
    
    
    //运动轨迹
    UIBezierPath *path = [UIBezierPath bezierPath];
    //第一个闪烁的运动轨迹
    UIBezierPath *pathOne = [UIBezierPath bezierPath];
    //第二个闪烁的运动轨迹
    UIBezierPath *pathTwo = [UIBezierPath bezierPath];
    
    
    
    
    [pathOne moveToPoint:startPointOne];
    [pathOne addLineToPoint:CGPointMake(width, 0)];
    [pathOne addLineToPoint:CGPointMake(width, height)];
    [pathOne addLineToPoint:CGPointMake(0, height)];
    [pathOne addLineToPoint:startPointOne];
    [pathOne addLineToPoint:CGPointMake(width, height)];
    
    
    
    [pathTwo moveToPoint:startPointTwo];
    [pathTwo addLineToPoint:CGPointMake(0, height)];
    [pathTwo addLineToPoint:startPointOne];
    [pathTwo addLineToPoint:CGPointMake(width, 0)];
    [pathTwo addLineToPoint:startPointTwo];
    [pathTwo addLineToPoint:startPointOne];
    
    [path appendPath:pathOne];
    [path addLineToPoint:CGPointMake(width, 0)];
    [path addLineToPoint:CGPointMake(0, height)];
    
    //显示的轨迹
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = path.CGPath;
    pathLayer.lineCap = kCALineCapRound;
    pathLayer.strokeColor = [UIColor orangeColor].CGColor;
    pathLayer.lineWidth = 2;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:pathLayer];
    
    //开始两个闪烁动画
    [self startAnimationWith:pathOne startPostion:startPointOne];
    [self startAnimationWith:pathTwo startPostion:startPointTwo];
    
}
-(void)startAnimationWith:(UIBezierPath *)path startPostion:(CGPoint)point {
    for (int i = 0; i < 20; i++) {
        //创建粒子
        CALayer *dotLayer = [CALayer layer];
        dotLayer.frame = CGRectMake(point.x, point.y, 4, 4);
        dotLayer.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:(1-0.05*i)].CGColor;
        [self.layer addSublayer:dotLayer];
        CAKeyframeAnimation *anim = [self animationWithPath:path withIndex:i];
        [dotLayer addAnimation:anim forKey:nil];
    }
    
}

-(CAKeyframeAnimation *)animationWithPath:(UIBezierPath *)path  withIndex:(int)index{
    //添加帧动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";
    anim.path = path.CGPath;
    anim.repeatCount = MAXFLOAT;
    anim.calculationMode = kCAAnimationPaced;
    //动画速度为匀速
    anim.calculationMode = kCAAnimationCubicPaced;
    //动画角度是否调整
    anim.rotationMode = kCAAnimationRotateAuto;
    anim.fillMode = kCAFillModeForwards;
    anim.removedOnCompletion = NO;
    anim.duration = 2.5;
    anim.beginTime = CACurrentMediaTime() + 0.01 * index;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    return anim;
}
@end
