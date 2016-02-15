# How to use
```oc
-(void)tapAction
{
    self.profileView.image  = self.profileImageView.image;
    self.profileView.originRect = self.profileImageView.frame;
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    [window addSubview:self.profileView];
    [self.profileView begainAnimating];
}
```
