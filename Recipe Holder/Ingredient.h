//
//  Ingredient.h
//  Recipe Holder
//
//  Created by Cody Callahan on 3/14/13.
//  Copyright (c) 2013 Callahan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Recipe;

@interface Ingredient : NSManagedObject

@property (nonatomic, retain) NSString * amount;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Recipe *toRecipe;

@end
