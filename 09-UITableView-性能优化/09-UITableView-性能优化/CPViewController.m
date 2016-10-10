//
//  CPViewController.m
//  09-UITableView-性能优化
//
//  Created by pan on 14-5-25.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CPViewController.h"
#import "Shop.h"

@interface CPViewController () <UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_shops;
    NSMutableArray *_shopsSelected;
}
@end

@implementation CPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"shops.plist" ofType:nil];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    
    // 将array中字典对象转成Shop模型对象
    _shops = [NSMutableArray array];
    
    for (NSDictionary *dict in array) {
        // 创建模型
//        Shop *s = [[Shop alloc]initWithDict:dict];
        Shop *s = [Shop shopWithDict:dict];
        // 将模型对象放进数组中
        [_shops addObject:s];
    }
    
//	NSLog(@"array.len=%d",array.count);
    _shopsSelected = [NSMutableArray array];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _shops.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    // 取出indexPath这行对应的商品shop模型对象
    Shop *s = _shops[indexPath.row];
    
    cell.textLabel.text = s.name;
    cell.detailTextLabel.text = s.desc;
    cell.imageView.image = [UIImage imageNamed:s.icon];
    
    
    if ([_shopsSelected containsObject:s]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

#pragma mark 监听点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"Select----%d",indexPath.row);
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    /*
        重点：模型操作数据，数据操作状态
     */
    Shop *s = _shops[indexPath.row];
    
    if ([_shopsSelected containsObject:s]) {
        [_shopsSelected removeObject:s];
    }else{
        [_shopsSelected addObject:s];
    }
    
    // 刷新表格
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    for (Shop *sh in _shopsSelected) {
        NSLog(@"%@",sh.name);
    }
    
//    UITableViewCell *selCell = [tableView cellForRowAtIndexPath:indexPath];
//    selCell.accessoryType = UITableViewCellAccessoryCheckmark;
}

//- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSLog(@"Deselect----%d",indexPath.row);
//}


@end
