//
//  PersonEntity.h
//  
//
//  Created by baijiahulian on 15/8/25.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Person;
@interface PersonEntity : NSManagedObject

@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * idNumber;

//返回数据库中的所有内容
+ (NSArray *)returnAllData;

//根据某个字段进行排序
+ (NSArray *)sortingWithString:(NSString *)string isAscending:(BOOL)isAscend;

//查找数据库中符合条件的所有数据
+ (NSArray *)fineDataWithString:(NSString *)string withConditions:(id)conditions;

//返回数据库的第一条数据
+ (Person *)returnFirstData;

//增加一条数据
+ (void)addNewDataWith:(Person *)person;

//更新一条数据
+ (void)updateDataWith:(Person *)person withString:(NSString *)string withConditions:(id)conditions;

//删除一条数据
+ (void)deleteDataWith:(Person *)person;

@end
