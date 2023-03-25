//
//  ViewController.m
//  Picture Wall
//
//  Created by 孙旭东 on 2022/11/22.
//

#import "ViewController.h"
#import "PictureCell.h"
#import "MyLayout.h"
#import "CricleLayout.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initCollectionView];
}

//- (void) initCollectView {
//    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
//    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
//    layout.minimumLineSpacing = 20;
//    layout.minimumInteritemSpacing = 20;
//    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
//    layout.itemSize = CGSizeMake((self.view.bounds.size.width - 60) / 3, 150);
//
//    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
//    self.collectionView.delegate = self;
//    self.collectionView.dataSource = self;
//
//    [self.collectionView registerClass:[PictureCell class] forCellWithReuseIdentifier:@"cell"];
//
//    [self.view addSubview:self.collectionView];
//}

//- (void) initCollectView {
////    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
////    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
////    layout.minimumLineSpacing = 20;
////    layout.minimumInteritemSpacing = 20;
////    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
////    layout.itemSize = CGSizeMake((self.view.bounds.size.width - 60) / 3, 150);
//    MyLayout* layout = [[MyLayout alloc] init];
//
//    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 180) collectionViewLayout:layout];
//    self.collectionView.showsHorizontalScrollIndicator = NO;
//    self.collectionView.delegate = self;
//    self.collectionView.dataSource = self;
//
//    [self.collectionView registerClass:[PictureCell class] forCellWithReuseIdentifier:@"cell"];
//
//    [self.view addSubview:self.collectionView];
//}

- (void) initCollectionView {
    CricleLayout* layout = [[CricleLayout alloc] init];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 180) collectionViewLayout:layout];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerClass:[PictureCell class] forCellWithReuseIdentifier:@"cell"];
    
    [self.view addSubview:self.collectionView];
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (__kindof UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PictureCell*  cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell.imageView setImage:[UIImage imageNamed:@"ef.jpeg"]];
    return cell;
}


@end
