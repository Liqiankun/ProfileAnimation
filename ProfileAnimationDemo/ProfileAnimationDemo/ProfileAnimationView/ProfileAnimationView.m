//
//  ProfileAnimationView.m
//  ProfileAnimationDemo
//
//  Created by DavidLee on 16/2/15.
//  Copyright © 2016年 DavidLee. All rights reserved.
//

#import "ProfileAnimationView.h"

@interface ProfileAnimationView()

@property(nonatomic,strong)UIImageView *profileImageView;

@end

@implementation ProfileAnimationView

-(instancetype)init
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor darkTextColor];
        self.alpha = 0;
        
        self.profileImageView = [[UIImageView alloc] init];
        self.profileImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.profileImageView];
    }
    
    return self;
}

-(void)setImage:(UIImage *)image
{
    _image = image;
    self.profileImageView.image = image;
}

-(void)setOriginRect:(CGRect)originRect
{
    _originRect = originRect;
    self.frame = [UIScreen mainScreen].bounds;
    self.profileImageView.frame = CGRectMake(self.originRect.origin.x, self.originRect.origin.y, self.originRect.size.width, self.originRect.size.height);
}


-(void)begainAnimating
{
    CGFloat windowWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat windowHeight = [UIScreen mainScreen].bounds.size.height;
    CGFloat profileY = (windowHeight - windowWidth) / 2;
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 1.0;
        //self.profileImageView.transform = CGAffineTransformMakeScale(windowWidth / self.originRect.size.width, windowWidth / self.originRect.size.height);
        //self.profileImageView.transform = CGAffineTransformMakeTranslation( 0 - self.originRect.origin.x, profileY - self.originRect.origin.y);
        self.profileImageView.frame = CGRectMake(0, profileY, windowWidth, windowWidth);

    } completion:^(BOOL finished) {
        //self.profileImageView.transform = CGAffineTransformMakeScale(0, 0);
        //self.profileImageView.transform = CGAffineTransformMakeTranslation(0, 0);
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
  
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
        self.profileImageView.frame = CGRectMake(self.originRect.origin.x, self.originRect.origin.y, self.originRect.size.width, self.originRect.size.height);

    } completion:^(BOOL finished) {
       
        [UIView animateWithDuration:0.2 animations:^{
            self.profileImageView.layer.masksToBounds = YES;
            self.profileImageView.layer.cornerRadius = self.originRect.size.width / 2;
        } completion:^(BOOL finished) {
            self.profileImageView.layer.cornerRadius = 0;
            [self removeFromSuperview];
        }];

    }];
}


@end
