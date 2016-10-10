//
//  main.m
//  CodeLineCount
//
//  Created by pan on 14-4-20.
//  Copyright (c) 2014年 pan. All rights reserved.
//

#import <Foundation/Foundation.h>

NSUInteger codeLineCount(NSString *path)
{
    int count = 0;
    
    // 获取文件管理者
    NSFileManager * mgr = [NSFileManager defaultManager];
    // 判断path是文件夹还是文件路径
    BOOL dir = NO;
    BOOL exist = [mgr fileExistsAtPath:path isDirectory:&dir];
    
    if (!exist) return 0;  //如果不存在，返回0
    
    /* 路径存在，继续执行 */
    if (dir) {
        //NSLog(@"是文件夹");
        
        // 获取当前文件夹下的所有内容（文件夹、文件）
        NSArray *arr = [mgr contentsOfDirectoryAtPath:path error:nil];
        
        // 遍历数组中的所有文件(文件夹、文件)
        for (NSString *filename in arr)
        {
            // 获取子文件/文件夹 全路径
            NSString *fullPath = [NSString stringWithFormat:@"%@/%@",path,filename];
            count += codeLineCount(fullPath);
        }
        return count;
    }
    else
    {//是文件
        // 过滤，判断文件的拓展名
        /*
            pathExtension 是获取文件后缀名
            lowercaseString 是转换成小写
         */
        NSString *extension = [[path pathExtension] lowercaseString];
        if (![extension isEqualToString:@"h"]
            && ![extension isEqualToString:@"m"]
            && ![extension isEqualToString:@"c"])
        {
            //文件后缀名不是.h .m .c
            return 0;
        }
        
        // 读取文件内容
        NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        
        //    NSLog(@"%@",content);
        
        // 将文件内容分割为每一行
        NSArray *array = [content componentsSeparatedByString:@"\n"];
        
        NSString *pathtxt = @"/Users/wupan/Documents/Xcode project/CodeLineCount/CodeLineCount/path.txt";
        // 读取文件内容
        NSString *pathtxtcontent = [NSString stringWithContentsOfFile:pathtxt encoding:NSUTF8StringEncoding error:nil];
//        NSLog(@"pathtxtcontent=%@",pathtxtcontent);
        NSString *pathStr = [pathtxtcontent stringByAppendingString:@"/"];
//        NSLog(@"pathStr=%@",pathStr);
        
        NSRange range = [path rangeOfString:pathStr];
        NSString *str = [path stringByReplacingCharactersInRange:range withString:@""];
        
        NSLog(@"%@ - %ld",str,array.count);
        
        return array.count;
    }
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSString *path = @"/Users/wupan/Documents/Xcode project/CodeLineCount/CodeLineCount/path.txt";
        // 读取文件内容
        NSString *pathcontent = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        
        //NSLog(@"%@",pathcontent);
        
        NSUInteger count = codeLineCount(pathcontent);
        
        NSLog(@"count=%ld",count);
        
//        NSString *str = @"zz,cc,vv";
//        NSArray *array = [str componentsSeparatedByString:@","];
//        for (NSString *line in array) {
//            NSLog(@"%@",line);
//        }
        
    }
    return 0;
}

