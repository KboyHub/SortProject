//
//  main.m
//  SortProject
//
//  Created by 闫康 on 2017/2/20.
//  Copyright © 2017年 shianyunduan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sort.h"
#define Size 20 //数组个数
#define Max 100 //随机数范围（0-100）

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *data = [[NSMutableArray alloc] initWithCapacity:Size];
        
        for (int i =0;i<Size;i++) {
            u_int32_t x = arc4random() % Max;//0~kMax
            NSNumber *num = [[NSNumber alloc] initWithInt:x];
            [data addObject:num];
        }
        NSLog(@"排序前的数据：%@",[data description]);
        Sort *sort = [[Sort alloc] init];
        [sort quickSortWithData:data leftIndex:0 rightIndex:data.count-1];//快速排序
//        NSLog(@"快速排序后的数据：%@",[data description]);
//        [sort bunbleSortWithArray:data];//冒泡排序
//        [sort selectSortWithArray:data];//选择排序
//        [sort insertSortWithArray:data];//插入排序
        
    }
    return 0;
}
