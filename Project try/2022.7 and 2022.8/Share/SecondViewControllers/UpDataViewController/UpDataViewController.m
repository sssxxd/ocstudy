//
//  UpDataViewController.m
//  Share
//
//  Created by 孙旭东 on 2022/8/2.
//

#import "UpDataViewController.h"
#import "PictureWallViewController.h"

@interface UpDataViewController ()

@end

@implementation UpDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.97 alpha:1];
    
    self.view.userInteractionEnabled = YES;
    
    self.pictureWallViewController = [[PictureWallViewController alloc] init];
    
    _pictureWallViewController.delegate = self;
    
    [self createImageView];
    
    [self createTypeButton];
    
    [self createButtons];
    
    [self creaTextFiled];
    
    [self createButtonUpData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma - 创建图片
- (void) createImageView {
    _picture = [[UIImageView alloc] initWithFrame:CGRectMake(10, 130, 200, 200)];
    _picture.backgroundColor = [UIColor grayColor];
    [_picture setImage:imagePicture];
    [self.view addSubview:_picture];

    // 打开用户交互
    _picture.userInteractionEnabled = YES;
    // 创建点击手势
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressTap)];
    // 单次点击
    tap.numberOfTapsRequired = 1;
    // 单个手指
    tap.numberOfTouchesRequired =1;
    
    [_picture addGestureRecognizer:tap];
    
    if (_count != 0) {
        _pictureNumber = [[UILabel alloc] initWithFrame:CGRectMake(180, 0, 20, 20)];
        _pictureNumber.backgroundColor = [UIColor redColor];
        _pictureNumber.textColor = [UIColor whiteColor];
        _pictureNumber.text = [NSString stringWithFormat:@"%lu", _count];
        [_picture addSubview:_pictureNumber];
    }
}

- (void) pressTap {
    [self.navigationController pushViewController:_pictureWallViewController animated:YES];
}



#pragma - 创建地址和选择按钮
- (void) createTypeButton {
    UIImageView* addressIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"adressLogo.png"]];
    addressIcon.tintColor = [UIColor colorWithRed:0.31 green:0.47 blue:0.78 alpha:1];
    addressIcon.frame = CGRectMake(240, 220, 20, 20);
    [self.view addSubview:addressIcon];
    
    UILabel* addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(265, 220, 100, 20)];
    addressLabel.backgroundColor = [UIColor colorWithRed:0.31 green:0.47 blue:0.78 alpha:1];
    addressLabel.layer.masksToBounds = YES;
    addressLabel.layer.cornerRadius = 8;
    addressLabel.font = [UIFont systemFontOfSize:12];
    addressLabel.textColor = [UIColor whiteColor];
    addressLabel.text = @"陕西省，西安市";
    addressLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:addressLabel];
    

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(240, 260, 100, 20) style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.userInteractionEnabled = YES;
    
    [_tableView reloadData];
    
    [self selectTypeButtons];
    _selected = NO;
    
    [self.view addSubview:_tableView];
    
    UIButton* selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    selectButton.frame = CGRectMake(320, 260, 20, 20);
    [selectButton setImage:[UIImage imageNamed:@"07jiantouxiangzuofill.png"] forState:UIControlStateNormal];
    [selectButton setImage:[UIImage imageNamed:@"07jiantouxiangxiafill.png"] forState:UIControlStateSelected];
    [selectButton addTarget:self action:@selector(pressselectButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:selectButton];
    _selectButton = selectButton;
}

- (void) pressselectButton:(UIButton*)sender {
    if (sender.selected == NO) {
        sender.selected = YES;
        _selected = YES;
        
        _tableView.frame = CGRectMake(240, 260, 100, 80);
        [_tableView reloadData];
    } else {
        sender.selected = NO;
        _selected = NO;
        
        _tableView.frame = CGRectMake(240, 260, 100, 20);
        [_tableView reloadData];
    }
}

// 创建种类选择按钮组
- (void) selectTypeButtons {
    _buttonsForSelect = [[NSMutableArray alloc] init];
    for (int i = 0; i < 4; i++) {
        
        if (i == 0) {
            [_buttonsForSelect addObject:@"原创作品"];
        } else if (i == 1) {
            [_buttonsForSelect addObject:@"搬运"];
        }else if (i == 2) {
            [_buttonsForSelect addObject:@"数媒设计"];
        } else {
            [_buttonsForSelect addObject:@"工程设计"];
        }
        
    }
}

