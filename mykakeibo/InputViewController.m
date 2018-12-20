//
//  InputViewController.m
//  mykakeibo
//
//  Created by 井出拓弥 on 2018/08/19.
//  Copyright © 2018年 井出拓弥. All rights reserved.
//

#import "InputViewController.h"

@interface InputViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation InputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"inputCell"];
    
    UILabel *label = [cell viewWithTag:1];

    switch (indexPath.row) {
        case 0:
            label.text = @"金額";
            break;
        case 1:
            label.text = @"カテゴリー";
            break;
        case 2:
            label.text = @"日付";
            break;
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // cellがタップされた際の処理
}

@end
