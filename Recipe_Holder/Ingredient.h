//
//  Ingredient.h
//  Recipe_Holder
//
//  Created by Cody Callahan on 4/15/13.
//  Copyright (c) 2013 Callahan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Ingredient : NSManagedObject

@property (nonatomic, retain) NSString * amount;
@property (nonatomic, retain) NSString * name;

@end
