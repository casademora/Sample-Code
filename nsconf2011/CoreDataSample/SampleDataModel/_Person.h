// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Person.h instead.

#import <CoreData/CoreData.h>







@interface PersonID : NSManagedObjectID {}
@end

@interface _Person : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PersonID*)objectID;



@property (nonatomic, retain) NSNumber *age;

@property short ageValue;
- (short)ageValue;
- (void)setAgeValue:(short)value_;

//- (BOOL)validateAge:(id*)value_ error:(NSError**)error_;



@property (nonatomic, retain) NSString *first_name;

//- (BOOL)validateFirst_name:(id*)value_ error:(NSError**)error_;



@property (nonatomic, retain) NSString *last_name;

//- (BOOL)validateLast_name:(id*)value_ error:(NSError**)error_;





@end

@interface _Person (CoreDataGeneratedAccessors)

@end

@interface _Person (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveAge;
- (void)setPrimitiveAge:(NSNumber*)value;

- (short)primitiveAgeValue;
- (void)setPrimitiveAgeValue:(short)value_;




- (NSString*)primitiveFirst_name;
- (void)setPrimitiveFirst_name:(NSString*)value;




- (NSString*)primitiveLast_name;
- (void)setPrimitiveLast_name:(NSString*)value;




@end
