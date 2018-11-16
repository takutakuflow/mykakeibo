//
//  HomeViewController.m
//  mykakeibo
//
//  Created by 井出拓弥 on 2018/11/16.
//  Copyright © 2018 井出拓弥. All rights reserved.
//

#import "HomeViewController.h"
#import "XYPieChart.h"


@interface HomeViewController() <XYPieChartDelegate, XYPieChartDataSource>

// 各スライスの色
@property(nonatomic, strong) NSArray *sliceColors;
// 各スライスのデータ
@property(nonatomic, strong) NSMutableArray *slices;

@property (weak, nonatomic) IBOutlet UILabel *inPrice;
@property (weak, nonatomic) IBOutlet UILabel *outPrice;
@property (weak, nonatomic) IBOutlet UILabel *restPrice;

@end

@implementation HomeViewController {
    int inPriceNum;
    int outPriceNum;
    int restPriceNum;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    inPriceNum = 110000;
    outPriceNum = 30000;
    
    restPriceNum = inPriceNum - outPriceNum;
    
    self.inPrice.text = [NSString stringWithFormat:@"%d円",inPriceNum];
    self.outPrice.text = [NSString stringWithFormat:@"%d円",outPriceNum];
    self.restPrice.text = [NSString stringWithFormat:@"%d円", restPriceNum];
    
    // スライスに表示するデータの定義
    self.slices = [NSMutableArray arrayWithCapacity:5];
    
    NSNumber *indata = [NSNumber numberWithInt:inPriceNum];
    [self.slices addObject:indata];
    
    NSNumber *outdata = [NSNumber numberWithInt:outPriceNum];
    [self.slices addObject:outdata];
    
    NSNumber *restdata = [NSNumber numberWithInt:restPriceNum];
    [self.slices addObject:restdata];
    // 各項目の背景色を定義
    self.sliceColors = @[[UIColor colorWithRed:246/255.0 green:155/255.0 blue:0/255.0 alpha:1],
                         [UIColor colorWithRed:129/255.0 green:195/255.0 blue:29/255.0 alpha:1],
                         [UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1],
                         [UIColor colorWithRed:229/255.0 green:66/255.0 blue:115/255.0 alpha:1],
                         [UIColor colorWithRed:148/255.0 green:141/255.0 blue:139/255.0 alpha:1]];
    
    // パイチャートの初期化
    XYPieChart *pieChart = [[XYPieChart alloc] initWithFrame:CGRectMake(10, 10, 220.0, 220.0)];
    
    // デリゲートの設定
    pieChart.delegate = self;
    // データソースの設定
    pieChart.dataSource = self;
    // パイチャートの中心位置
    pieChart.pieCenter = CGPointMake([UIScreen mainScreen].bounds.size.width / 2 - 10, 200);
    // YESの場合、パーセンテージで数字を表示します。
    pieChart.showPercentage = NO;
    // 値を表示するラベルのフォント
    pieChart.labelFont = [UIFont systemFontOfSize:12.0];
    // 値を表示するラベルの色
    pieChart.labelColor = [UIColor blackColor];
    // 値を表示するラベル背景のシャドウカラー
    pieChart.labelShadowColor = [UIColor darkGrayColor];
    // 表示アニメーションのスピード
    pieChart.animationSpeed = 1.0;
    // パイチャートの背景色
    [pieChart setPieBackgroundColor:[UIColor darkGrayColor]];
    
    [self.view addSubview:pieChart];
    
    // パイチャートを描画します。
    [pieChart reloadData];
}

#pragma mark - XYPieChart Data Source

// スライスの件数
- (NSUInteger)numberOfSlicesInPieChart:(XYPieChart *)pieChart
{
    return self.slices.count;
}

// 各スライスの値
- (CGFloat)pieChart:(XYPieChart *)pieChart valueForSliceAtIndex:(NSUInteger)index
{
    return [self.slices[index] floatValue];
}

// 各スライスの色を設定(Optional)
- (UIColor *)pieChart:(XYPieChart *)pieChart colorForSliceAtIndex:(NSUInteger)index
{
    return self.sliceColors[(index % self.sliceColors.count)];
}

// 各スライスに表示する文字列の設定(Optional)
- (NSString *)pieChart:(XYPieChart *)pieChart textForSliceAtIndex:(NSUInteger)index
{
    return [NSString stringWithFormat:@"%@ 円", self.slices[index]];
}

@end
