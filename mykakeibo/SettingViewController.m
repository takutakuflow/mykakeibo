//
//  SettingViewController.m
//  mykakeibo
//
//  Created by 井出拓弥 on 2018/11/29.
//  Copyright © 2018 井出拓弥. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return 3;
            break;
        default:
            return 1;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // "cell"というkeyでcellデータを取得
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    // cellデータが無い場合、UITableViewCellを生成して、"cell"というkeyでキャッシュする
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = @"ハム太郎";
            break;
        case 1:
            cell.textLabel.text = @"ハムちゃんズ家計簿";
            break;
        case 2:
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"ハム太郎";
                    break;
                case 1:
                    cell.textLabel.text = @"こうし君";
                    break;
                case 2:
                    cell.textLabel.text = @"リボンちゃん";
                    break;
                default:
                    break;
            }
        default:
            break;
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"ユーザ名";
            break;
        case 1:
            return @"家計簿";
            break;
        case 2:
            return @"メンバー";
            break;
        default:
            return @"hoge";
            break;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // cellがタップされた際の処理
}

@end
