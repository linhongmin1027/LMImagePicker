//
//  ViewController.m
//  LMImagePicker
//
//  Created by iOSDev on 17/4/24.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "ViewController.h"
#import "LMImagePicker.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
}

- (IBAction)clickLogo:(id)sender {
    UIImageView *imageView=(UIImageView *)sender;
    
    [[LMImagePicker sharedInstance] getImageFromViewController:self image:^(UIImage *img) {
        imageView.image=img;
        
    } etitedImage:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
