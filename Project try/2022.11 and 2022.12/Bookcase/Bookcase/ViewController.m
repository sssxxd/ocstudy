//
//  ViewController.m
//  Bookcase
//
//  Created by 孙旭东 on 2022/12/18.
//

#import "ViewController.h"
#import "BookcaseFaceCell.h"
#import "BookcaseCell.h"
#import "BookShowCell.h"
#import "FaceLayout.h"

#define KSreenWidth [UIScreen mainScreen].bounds.size.width

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initCollectionView];
}

- (void) initCollectionView {
    UICollectionViewFlowLayout* layout = [[FaceLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = CGSizeMake(KSreenWidth, 120);
    layout.minimumLineSpacing = 35;
    layout.sectionInset = UIEdgeInsetsMake(40, 0, 0, 0);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerClass:[BookcaseFaceCell class] forCellWithReuseIdentifier:@"bookcaseFace"];
    
    [self.collectionView registerClass:[BookShowCell class] forCellWithReuseIdentifier:@"bookShow"];
    
    [self.view addSubview:self.collectionView];
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

- (__kindof UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        BookShowCell* cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"bookShow" forIndexPath:indexPath];
        
        return cell;
    } else {
        BookcaseFaceCell* cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"bookcaseFace" forIndexPath:indexPath];
        return cell;
    }
}

@end
