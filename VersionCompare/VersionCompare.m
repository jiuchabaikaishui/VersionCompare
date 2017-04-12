//
//  Version.m
//  XiaoNiangaoTest
//
//  Created by 綦 on 17/4/12.
//  Copyright © 2017年 PowesunHolding. All rights reserved.
//

#import "VersionCompare.h"

/**
 点字符
 */
#define Version_PointSymbol         @"."

@implementation VersionCompare

/**
 判断版本号

 @param firstVesion 第一个版本号
 @param otherVersion 其他版本号
 @return 比较结果
 */
+ (VersionCompareResult)versionCompare:(NSString *)firstVesion ortherVersion:(NSString *)otherVersion
{
    //定义result用于存储判断结果默认为前者比后者大
    VersionCompareResult result = VersionCompareResultGreater;
    
    //前者为空
    if ([self isBlankString:firstVesion]) {
        //后者为空
        if ([self isBlankString:otherVersion]) {
            result = VersionCompareResultEqual;
        }
        else//后者不为空
        {
            result = VersionCompareResultLess;
        }
    }
    else//前者不为空
    {
        //后者为空
        if ([self isBlankString:otherVersion]) {
            result = VersionCompareResultGreater;
        }
        else//后者不为空
        {
            //前者后者字符串内容相同
            if ([firstVesion isEqualToString:otherVersion]) {
                result = VersionCompareResultEqual;
            }
            else//前者后者字符串内容不相同
            {
                //前者和后者都是数字或者.组成的字符串
                if ([self isNumberString:firstVesion] && [self isNumberString:otherVersion]) {
                    NSArray *firstVersions = [self removeHeadBlankValue:[firstVesion componentsSeparatedByString:Version_PointSymbol]];
                    NSArray *otherVersions = [self removeHeadBlankValue:[otherVersion componentsSeparatedByString:Version_PointSymbol]];
                    
                    //前版本号段数比后者大
                    if (firstVersions.count > otherVersions.count) {
                        result = VersionCompareResultGreater;
                    }
                    else if (firstVersions.count < otherVersions.count)//前版本号段数比后者小
                    {
                        result = VersionCompareResultLess;;
                    }
                    else//前后版本号段数相等
                    {
                        //循环所有区段，从头部往尾部逐个比较
                        for (NSInteger index = 0; index < firstVersions.count; index++) {
                            NSInteger first = [firstVersions[index] integerValue];
                            NSInteger other = [otherVersions[index] integerValue];
                            if (first > other) {
                                result = VersionCompareResultGreater;
                                break;
                            }
                            else if (first < other)
                            {
                                result = VersionCompareResultLess;
                                break;
                            }
                            else
                            {
                                 if (index == firstVersions.count - 1)
                                 {
                                     result = VersionCompareResultEqual;
                                 }
                            }
                        }
                    }
                }
                else
                {
                    result = VersionCompareResultCompareFailure;
                }
            }
        }
    }
    
    return result;
}

/**
 判断字符串是否由数字或者.构成

 @param str 需判断的字符串
 @return 判断结果
 */
+ (BOOL)isNumberString:(NSString *)str
{
    //表示以数字或.开头，间接至少一个同样的字符，并以此字符结尾
    NSString *regularStr = @"^[0-9.]*$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", regularStr];
    return [predicate evaluateWithObject:str];
}

/**
 移除掉字符串数组头部值为空的数据

 @param stringArr 字符串数组
 @return 移除后的数组
 */
+ (NSArray *)removeHeadBlankValue:(NSArray<NSString *> *)stringArr
{
    NSMutableArray *result = [NSMutableArray arrayWithArray:stringArr];
    NSInteger intItem = 0;
    for (NSString *item in stringArr) {
        intItem = [item integerValue];
        if (intItem == 0) {
            [result removeObject:item];
        }
        else
        {
            break;
        }
    }
    
    return result;
}

/**
 字符串判空

 @param string 需判断的字符串
 @return 判断结果
 */
+ (BOOL)isBlankString:(NSString *)string
{
    if (string == nil || string == NULL)
        return YES;
    
    if ([string isKindOfClass:[NSNull class]])
        return YES;
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0)
        return YES;
    
    return NO;
}

@end
