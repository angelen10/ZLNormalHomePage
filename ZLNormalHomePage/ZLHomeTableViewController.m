//
//  ZLHomeTableViewController.m
//  ZLNormalHomePage
//
//  Created by angelen on 16/9/26.
//  Copyright © 2016年 ANGELEN. All rights reserved.
//

#import "ZLHomeTableViewController.h"
#import "ZLCategory.h"
#import "YYModel.h"

static NSString *const kReuseIdentifier = @"Cell";

@interface ZLHomeTableViewController ()

@property (strong, nonatomic) NSArray<ZLCategory *> *categories;

@end

@implementation ZLHomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kReuseIdentifier];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.categories.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.categories[section].videoInfoList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseIdentifier forIndexPath:indexPath];
    ZLCategory *category = self.categories[indexPath.section];
    ZLVideoInfo *videoInfo = category.videoInfoList[indexPath.row];
    cell.textLabel.text = videoInfo.teacherName;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.categories[section].name;
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

@end
