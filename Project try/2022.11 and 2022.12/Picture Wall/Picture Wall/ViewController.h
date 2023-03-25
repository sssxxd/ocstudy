//
//  ViewController.h
//  Picture Wall
//
//  Created by 孙旭东 on 2022/11/22.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<
UICollectionViewDelegate,
UICollectionViewDataSource
>

@property (nonatomic, strong) UICollectionView* collectionView;

@end

