//
//  ViewController.m
//  ProfileAnimationDemo
//
//  Created by DavidLee on 16/2/15.
//  Copyright © 2016年 DavidLee. All rights reserved.
//

#import "ViewController.h"
#import "ProfileAnimationView.h"
@interface ViewController ()

@property(nonatomic,strong)UIImageView *profileImageView;
@property(nonatomic,strong)ProfileAnimationView *profileView;
@end

@implementation ViewController

-(ProfileAnimationView*)profileView
{
    if (!_profileView) {
        self.profileView = [[ProfileAnimationView alloc] init];
    }
    return _profileView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self uiConfig];
}

-(void)uiConfig
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat viewWidth = self.view.frame.size.width;
    self.profileImageView = [[UIImageView alloc] initWithFrame:CGRectMake(viewWidth/ 2 - 50, 60, 100, 100)];
    self.profileImageView.image = [UIImage imageNamed:@"profile"];
    self.profileImageView.userInteractionEnabled = YES;
    self.profileImageView.layer.cornerRadius = 50;
    self.profileImageView.layer.masksToBounds = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self.profileImageView addGestureRecognizer:tap];

    [self.view addSubview:self.profileImageView];
}

-(void)tapAction
{
    self.profileView.image  = self.profileImageView.image;
    self.profileView.originRect = self.profileImageView.frame;
    [self.profileView begainAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
