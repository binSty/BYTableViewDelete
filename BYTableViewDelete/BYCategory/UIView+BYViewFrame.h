//
//  UIView+BYViewFrame.h
//  NLControlsStudy
//
//  Created by 彬boy on 2020/11/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (BYViewFrame)

/// origin.x
@property (nonatomic, assign) CGFloat by_x;

/// origin.y
@property (nonatomic, assign) CGFloat by_y;

/// frame.size.width
@property (nonatomic, assign) CGFloat by_width;

/// frame.size.height
@property (nonatomic, assign) CGFloat by_height;

@property (nonatomic, assign) CGSize by_size;

/// bounds.size.width
@property (nonatomic, assign) CGFloat by_boundWidth;

/// bounds.size.height
@property (nonatomic, assign) CGFloat by_boundHeight;

/// frame.size.width
@property (nonatomic, assign) CGFloat by_frameWidth;

/// frame.size.height
@property (nonatomic, assign) CGFloat by_frameHeight;

/// center.x
@property (nonatomic, assign) CGFloat by_centerX;

/// center.y
@property (nonatomic, assign) CGFloat by_centerY;

@end

NS_ASSUME_NONNULL_END
