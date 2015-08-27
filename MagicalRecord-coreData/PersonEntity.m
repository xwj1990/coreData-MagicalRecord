//
//  PersonEntity.m
//  
//
//  Created by baijiahulian on 15/8/25.
//
//

#import "PersonEntity.h"
#import "MagicalRecord.h"
#import "Person.h"
@implementation PersonEntity

@dynamic age;
@dynamic name;
@dynamic idNumber;

+ (NSArray *)returnAllData{

    NSMutableArray * arr = [NSMutableArray array];
    NSArray * entityArr = [PersonEntity MR_findAll];
    for (PersonEntity * entity in entityArr) {
        Person * person = [self returnPersonWithEntity:entity];
        [arr addObject:person];
        person = nil;
    }
    return [arr copy];
}

+ (NSArray *)sortingWithString:(NSString *)string isAscending:(BOOL)isAscend{
 
    return [PersonEntity MR_findAllSortedBy:@"age" ascending:isAscend];
}

+ (NSArray *)fineDataWithString:(NSString *)string withConditions:(id)conditions{
    NSMutableArray * arr = [NSMutableArray array];
    NSArray * entityArr = [PersonEntity MR_findByAttribute:string withValue:conditions];
    for (PersonEntity * entity in entityArr) {
        Person * person = [self returnPersonWithEntity:entity];
        [arr addObject:person];
        person = nil;
    }
    return [arr copy];
}

+(Person *)returnPersonWithEntity:(PersonEntity *)entity{
    Person * person = [[Person alloc] init];
    person.age = entity.age;
    person.name = entity.name;
    person.idNumber = entity.idNumber;
    return person;
}

+ (Person *)returnFirstData{
    return [self returnPersonWithEntity:[PersonEntity MR_findFirst]];
}

+ (void)addNewDataWith:(Person *)person{
    // MR_createEntity 创建实体
    PersonEntity * entity = [PersonEntity MR_createEntity];
    entity.age = person.age;
    entity.name = person.name;
    entity.idNumber = person.idNumber;
    //MR_defaultContext  指定创建的上下文中创建实体
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

+ (void)updateDataWith:(Person *)person withString:(NSString *)string withConditions:(id)conditions{
    NSArray * array = [PersonEntity fineDataWithString:string withConditions:conditions];
    PersonEntity * oldEntity = [array firstObject];
    oldEntity.age = person.age;
    oldEntity.name = person.name;
    oldEntity.idNumber = person.idNumber;
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

+ (void)deleteDataWith:(Person *)person{
    NSArray * array = [PersonEntity fineDataWithString:@"age" withConditions:person.age];
    PersonEntity * entity = [array firstObject];
    // 删除一个实体 MR_deleteEntity
    [entity MR_deleteEntity];
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}



@end