#pragma - 创建按钮组
- (void) createButtons {
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 2; j++) {
            UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            button.backgroundColor = [UIColor whiteColor];
            button.layer.masksToBounds = YES;
            button.layer.cornerRadius = 5;
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
            [button setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:0.31 green:0.47 blue:0.78 alpha:1]] forState:UIControlStateSelected];
            button.frame = CGRectMake(20 + 90 * i, 360 + 30 * j, 80, 20);
            [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
            
            if (i == 0) {
                if (j == 0) {
                    [button setTitle:@"平面设计" forState:UIControlStateNormal];
                } else {
                    [button setTitle:@"虚拟与设计" forState:UIControlStateNormal];
                }
            } else if (i == 1) {
                if (j == 0) {
                    [button setTitle:@"网页设计" forState:UIControlStateNormal];
                } else {
                    [button setTitle:@"影视" forState:UIControlStateNormal];
                }
            } else if (i == 2) {
                if (j == 0) {
                    [button setTitle:@"UI/icon" forState:UIControlStateNormal];
                } else {
                    [button setTitle:@"摄影" forState:UIControlStateNormal];
                }
            } else if (i == 3) {
                if (j == 0) {
                    [button setTitle:@"插画/手绘" forState:UIControlStateNormal];
                } else {
                    [button setTitle:@"其他" forState:UIControlStateNormal];
                }
            }
            [self.view addSubview:button];
        }
    }
}

// 点击事件
- (void) pressButton:(UIButton*)sender {
    UIButton* button = (UIButton*)sender;
    button.selected = !button.selected;
}

// 颜色转变为背景图片
- (UIImage*) imageWithColor:(UIColor*)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();

        CGContextSetFillColorWithColor(context, [color CGColor]);
        CGContextFillRect(context, rect);

        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();

        return  image;
}

// 创建两个文本框
- (void) creaTextFiled {
    UITextField* workTitle = [[UITextField alloc] initWithFrame:CGRectMake(0, 430, self.view.bounds.size.width, 30)];
    workTitle.placeholder = @"作品名称";
    workTitle.borderStyle = UITextBorderStyleRoundedRect;
    workTitle.adjustsFontSizeToFitWidth = YES;
    workTitle.keyboardType = UIKeyboardTypeDefault;
    workTitle.tintColor = [UIColor whiteColor];
    
    UITextField* workIllustrate = [[UITextField alloc] initWithFrame:CGRectMake(0, 465, self.view.bounds.size.width, 100)];
    workIllustrate.text = @"请添加作品说明文章内容...";
    workIllustrate.borderStyle = UITextBorderStyleRoundedRect;
    workIllustrate.adjustsFontSizeToFitWidth = YES;
    workIllustrate.keyboardType = UIKeyboardTypeDefault;
    workIllustrate.tintColor = [UIColor whiteColor];
    
    [self.view addSubview:workTitle];
    [self.view addSubview:workIllustrate];
}

- (void) createButtonUpData {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(10, 570, self.view.bounds.size.width - 10, 40);
    button.backgroundColor = [UIColor colorWithRed:0.31 green:0.47 blue:0.78 alpha:1];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:@"发布" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    UIButton* forbidLogo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    forbidLogo.frame = CGRectMake(10, 615, 20, 20);
    [forbidLogo setImage:[UIImage imageNamed:@"checkbox_unchecked.png"] forState:UIControlStateNormal];
    [forbidLogo setImage:[[UIImage imageNamed:@"checkbox_checked.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateSelected];
    [forbidLogo setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:0.94 green:0.94 blue:0.97 alpha:1]] forState:UIControlStateSelected];
    [forbidLogo addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forbidLogo];
    
    UILabel* forbid = [[UILabel alloc] initWithFrame:CGRectMake(40, 615, 80, 20)];
    forbid.text = @"禁止下载";
    [self.view addSubview:forbid];
}

#pragma - 传值协议
- (void) setUpPictureImageTag:(NSUInteger)imageTag Count:(NSInteger)count{
    NSString* imageName = [NSString stringWithFormat:@"icon_img%lu.jpeg", imageTag - 209];
    imagePicture = [UIImage imageNamed:imageName];
    [_picture setImage:imagePicture];
    
    _count = count;
    
    if (_count != 0) {
        _pictureNumber = [[UILabel alloc] initWithFrame:CGRectMake(180, 0, 20, 20)];
        _pictureNumber.backgroundColor = [UIColor redColor];
        _pictureNumber.textColor = [UIColor whiteColor];
        _pictureNumber.text = [NSString stringWithFormat:@"%lu", _count];
        [_picture addSubview:_pictureNumber];
    }
}

#pragma - 折叠cell设计
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_selected) {
        return 4;
    } else {
        return 1;
    }
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellName = @"cellName";
    
    UITableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    
    cell.textLabel.text = _buttonsForSelect[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 20;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* object = [_buttonsForSelect objectAtIndex:indexPath.row];
    [_buttonsForSelect removeObject:object];
    [_buttonsForSelect insertObject:object atIndex:0];
    
    [self pressselectButton:self.selectButton];
    
    [_tableView reloadData];
}

@end
