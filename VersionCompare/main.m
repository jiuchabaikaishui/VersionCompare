//
//  main.m
//  XiaoNiangaoTest
//
//  Created by 綦 on 17/4/12.
//  Copyright © 2017年 PowesunHolding. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VersionCompare.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *dataArr = @[
                            @{@"firstVesion": @"1.11.1", @"otherVesion": @"00.00.11.1.111"},
                            @{@"firstVesion": @"00.0.23.454.434", @"otherVesion": @"00.00.22.1.32"},
                            @{@"firstVesion": @"sdhf.i8we", @"otherVesion": @"00.00.11.1.111"},
                            @{@"firstVesion": @"00.1.1", @"otherVesion": @"00.01.1"}
                            ];
        
        for (NSDictionary *versionDic in dataArr) {
            NSString *version1 = versionDic[@"firstVesion"];
            NSString *version2 = versionDic[@"otherVesion"];
            switch ([VersionCompare versionCompare:version1 ortherVersion:version2]) {
                case VersionCompareResultGreater:
                    NSLog(@"版本%@大于版本%@", version1, version2);
                    break;
                case VersionCompareResultLess:
                    NSLog(@"版本%@小于于版本%@", version1, version2);
                    break;
                case VersionCompareResultEqual:
                    NSLog(@"版本%@等于版本%@", version1, version2);
                    break;
                    
                default:
                    NSLog(@"版本%@与版本%@比较失败", version1, version2);
                    break;
            }
        }
    }
    return 0;
}
