//
//  ViewController.h
//  UIConllectionView
//
//  Created by 孙旭东 on 2022/11/20.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UICollectionViewDelegate,
UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView* collectionView;

@end

