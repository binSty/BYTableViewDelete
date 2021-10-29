//
//  UIView+BYViewFrame.m
//  NLControlsStudy
//
//  Created by 彬boy on 2020/11/30.
//

#import "UIView+BYViewFrame.h"

@implementation UIView (BYViewFrame)

- (void)setBy_x:(CGFloat)by_x {
    CGRect rect = self.frame;
    rect.origin.x = by_x;
    self.frame = rect;
}

- (CGFloat)by_x {
    return self.frame.origin.x;
}

- (void)setBy_y:(CGFloat)by_y {
    CGRect rect = self.frame;
    rect.origin.y = by_y;
    self.frame = rect;
}

- (CGFloat)by_y {
    return self.frame.origin.y;
}

- (void)setBy_width:(CGFloat)by_width {
    CGRect frame = self.frame;
    frame.size.width = by_width;
    self.frame = frame;
}

- (CGFloat)by_width {
    return self.frame.size.width;
}

- (void)setBy_height:(CGFloat)by_height {
    CGRect frame = self.frame;
    frame.size.height = by_height;
    self.frame = frame;
}

- (CGFloat)by_height {
    return self.frame.size.height;
}

- (void)setBy_size:(CGSize)by_size {
    CGRect rect = self.bounds;
    rect.size = by_size;
    self.bounds = rect;
}

- (CGSize)by_size {
    return self.bounds.size;
}

- (void)setBy_boundWidth:(CGFloat)by_boundWidth {
    CGRect rect = self.bounds;
    rect.size.width = by_boundWidth;
    self.bounds = rect;
}

- (CGFloat)by_boundWidth {
    return self.bounds.size.width;
}

- (void)setBy_boundHeight:(CGFloat)by_boundHeight {
    CGRect rect = self.bounds;
    rect.size.height = by_boundHeight;
    self.bounds = rect;
}

- (CGFloat)by_boundHeight {
    return self.bounds.size.height;
}

- (void)setBy_frameWidth:(CGFloat)by_frameWidth {
    CGRect rect = self.frame;
    rect.size.width = by_frameWidth;
    self.frame = rect;
}

- (CGFloat)by_frameWidth {
    return self.frame.size.width;
}

- (void)setBy_frameHeight:(CGFloat)by_frameHeight {
    CGRect rect = self.frame;
    rect.size.height = by_frameHeight;
    self.frame = rect;
}

- (CGFloat)by_frameHeight {
    return self.frame.size.height;
}

- (void)setBy_centerX:(CGFloat)by_centerX {
    CGPoint center = self.center;
    center.x = by_centerX;
    self.center = center;
}

- (CGFloat)by_centerX {
    return self.center.x;
}

- (void)setBy_centerY:(CGFloat)by_centerY {
    CGPoint center = self.center;
    center.y = by_centerY;
    self.center = center;
}

- (CGFloat)by_centerY {
    return self.center.y;
}

@end
