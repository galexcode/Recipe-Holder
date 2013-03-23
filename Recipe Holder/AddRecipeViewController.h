//
//  AddRecipeViewController.h
//  Recipe Holder
//
//  Created by Cody Callahan on 3/12/13.
//  Copyright (c) 2013 Callahan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"
#import "RecipeFormView.h"

@protocol AddRecipeViewControllerDelegate;

@interface AddRecipeViewController : UIViewController
<UITextFieldDelegate, UIPickerViewDelegate, NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@property (nonatomic, strong) Recipe *currentRecipe;
@property (nonatomic, strong) RecipeFormView *form;
@property (weak, nonatomic) id <AddRecipeViewControllerDelegate> delegate;

- (IBAction)backBtn:(id)sender;
- (IBAction)saveBtn:(id)sender;


@end

@protocol AddRecipeViewControllerDelegate
-(void)AddRecipeViewControllerDidSave:(Recipe*)recipeToSave;
-(void)AddRecipeViewControllerDidCancel:(Recipe*)recipeToDelete;
@end

