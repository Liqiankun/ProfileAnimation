# How to use
```oc
-(void)tapAction
{
    self.profileView.image  = self.profileImageView.image;
    self.profileView.originRect = self.profileImageView.frame;
    [self.profileView begainAnimating];
}

```
