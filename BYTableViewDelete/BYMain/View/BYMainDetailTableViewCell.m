//
//  BYMainDetailTableViewCell.m
//  BYTableViewDelete
//
//  Created by YD_Dev_BinY on 2021/10/28.
//

#import "BYMainDetailTableViewCell.h"

@implementation BYMainDetailTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self _setCellInit];
    }
    return self;
}

- (void)_setCellInit {
    
    self.cellContentBackView = [[UIView alloc] init];
    self.cellContentBackView.backgroundColor = [UIColor whiteColor];
    self.cellContentBackView.layer.cornerRadius = 5*KYY;
    self.cellContentBackView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.cellContentBackView];
    
    self.cellTipImg = [[UIImageView alloc] init];
    self.cellTipImg.backgroundColor = [UIColor lightGrayColor];
    self.cellTipImg.contentMode = UIViewContentModeScaleAspectFill;
    self.cellTipImg.clipsToBounds = YES;
    self.cellTipImg.layer.cornerRadius = 11*KYY;
    self.cellTipImg.layer.masksToBounds = YES;
    [self.cellContentBackView addSubview:self.cellTipImg];
    
    self.cellRoundImg = [[UIImageView alloc] init];
    self.cellRoundImg.backgroundColor = [UIColor redColor];
    self.cellRoundImg.layer.cornerRadius = 4*KYY;
    self.cellRoundImg.layer.masksToBounds = YES;
    [self.cellContentBackView addSubview:self.cellRoundImg];
    
    self.cellTimeLb = [[UILabel alloc] init];
    self.cellTimeLb.font = UIDEFAULTFONTSIZE(13);
    self.cellTimeLb.textColor = UIColorFromRGB(0xA0A0A0);
    self.cellTimeLb.textAlignment = NSTextAlignmentRight;
    [self.cellContentBackView addSubview:self.cellTimeLb];
    
    self.cellTitleLb = [[UILabel alloc] init];
    self.cellTitleLb.text = @"站内信";
    self.cellTitleLb.font = UIMEDIUMTFONTSIZE(16);
    self.cellTitleLb.textColor = UIColorFromRGB(0x333333);
    [self.cellContentBackView addSubview:self.cellTitleLb];
    
    self.separatorView = [[UIView alloc] init];
    self.separatorView.backgroundColor = UIColorFromRGB(0xF5F5F5);
    [self.cellContentBackView addSubview:self.separatorView];
    
    self.contentLb = [[UILabel alloc] init];
    self.contentLb.font = UIDEFAULTFONTSIZE(13);
    self.contentLb.textColor = UIColorFromRGB(0xA0A0A0);
    self.contentLb.numberOfLines = 0;
    [self.cellContentBackView addSubview:self.contentLb];
    
    [self.cellContentBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(15*KXX);
        make.right.equalTo(self.contentView).offset(-15*KXX);
    }];
    
    [self.cellTipImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cellContentBackView).offset(14*KYY);
        make.left.equalTo(self.cellContentBackView).offset(15*KYY);
        make.width.height.mas_equalTo(22*KYY);
    }];
    
    [self.cellRoundImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cellContentBackView).offset(12*KYY);
        make.left.equalTo(self.cellTipImg.mas_right).offset(-6*KYY);
        make.width.height.mas_equalTo(8*KYY);
    }];
    
    [self.cellTimeLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cellTipImg);
        make.right.equalTo(self.cellContentBackView).offset(-15*KXX);
        make.width.mas_equalTo(100*KXX);
        make.height.mas_equalTo(22*KYY);
    }];
    
    [self.cellTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cellTipImg);
        make.left.equalTo(self.cellTipImg.mas_right).offset(6*KXX);
        make.right.equalTo(self.cellTimeLb.mas_left).offset(-15*KXX);
        make.height.mas_equalTo(22*KYY);
    }];
    
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cellTipImg.mas_bottom).offset(8*KYY);
        make.left.right.equalTo(self.cellContentBackView);
        make.height.mas_equalTo(1*KYY);
    }];
    
    [self.contentLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.separatorView.mas_bottom).offset(10*KYY);
        make.left.equalTo(self.cellContentBackView).offset(15*KYY);
        make.right.equalTo(self.cellContentBackView).offset(-15*KXX);
        make.bottom.equalTo(self.cellContentBackView).offset(-10*KYY);
    }];
    
    [self.cellContentBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(15*KYY);
        make.bottom.equalTo(self.contentView);
    }];
}

- (void)setDetailModel:(BYMainDetailModel *)detailModel {
    _detailModel = detailModel;
    self.cellTimeLb.text = detailModel.timeText;
    self.contentLb.text = detailModel.contentText;
    self.cellRoundImg.hidden = [detailModel.roundImg isEqualToString:@"0"] ? YES : NO;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
