//
//  ProfileAnimationView.h
//  ProfileAnimationDemo
//
//  Created by DavidLee on 16/2/15.
//  Copyright © 2016年 DavidLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileAnimationView : UIView

@property(nonatomic,strong)UIImage *image;
@property(nonatomic,assign) CGRect originRect;

/**
 *  开始动画
 */
-(void)begainAnimating;


@end
