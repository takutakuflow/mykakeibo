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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.inPrice.text = @"110,000";
    self.outPrice.text = @"30,000";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
