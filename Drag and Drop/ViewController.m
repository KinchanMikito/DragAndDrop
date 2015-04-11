//
//  ViewController.m
//  Drag and Drop
//
//  Created by 金森幹斗 on 2015/02/28.
//  Copyright (c) 2015年 Mikito Kanamori. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self random];
    
    score = 0;
    
    scoreLabel.text = [NSString stringWithFormat:@"score:%d",score];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)panAction:(UIPanGestureRecognizer *)sender{
    
    CGPoint p = [sender translationInView:self.view];
    
    CGPoint movedPoint = CGPointMake(redSmallView.center.x + p.x, redSmallView.center.y + p.y);
    
    redSmallView.center = movedPoint;
    
    NSLog(@"*座標%@を移動中…*",NSStringFromCGPoint(movedPoint));
    
    [sender setTranslation:CGPointZero inView:self.view];
    
    
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        
        NSLog(@"移動終了");
        
        if (CGRectContainsPoint(redView.frame, redSmallView.center)) {
            
            resultLabel.text = @"赤と重なりました";
            
            [redSmallView removeFromSuperview];
            
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            
            [self plusScore];
            
        }else if (CGRectContainsPoint(blueView.frame, redSmallView.center)){
            
            resultLabel.text = @"青と重なりました";
            
            [redSmallView removeFromSuperview];
            
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            
            [self minusScore];
            
        }else if (CGRectContainsPoint(yellowView.frame, redSmallView.center)){
            
            resultLabel.text = @"黄色と重なりました";
            
            [redSmallView removeFromSuperview];
            
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            
            [self minusScore];
            
        }else if (CGRectContainsPoint(greenView.frame, redSmallView.center)){
            
            resultLabel.text = @"緑と重なりました";
            
            [redSmallView removeFromSuperview];
            
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            
            [self minusScore];
            
        }else{
            
            resultLabel.text = @"重なってません";
            
        }
        
    }else{
        
        resultLabel.text = @"移動中";
        
    }
    
}

-(void)panAction2:(UIPanGestureRecognizer *)sender{
    
    CGPoint p = [sender translationInView:self.view];
    
    CGPoint movedPoint = CGPointMake(blueSmallView.center.x + p.x, blueSmallView.center.y + p.y);
    
    blueSmallView.center = movedPoint;
    
    NSLog(@"*座標%@を移動中…*",NSStringFromCGPoint(movedPoint));
    
    [sender setTranslation:CGPointZero inView:self.view];
    
    
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        
        NSLog(@"移動終了");
        
        if (CGRectContainsPoint(redView.frame, blueSmallView.center)) {
            
            resultLabel.text = @"赤と重なりました";
            
            [blueSmallView removeFromSuperview];
            
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            
            [self minusScore];
            
        }else if (CGRectContainsPoint(blueView.frame, blueSmallView.center)){
            
            resultLabel.text = @"青と重なりました";
            
            [blueSmallView removeFromSuperview];
            
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            
            [self plusScore];
            
        }else if (CGRectContainsPoint(yellowView.frame, blueSmallView.center)){
            
            resultLabel.text = @"黄色と重なりました";
            
            [redSmallView removeFromSuperview];
            
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            
            [self minusScore];
            
        }else if (CGRectContainsPoint(greenView.frame, blueSmallView.center)){
            
            resultLabel.text = @"緑と重なりました";
            
            [redSmallView removeFromSuperview];
            
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            
            [self minusScore];
            
        }else{
            
            resultLabel.text = @"重なってません";
            
        }
        
    }else{
        
        resultLabel.text = @"移動中";
        
    }
    
}

