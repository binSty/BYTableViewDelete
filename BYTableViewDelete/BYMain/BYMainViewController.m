//
//  BYMainViewController.m
//  BYTableViewDelete
//
//  Created by YD_Dev_BinY on 2021/10/28.
//

#import "BYMainViewController.h"
#import "BYMainDetailViewController.h"

static NSString *const cellID = @"cellID";

@interface BYMainViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *mainTableView;

@property (nonatomic, copy) NSArray *dataArray;

@end

@implementation BYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self mainControlInit];
}

- (void)mainControlInit {
    
    [self.view addSubview:self.mainTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = @"cell 侧滑验证";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BYMainDetailViewController *detailVC = [[BYMainDetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (UITableView *)mainTableView {
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NavigationBarHeight, kScreenW, kScreenH - NavigationBarHeight - BYSafeBottomMagin)];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        if (@available(iOS 11.0, *)) {
            _mainTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        [_mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
        _mainTableView.tableFooterView = [UIView new];
    }
    return _mainTableView;
}

@end
