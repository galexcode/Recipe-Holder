//
//  Recipe.h
//  Recipe Holder
//
//  Created by Cody Callahan on 3/14/13.
//  Copyright (c) 2013 Callahan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Ingredient.h"

@interface Recipe : NSManagedObject

@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSString * instructions;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * category;

@property (nonatomic, retain) Ingredient * ingredient;

@end
