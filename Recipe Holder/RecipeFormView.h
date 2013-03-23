//
//  RecipeFormView.h
//  Recipe Holder
//
//  Created by Cody Callahan on 3/14/13.
//  Copyright (c) 2013 Callahan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeFormView : UIView <UITextFieldDelegate, UITextViewDelegate, UIPickerViewDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@property BOOL isNewCategory;

@property (strong, nonatomic) UIViewController *parentView;
@property (strong, nonatomic) UITextField      *recipeTitle;
@property (strong, nonatomic) UITextField      *recipeCategory;
@property (strong, nonatomic) UITextField      *recipeDescription;
@property (strong, nonatomic) UITextView       *recipeInstructions;
@property (strong, nonatomic) NSMutableArray   *recipeIngredients;
@property (strong, nonatomic) UIButton         *addIngredientBtn;

@property (strong, nonatomic) UIPickerView     *categoryPicker;
@property (strong, nonatomic) UIToolbar        *toolbar;



-(void)addIngredient;

@end
