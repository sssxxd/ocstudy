//
//  ViewController.h
//  Bookcase
//
//  Created by 孙旭东 on 2022/12/18.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<
UICollectionViewDelegate,
UICollectionViewDataSource
>

@property (nonatomic, strong) UICollectionView* collectionView;

@end

