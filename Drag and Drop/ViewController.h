//
//  ViewController.h
//  Drag and Drop
//
//  Created by 金森幹斗 on 2015/02/28.
//  Copyright (c) 2015年 Mikito Kanamori. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>{
    
    UIView *blackView;
    
    IBOutlet UIView *redView, *blueView, *yellowView, *greenView;
    
    IBOutlet UILabel *resultLabel;
    
    UIView *redSmallView;
    UIView *blueSmallView;
    UIView *yellowSmallView;
    UIView *greenSmallView;
    
    int randNum;
    
    int score;
    
    IBOutlet UILabel *scoreLabel;
    
}

-(void)panAction:(UIPanGestureRecognizer *)sender;
-(void)panAction2:(UIPanGestureRecognizer *)sender;
-(void)panAction3:(UIPanGestureRecognizer *)sender;
-(void)panAction4:(UIPanGestureRecognizer *)sender;

-(void)createRed;
-(void)createBlue;
-(void)createYellow;
-(void)createGreen;

-(void)random;

-(void)plusScore;
-(void)minusScore;

@end

