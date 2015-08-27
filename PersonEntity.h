//
//  PersonEntity.h
//  
//
//  Created by baijiahulian on 15/8/25.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface PersonEntity : NSManagedObject

@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * idNumber;

@end
