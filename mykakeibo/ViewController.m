//
//  ViewController.m
//  mykakeibo
//
//  Created by 井出拓弥 on 2018/08/02.
//  Copyright © 2018年 井出拓弥. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *inPrice;
@property (weak, nonatomic) IBOutlet UILabel *outPrice;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UILabel *restPrice;

@end

@implementation ViewController {
    int inPriceNum;
    int outPriceNum;
    int restPriceNum;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    inPriceNum = 110000;
    outPriceNum = 30000;
    
    restPriceNum = inPriceNum - outPriceNum;
    
    self.inPrice.text = [NSString stringWithFormat:@"%d",inPriceNum];
    self.outPrice.text = [NSString stringWithFormat:@"%d",outPriceNum];
    self.restPrice.text = [NSString stringWithFormat:@"%d", restPriceNum];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
