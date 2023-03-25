//
//  ViewController.h
//  Use ImagePickerController
//
//  Created by 孙旭东 on 2022/11/30.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UINavigationControllerDelegate,
UIImagePickerControllerDelegate>

@property (nonatomic, strong) UIImageView* showImage;


@end

