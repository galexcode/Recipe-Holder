//
//  Recipe.h
//  Recipe_Holder
//
//  Created by Cody Callahan on 4/15/13.
//  Copyright (c) 2013 Callahan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Recipe : NSManagedObject

@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSString * instructions;
@property (nonatomic, retain) NSString * title;

@end
