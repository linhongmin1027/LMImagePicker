//
//  LMImagePicker.m
//  LMImagePicker
//
//  Created by iOSDev on 17/4/24.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "LMImagePicker.h"
#import "LMEditController.h"
@interface LMImagePicker()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@end
@implementation LMImagePicker
{
    UIViewController *_viewController;

}
+(id)sharedInstance{
    static LMImagePicker * _p=nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _p=[[LMImagePicker alloc]init];
            
        });
    return _p;
}
-(void)getImageFromViewController:(UIViewController *)vc
                            image:(void(^)(UIImage *img))callback
                      etitedImage:(void(^)(UIImage *editImage))etdited{
    _viewController=vc;
    _imagecb=callback;
    [self selectImageEdited:NO];
}
-(void)selectImageEdited:(BOOL)edit{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"从相册选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self pickImageFrom:UIImagePickerControllerSourceTypePhotoLibrary edit:edit];
        
    }];
    [alert addAction:action];
    
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self pickImageFrom:UIImagePickerControllerSourceTypeCamera  edit:edit];
    }];
    [alert addAction:action2];
    
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:action3];
    [_viewController presentViewController:alert animated:YES completion:nil];
}

-(void)pickImageFrom:(UIImagePickerControllerSourceType)type edit:(BOOL)edit{
    UIImagePickerController *picker=[[UIImagePickerController alloc]init];
    picker.allowsEditing=edit;
    picker.delegate=self;
    picker.sourceType=type;
    [_viewController presentViewController:picker animated:YES completion:nil];

}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *img=info[@"UIImagePickerControllerOriginalImage"];
    LMEditController *editController=[[LMEditController alloc]init];
    editController.sourceImage=img;
    [picker pushViewController:editController animated:YES];



}
@end
