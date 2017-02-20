//
//  Sort.h
//  SortProject
//
//  Created by 闫康 on 2017/2/20.
//  Copyright © 2017年 shianyunduan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sort : NSObject

//***=================1.快速排序法=================***//
-(void)quickSortWithArray:(NSArray *)data;//直接传数组
- (void)quickSortWithData:(NSMutableArray *)data leftIndex:(NSInteger)leftIndex rightIndex:(NSInteger)rightIndex;//传数组 初始基准点 初始比较点

//***=================2.冒泡排序法=================***//
-(void)bunbleSortWithArray:(NSArray *)data;


//***=================3.选择排序法=================***//
-(void)selectSortWithArray:(NSArray *)data;


//***=================4.插入排序法=================***//
-(void)insertSortWithArray:(NSArray *)data;


@end
