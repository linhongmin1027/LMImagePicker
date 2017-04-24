//
//  LMImagePicker.h
//  LMImagePicker
//
//  Created by iOSDev on 17/4/24.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger , LMEditType) {
    LMEditTypeSquare =0,  //方形
    LMEditTypeCircle      //圆形
    
    
};
@interface LMImagePicker : NSObject
@property(nonatomic,copy)void(^imagecb)(UIImage *);
@property(nonatomic,copy)void(^editedImage)(UIImage *);

+(id)sharedInstance;
-(void)getImageFromViewController:(UIViewController *)vc
                            image:(void(^)(UIImage *img))callback
                      etitedImage:(void(^)(UIImage *editImage))etdited;
@end
