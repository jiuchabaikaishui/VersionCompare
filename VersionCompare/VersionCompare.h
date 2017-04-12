//
//  Version.h
//  XiaoNiangaoTest
//
//  Created by 綦 on 17/4/12.
//  Copyright © 2017年 PowesunHolding. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 版本比较的结果
 
 - VersionCompareResultGreater: 前者大于后者
 - VersionCompareResultEqual: 相等
 - VersionCompareResultLess: 前者小于后者
 - VersionCompareResultCompareFailure: 判断出错或不能判断
 */
typedef NS_ENUM(NSInteger, VersionCompareResult) {
    VersionCompareResultGreater = 0,
    VersionCompareResultEqual = 1,
    VersionCompareResultLess = 2,
    VersionCompareResultCompareFailure = 3
};

@interface VersionCompare : NSObject

/**
 判断版本号
 
 @param firstVesion 第一个版本号
 @param otherVersion 其他版本号
 @return 比较结果
 */
+ (VersionCompareResult)versionCompare:(NSString *)firstVesion ortherVersion:(NSString *)otherVersion;

@end
