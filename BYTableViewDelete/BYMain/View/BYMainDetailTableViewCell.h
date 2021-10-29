//
//  BYMainDetailTableViewCell.h
//  BYTableViewDelete
//
//  Created by YD_Dev_BinY on 2021/10/28.
//

#import <UIKit/UIKit.h>
#import "BYMainDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BYMainDetailTableViewCell : UITableViewCell

@property (nonatomic, strong) UIView *cellContentBackView;
@property (nonatomic, strong) UIImageView *cellTipImg;
@property (nonatomic, strong) UIImageView *cellRoundImg;
@property (nonatomic, strong) UILabel *cellTitleLb;
@property (nonatomic, strong) UILabel *cellTimeLb;
@property (nonatomic, strong) UIView *separatorView;
@property (nonatomic, strong) UILabel *contentLb;

@property (nonatomic, strong) BYMainDetailModel *detailModel;

@end

NS_ASSUME_NONNULL_END
