//
//  ViewController.m
//  TestAB
//
//  Created by keep on 16/3/6.
//  Copyright © 2016年 keep. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*
     question: 现有两个无序数组 a 和 b，b 中的元素在a中都存在， 请设计一个方案，找出在a中，但不在b中的所有元素。请考虑降低时间复杂度。
     时间复杂度可被称为是渐近的，它考察当输入值大小趋近无穷时的情况。
     
     */
    /* 方法1 利用系统的谓词NSPredicate来做筛选
     注：NSPredicate所属Cocoa框架，在密码、用户名等正则判断中经常用到。
     类似于SQL语句
     NOT 不是
     SELF 代表字符串本身
     IN 范围运算符
     那么NOT (SELF IN %@) 意思就是：不是这里所指定的字符串的值
 */
    
    NSMutableArray *aArray = [[NSMutableArray alloc] initWithObjects:@"0",@"8",@"9",@"2",@"1",@"5",nil];
    
    NSArray *bArray =  [[NSArray alloc] initWithObjects:@"2",@"0",@"1",@"5",nil];
//
    NSPredicate * filterPredicate = [NSPredicate predicateWithFormat:@"NOT (SELF IN %@)",bArray];
    //过滤数组
    NSArray * reslutFilteredArray = [aArray filteredArrayUsingPredicate:filterPredicate];
    
    NSLog(@"Reslut Filtered Array = %@",reslutFilteredArray);
    
    
    //方法2 通过遍历(1)
//    NSMutableArray *reslutArr = [[NSMutableArray alloc] initWithArray:aArray];
//    for(int i = 0 ; i < aArray.count; i++)
//    {
//        NSString *aStr = aArray[i];
//        NSLog(@"aStr:%@",aStr);
//        for (int j = 0; j< bArray.count; j++) {
//            NSString *bStr = bArray[j];
//            if([aStr isEqualToString:bStr])
//            {
//                NSLog(@"%@",bStr);
//                [reslutArr removeObject:aStr];
//                break;
//            }
//        }
//    }
//    NSLog(@"reslutArr:%@",reslutArr);
//
//    //遍历(2) 对1的优化.   从后往前遍历数组，然后匹配删除。使用containsObject方法的场景很常见,例如:判断某一个元素(对象)是否存在数组中。
//    int i = (int)[aArray count]-1;
//    for(;i >= 0;i --){
//        //containsObject 判断元素是否存在于数组中(根据两者的内存地址判断，相同：YES  不同：NO）
//        if([bArray containsObject:[aArray objectAtIndex:i]]) {
//            [aArray removeObjectAtIndex:i];
//        }
//    }
//    NSLog(@"Data Array = %@",aArray);
//
//    /* 遍历(3) 通过字典key 来进行对另一个数组的remove
//     时间复杂度为n，一重For循环B数组 考虑b数组比a数组大，换成循环a数组 先将a数组转换成字典，所有元素作为Key  然后遍历B数组，B.元素作为Key到a字典去取值 这样时间复杂度为2n 我说的是纯算法，与具体编程语言无关
//     */
//    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
//    for (int i = 0 ;i< aArray.count ; i ++)
//    {
//        NSString *aKey = aArray[i];
//        [dic setValue:@"1" forKey:aKey];
//    }
//    NSLog(@"dic:%@",dic);
//    for (int j = 0; j < bArray.count; j++) {
//        
//        NSString *bKey =  bArray[j];
//       [dic removeObjectForKey:bKey];
//        NSLog(@"dic.allKeys:%@",dic.allKeys);
//    
//    }
    
    //思考比较这几种的 时间复杂度？

    NSDate* tmpStartData = [NSDate date];
//You code here...
    double deltaTime = [[NSDate date] timeIntervalSinceDate:tmpStartData];
    NSLog(@">>>>>>>>>>cost time = %f", deltaTime);



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