-(void)panAction3:(UIPanGestureRecognizer *)sender{
    
    CGPoint p = [sender translationInView:self.view];
    
    CGPoint movedPoint = CGPointMake(yellowSmallView.center.x + p.x, yellowSmallView.center.y + p.y);
    
    yellowSmallView.center = movedPoint;
    
    NSLog(@"*座標%@を移動中…*",NSStringFromCGPoint(movedPoint));
    
    [sender setTranslation:CGPointZero inView:self.view];
    
    
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        
        NSLog(@"移動終了");
        
        if (CGRectContainsPoint(redView.frame, yellowSmallView.center)) {
            
            resultLabel.text = @"赤と重なりました";
            
            [yellowSmallView removeFromSuperview];
            
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            
            [self minusScore];
            
        }else if (CGRectContainsPoint(blueView.frame, yellowSmallView.center)){
            
            resultLabel.text = @"青と重なりました";
            
            [yellowSmallView removeFromSuperview];
            
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            
            [self minusScore];
            
        }else if (CGRectContainsPoint(yellowView.frame, yellowSmallView.center)){
            
            resultLabel.text = @"黄色と重なりました";
            
            [yellowSmallView removeFromSuperview];
            
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            
            [self plusScore];
            
        }else if (CGRectContainsPoint(greenView.frame, yellowSmallView.center)){
            
            resultLabel.text = @"緑と重なりました";
            
            [yellowSmallView removeFromSuperview];
            
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            
            [self minusScore];
            
        }else{
            
            resultLabel.text = @"重なってません";
            
        }
        
    }else{
        
        resultLabel.text = @"移動中";
        
    }
    
}

-(void)panAction4:(UIPanGestureRecognizer *)sender{
    
    CGPoint p = [sender translationInView:self.view];
    
    CGPoint movedPoint = CGPointMake(greenSmallView.center.x + p.x, greenSmallView.center.y + p.y);
    
    greenSmallView.center = movedPoint;
    
    NSLog(@"*座標%@を移動中…*",NSStringFromCGPoint(movedPoint));
    
    [sender setTranslation:CGPointZero inView:self.view];
    
    
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        
        NSLog(@"移動終了");
        
        if (CGRectContainsPoint(redView.frame, greenSmallView.center)) {
            
            resultLabel.text = @"赤と重なりました";
            
            [greenSmallView removeFromSuperview];
            
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            
            [self minusScore];
            
        }else if (CGRectContainsPoint(blueView.frame, greenSmallView.center)){
            
            resultLabel.text = @"青と重なりました";
            
            [greenSmallView removeFromSuperview];
            
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            
            [self minusScore];
            
        }else if (CGRectContainsPoint(yellowView.frame, greenSmallView.center)){
            
            resultLabel.text = @"黄色と重なりました";
            
            [greenSmallView removeFromSuperview];
            
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            
            [self minusScore];
            
        }else if (CGRectContainsPoint(greenView.frame, greenSmallView.center)){
            
            resultLabel.text = @"緑と重なりました";
            
            [greenSmallView removeFromSuperview];
            
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            
            [self plusScore];
            
        }else{
            
            resultLabel.text = @"重なってません";
            
        }
        
    }else{
        
        resultLabel.text = @"移動中";
        
    }
    
}

-(void)createRed{
    
    redSmallView = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x - 25, self.view.center.y -
        25, 50, 50)];
    
    redSmallView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:redSmallView];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(panAction:)];
    
    [redSmallView addGestureRecognizer:pan];
    
}

-(void)createBlue{
    
    blueSmallView = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x - 25, self.view.center.y - 25, 50, 50)];
    
    blueSmallView.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:blueSmallView];
    
    UIPanGestureRecognizer *pan2 = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(panAction2:)];
    
    [blueSmallView addGestureRecognizer:pan2];
    
}

-(void)createYellow{
    
    yellowSmallView = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x - 25, self.view.center.y - 25, 50, 50)];
    
    yellowSmallView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:yellowSmallView];
    
    UIPanGestureRecognizer *pan3 = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                           action:@selector(panAction3:)];
    
    [yellowSmallView addGestureRecognizer:pan3];
    
}

-(void)createGreen{
    
    greenSmallView = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x - 25, self.view.center.y - 25, 50, 50)];
    
    greenSmallView.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:greenSmallView];
    
    UIPanGestureRecognizer *pan4 = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                           action:@selector(panAction4:)];
    
    [greenSmallView addGestureRecognizer:pan4];
    
}

-(void)random{
    
    randNum = arc4random_uniform(4);
    switch (randNum) {
        case 0:
            
            [self createRed];
            
            break;
            
        case 1:
            
            [self createBlue];
            
            break;
        
        case 2:
            
            [self createYellow];
            
            break;
            
        case 3:
            
            [self createGreen];
            
            break;
            
    }
    
}

-(void)plusScore{
    
    score += 100;
    scoreLabel.text = [NSString stringWithFormat:@"score:%d",score];
    
}

-(void)minusScore{
    
    score -= 100;
    scoreLabel.text = [NSString stringWithFormat:@"score:%d",score];
    
}


@end
