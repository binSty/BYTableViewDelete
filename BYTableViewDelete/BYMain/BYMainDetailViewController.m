//
//  BYMainDetailViewController.m
//  BYTableViewDelete
//
//  Created by YD_Dev_BinY on 2021/10/28.
//

#import "BYMainDetailViewController.h"
#import "BYMainDetailTableViewCell.h"
#import "BYMainDetailModel.h"

static NSString *cellID = @"BYMsgDetailTableViewCell";

@interface BYMainDetailViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *detailTableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong, nullable) NSIndexPath *editingIndexPath;

@end

@implementation BYMainDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataArray = [NSMutableArray array];
    [self _setDetailInit];
    [self _setDataInit];
}

- (void)_setDetailInit {
    
    self.detailTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NavigationBarHeight, kScreenW, kScreenH - NavigationBarHeight - BYSafeBottomMagin) style:UITableViewStylePlain];
    self.detailTableView.delegate = self;
    self.detailTableView.dataSource = self;
    self.detailTableView.backgroundColor = UIColorFromRGB(0xF5F5F5);
    self.detailTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.detailTableView.estimatedRowHeight = 70*KYY;
    self.detailTableView.rowHeight = UITableViewAutomaticDimension;
    [self.detailTableView registerClass:[BYMainDetailTableViewCell class] forCellReuseIdentifier:cellID];
    if (@available(iOS 11.0, *)) {
        self.detailTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    [self.view addSubview:self.detailTableView];
    
//    [self.detailTableView setEditing:YES animated:YES];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    if (self.editingIndexPath != nil) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.001 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self setupSlideBtn];
        });
    }
}

- (void)_setDataInit {
    NSArray *arrData = @[
        @{@"timeText": @"2021.5.26 11:04", @"roundImg": @"1", @"contentText": @"各位好，新业务系统版本更新，系统更新需要30分钟，更新时间从18:30到19:00，届时请大家暂停下手头上的系统操作，保存好各自的数据。给大家带来不便…"},
                        @{@"timeText": @"2021.5.26 11:04", @"roundImg": @"0", @"contentText": @"各位好，新业务系统版本更新"},
                        @{@"timeText": @"2021.5.26 11:04", @"roundImg": @"1", @"contentText": @"各位好，新业务系统版本更新，系统更新需要30分钟，更新时间从18:30到19:00，届时请大家暂停下手头上的系统操作，保存好各自的数据。给大家带来不便各位好，新业务系统版本更新，系统更新需要30分钟，更新时间从18:30到19:00，届时请大家暂停下手头上的系统操作，保存好各自的数据。给大家带来不便…"},
                        @{@"timeText": @"2021.5.26 11:04", @"roundImg": @"1", @"contentText": @"各位好，新业务系统版本更新，系统更新需要30分钟，更新时间从18:30到19:00，届时请大家暂停下手头上的系统操作，保存好各自的数据。给大家带来不便…"}
      ];
    for (NSDictionary *dict in arrData) {
        BYMainDetailModel *model = [BYMainDetailModel mj_objectWithKeyValues:dict];
        [self.dataArray addObject:model];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BYMainDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[BYMainDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = UIColorFromRGB(0xF5F5F5);
    cell.detailModel = self.dataArray[indexPath.row];
    return cell;
}

- (nullable UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath API_AVAILABLE(ios(11.0)) {
    UIContextualAction *action = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:@"删除" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        if (self.dataArray.count > indexPath.row) {
            [self.dataArray removeObjectAtIndex:indexPath.row];
            [UIView performWithoutAnimation:^{
                [self.detailTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            }];
        }
        completionHandler(YES);
    }];
    action.backgroundColor = UIColorFromRGB(0xC9C6CC);
    UISwipeActionsConfiguration *config = [UISwipeActionsConfiguration configurationWithActions:@[action]];
//    config.performsFirstActionWithFullSwipe = NO;
    self.editingIndexPath = indexPath;
    [self.view setNeedsLayout];
    return config;
}

- (void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath{
    self.editingIndexPath = indexPath;
    [self.view setNeedsLayout];
}

- (void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.editingIndexPath = nil;
}

// 设置左滑菜单按钮的样式
- (void)setupSlideBtn {
    if (@available(iOS 13.0, *)) {
        for (UIView *subView in self.detailTableView.subviews) {
            if ([subView isKindOfClass:NSClassFromString(@"_UITableViewCellSwipeContainerView")] && [subView.subviews count] >= 1) {
                UIView *remarkContentView = subView.subviews.firstObject;
                [self setupRowActionViewInit: remarkContentView];
            }
        }
        return;
    }
    if (@available(iOS 11.0, *)) {
        for (UIView *subView in self.detailTableView.subviews) {
            if ([subView isKindOfClass:NSClassFromString(@"UISwipeActionPullView")] && [subView.subviews count] >= 1) {
                UIView *remarkContentView = subView;
                remarkContentView.backgroundColor = [UIColor clearColor];
                [self setupRowActionViewInit: remarkContentView];
            }
        }
        return;
    }
    // iOS11 以下的版本
    UITableViewCell *cell = [self.detailTableView cellForRowAtIndexPath:self.editingIndexPath];
    for (UIView *subView in cell.subviews) {
        if ([subView isKindOfClass:NSClassFromString(@"UITableViewCellDeleteConfirmationView")] && [subView.subviews count] >= 1) {
            UIView *remarkContentView = subView;
            [self setupRowActionViewInit:remarkContentView];
        }
    }
}

- (void)setupRowActionViewInit:(UIView *)rowActionView {
    CGRect frame = rowActionView.frame;
    if (self.editingIndexPath == nil) {
        if (frame.origin.y > 0) {
            frame.origin.y = 0;
            frame.size.height += 15*KYY;
        }
    } else {
        if (frame.origin.y == 0) {
            frame.origin.y += 15*KYY;
            frame.size.height -= 15*KYY;
        }
    }
    rowActionView.frame = frame;
    UIButton *button = rowActionView.subviews.firstObject;
    [button setTitle:@"删除" forState:UIControlStateNormal];
    button.titleLabel.font = UIDEFAULTFONTSIZE(16);
}


@end
