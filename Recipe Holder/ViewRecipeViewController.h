//
//  ViewRecipeViewController.h
//  Recipe Holder
//
//  Created by Cody Callahan on 3/15/13.
//  Copyright (c) 2013 Callahan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"

@interface ViewRecipeViewController : UIViewController

@property (strong, nonatomic) Recipe *currentRecipe;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) IBOutlet UILabel *lbl1;
@property (strong, nonatomic) IBOutlet UILabel *lbl2;
@property (strong, nonatomic) IBOutlet UILabel *lbl3;
@property (strong, nonatomic) IBOutlet UILabel *lbl4;

@end
