//
//  Sort.m
//  SortProject
//
//  Created by 闫康 on 2017/2/20.
//  Copyright © 2017年 shianyunduan. All rights reserved.
//

#import "Sort.h"
#import "NSString+Password.h"

@implementation Sort

//***=================1.快速排序法=================***//
-(void)quickSortWithArray:(NSArray *)data{
    NSMutableArray *Data = [[NSMutableArray alloc] initWithArray:data];
    [self quickSortWithData:Data leftIndex:0 rightIndex:[data count]-1];
    NSLog(@"快速排序后的结果：%@",[Data description]);
}

- (void)quickSortWithData:(NSMutableArray *)data leftIndex:(NSInteger)leftIndex rightIndex:(NSInteger)rightIndex{
    if (leftIndex<rightIndex) {
        NSInteger i = leftIndex;
        NSInteger j = rightIndex+1;
        while (true) {
            while (i+1 < [data count] && [data objectAtIndex:++i]<[data objectAtIndex:leftIndex]) ;
            while (j-1 > -1 && [data objectAtIndex:--j] > [data objectAtIndex:leftIndex]) ;
            if (i>=j) {
                break;
            }
            [self swapWithData:data index1:i index2:j];
        }
        [self swapWithData:data index1:leftIndex index2:j];
        [self quickSortWithData:data leftIndex:leftIndex rightIndex:j-1];//左边
        [self quickSortWithData:data leftIndex:j+1 rightIndex:rightIndex];//右边
    }
    
    
}

//***=================2.冒泡排序法=================***//
-(void)bunbleSortWithArray:(NSArray *)data{
    NSMutableArray *Data = [[NSMutableArray alloc]initWithArray:data];
    for (int i=0; i<[Data count]-1; i++) {
        for (int j =0; j<[Data count]-1-i; j++) {
            if ([Data objectAtIndex:j] > [Data objectAtIndex:j+1]) {
                [self swapWithData:Data index1:j index2:j+1];
            }
        }
    }
    NSLog(@"冒泡排序后的结果：%@",[Data description]);
}

//***=================3.选择排序法=================***//
-(void)selectSortWithArray:(NSArray *)data{
    NSMutableArray *Data = [[NSMutableArray alloc]initWithArray:data];
    for (int i=0; i<[Data count]-1; i++) {
        int m =i;
        for (int j =i+1; j<[Data count]; j++) {
            if ([Data objectAtIndex:j] < [Data objectAtIndex:m]) {
                m = j;
            }
        }
        if (m != i) {
            [self swapWithData:Data index1:m index2:i];
        }
    }
    NSLog(@"选择排序后的结果：%@",[Data description]);
}

//***=================4.插入排序法=================***//
-(void)insertSortWithArray:(NSArray *)data{
    NSMutableArray *Data = [[NSMutableArray alloc]initWithArray:data];
    for (int i = 1; i < [Data count]; i++) {
        id tmp = [Data objectAtIndex:i];
        int j = i-1;
        while (j != -1 && [Data objectAtIndex:j] > tmp) {
            [Data replaceObjectAtIndex:j+1 withObject:[Data objectAtIndex:j]];
            j--;
        }
        [Data replaceObjectAtIndex:j+1 withObject:tmp];
    }
    NSLog(@"插入排序后的结果：%@",[Data description]);
    
}


//交换元素位置
-(void)swapWithData:(NSMutableArray *)Data index1:(NSInteger)index1 index2:(NSInteger)index2{
    NSNumber *tmp = [Data objectAtIndex:index1];
    [Data replaceObjectAtIndex:index1 withObject:[Data objectAtIndex:index2]];
    [Data replaceObjectAtIndex:index2 withObject:tmp];
}


//***=================数组去重=================***//
- (void)detelRepeatedElementFromArray:(NSArray *)array{
    // 利用字典键字唯一来去重
    NSMutableDictionary *MulDic = [NSMutableDictionary dictionary];
    for (id  number in array)
    {
        [MulDic setObject:number forKey:number];
    }
    NSLog(@"%@",[MulDic allValues]);
//    // 利用集合键字唯一来去重
//    NSSet *set = [NSSet setWithArray:array];
//    NSLog(@"%@",[set allObjects]);
    
}


- (NSString *)sortDic:(NSMutableDictionary *)dic{
    
    NSArray *allKeys = [dic allKeys];
    NSStringCompareOptions comparisonOptions =NSCaseInsensitiveSearch|NSNumericSearch|
    
    NSWidthInsensitiveSearch|NSForcedOrderingSearch;
    
    NSComparator sort = ^(NSString *obj1,NSString *obj2){
        
        NSRange range =NSMakeRange(0,obj1.length);
        return [obj1 compare:obj2 options:comparisonOptions range:range];
        
    };
    NSArray *resultArray2 = [allKeys sortedArrayUsingComparator:sort];
    NSString *sign = @"";
    for (NSString *key in resultArray2) {
        sign = [NSString stringWithFormat:@"%@&%@=%@",sign,key,dic[key]];
    }
    NSLog(@"%@",sign);
    return [[[sign substringFromIndex:1] md5]md5];
   
}





@end
