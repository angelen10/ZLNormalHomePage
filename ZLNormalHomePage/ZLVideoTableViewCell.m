//
//  ZLVideoTableViewCell.m
//  ZLNormalHomePage
//
//  Created by angelen on 16/9/26.
//  Copyright © 2016年 ANGELEN. All rights reserved.
//

#import "ZLVideoTableViewCell.h"
#import "ZLVideoCollectionViewCell.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define LIST_ITEM_PADDING 10
#define LIST_ITEM_WIDTH ((SCREEN_WIDTH - 3 * 10) / 2)
#define LIST_ITEM_HEIGHT (LIST_ITEM_WIDTH / 16 * 9 + 58)

static NSString *const kReuseIdentifier = @"Cell";

@interface ZLVideoTableViewCell()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) UICollectionView *collectionView;

@end

@implementation ZLVideoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUIElements];
    }
    return self;
}

- (void)setupUIElements {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = LIST_ITEM_PADDING;
    layout.minimumLineSpacing = LIST_ITEM_PADDING;
    layout.sectionInset = UIEdgeInsetsMake(0, LIST_ITEM_PADDING, 0, LIST_ITEM_PADDING);
    layout.itemSize = CGSizeMake(LIST_ITEM_WIDTH, LIST_ITEM_HEIGHT);
    
    NSLog(@"kekeke----->%f", self.frame.size.height); // 只有 44，所以这个高度是不对的
    // 可以使用 Masonry 设置 collectionView 的高度就是和该 cell 的高度就 OK，或者边缘
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 400) collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.scrollEnabled = NO;
    self.collectionView.bounces = NO;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self.collectionView registerClass:[ZLVideoCollectionViewCell class] forCellWithReuseIdentifier:kReuseIdentifier];
    [self addSubview:self.collectionView];
}

#pragma mark - <UICollectionViewDataSource> & <UICollectionViewDelegate>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZLVideoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kReuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [self randomColor];
    return cell;
}

- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
