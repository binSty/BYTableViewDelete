//
//  BYHeader.h
//  BYTableViewDelete
//
//  Created by YD_Dev_BinY on 2021/10/28.
//

#ifndef BYHeader_h
#define BYHeader_h

/** 机型视频 是否iPhone X以上*/
#define kDevice_Is_iPhoneX \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

// 适配iPhone X以上 导航栏高、TabBar高、底部安全区域
#define NavigationBarHeight (kDevice_Is_iPhoneX ? 88.f : 64.f)
#define BYSafeBottomMagin  (kDevice_Is_iPhoneX ? 34.f : 0.f)


/** 屏幕尺寸相关适配*/
#define kScreenW        [UIScreen mainScreen].bounds.size.width // 屏幕宽
#define kScreenH        [UIScreen mainScreen].bounds.size.height // 屏幕高
#define KXX             [UIScreen mainScreen].bounds.size.width / 375 // 以宽375屏幕适配机型
#define KYY             [UIScreen mainScreen].bounds.size.height / (kDevice_Is_iPhoneX ? 812 : 667) 

/*! 颜色大小定义*/
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

/**字体大小及粗体和常规体*/
#define UIDEFAULTFONTSIZE(__VA_ARGS__)  ([UIFont fontWithName:@"PingFang-SC-Regular" size:YD_ScaleFont(__VA_ARGS__)])
#define UIMEDIUMTFONTSIZE(__VA_ARGS__)  ([UIFont fontWithName:@"PingFang-SC-Medium" size:YD_ScaleFont(__VA_ARGS__)])
/**字体比例*/
#define YD_ScaleFont(__VA_ARGS__)  ([UIScreen mainScreen].bounds.size.width/375.f)*(__VA_ARGS__)

#endif /* BYHeader_h */
