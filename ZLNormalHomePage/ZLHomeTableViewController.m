//
//  ZLHomeTableViewController.m
//  ZLNormalHomePage
//
//  Created by angelen on 16/9/26.
//  Copyright © 2016年 ANGELEN. All rights reserved.
//

#import "ZLHomeTableViewController.h"
#import "ZLCategoryCollectionViewCell.h"
#import "ZLVideoTableViewCell.h"
#import "ZLCategory.h"
#import "YYModel.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

static NSString *const kReuseIdentifier = @"Cell";
static NSString *const kCollectionViewIdentifier = @"kCollectionViewIdentifier";

@interface ZLHomeTableViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) NSArray<ZLCategory *> *categories;

/** 分类 CollectionView */
@property (strong, nonatomic) UICollectionView *collectionView;

@end

@implementation ZLHomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";
    [self.tableView registerClass:[ZLVideoTableViewCell class] forCellReuseIdentifier:kReuseIdentifier];
    
    [self setupCollectionView];
    
}

- (void)setupCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 1.5;
    layout.minimumLineSpacing = 1.5;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(SCREEN_WIDTH * 0.21, SCREEN_WIDTH * 0.19);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100) collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self.collectionView registerClass:[ZLCategoryCollectionViewCell class] forCellWithReuseIdentifier:kCollectionViewIdentifier];
    self.tableView.tableHeaderView = self.collectionView;
}

#pragma mark - <UITableViewDataSource> & <UITableViewDelegate>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.categories.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZLVideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseIdentifier forIndexPath:indexPath];
//    ZLCategory *category = self.categories[indexPath.section];
//    ZLVideoInfo *videoInfo = category.videoInfoList[indexPath.row];
//    cell.textLabel.text = videoInfo.teacherName;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.categories[section].name;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 400;
}

#pragma mark - <UICollectionViewDataSource> & <UICollectionViewDelegate>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.categories.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZLCategoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCollectionViewIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [self randomColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"didSelectItemAtIndexPathRow = %zd", indexPath.row);
}

- (NSArray<ZLCategory *> *)categories {
    if (!_categories) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"home" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        _categories = [NSArray yy_modelArrayWithClass:[ZLCategory class] json:dict[@"result"]];
    }
    return _categories;
}


- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
