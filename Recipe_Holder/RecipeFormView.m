//
//  RecipeFormView.m
//  Recipe Holder
//
//  Created by Cody Callahan on 3/14/13.
//  Copyright (c) 2013 Callahan. All rights reserved.
//

#ifdef UI_USER_INTERFACE_IDIOM
    #define IS_IPAD() (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#else
    #define IS_IPAD() (false)
#endif

#import <QuartzCore/QuartzCore.h>

#import "RecipeFormView.h"
#import "Recipe.h"

@implementation RecipeFormView {
    UIScrollView *scrollView;
    CGRect amountLocation;
    CGRect ingredientLocation;
    NSMutableArray *categories;
}

@synthesize parentView = _parentView;
@synthesize recipeTitle = _recipeTitle;
@synthesize recipeCategory = _recipeCategory;
@synthesize recipeDescription = _recipeDescription;
@synthesize recipeInstructions = _recipeInstructions;
@synthesize recipeIngredients = _recipeIngredients;
@synthesize addIngredientBtn = _addIngredientBtn;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self buildForm];
    }
    return self;
}

#pragma mark - Form Building Functions

-(void) buildForm
{
    categories = [self arrayFromFetchedResults];
    
    CGRect scrollframe            = CGRectMake(0,   0, self.frame.size.width, self.frame.size.height);
    scrollView = [[UIScrollView alloc]initWithFrame:scrollframe];
    
    CGRect recipeTitleRect        = CGRectMake(20,   5, self.frame.size.width - 40, 40);
    CGRect recipeCategoryRect     = CGRectMake(20,  50, self.frame.size.width - 40, 40);
    CGRect recipeDescRect         = CGRectMake(20,  95, self.frame.size.width - 40, 40);
    amountLocation                = CGRectMake(20, 140, 40, 40);
    ingredientLocation            = CGRectMake(65, 140, self.frame.size.width - 40 - 45, 40);
    CGRect addIngredientBtnRect   = CGRectMake(20, 185, self.frame.size.width - 40, 40);
    CGRect recipeInstructionsRect = CGRectMake(20, 230, self.frame.size.width - 40, 160);
    
    CGRect pickerRect  = CGRectMake(0, self.frame.size.height, 320, 236);
    CGRect toolbarRect = CGRectMake(0, self.frame.size.height, 320, 35);
    
    _recipeIngredients = [[NSMutableArray alloc]init];
    [_recipeIngredients addObject:[self makeTexfieldWithCGRect:amountLocation     withPlaceholder:@"2/3" usesNumbers:YES]];
    [_recipeIngredients addObject:[self makeTexfieldWithCGRect:ingredientLocation withPlaceholder:@"Ingredient" usesNumbers:NO]];
    
    _addIngredientBtn   = [self makeButtonWithCGRect:addIngredientBtnRect];
    _recipeTitle        = [self makeTexfieldWithCGRect:recipeTitleRect withPlaceholder:@"Recipe Title" usesNumbers:NO];
    _recipeCategory     = [self makeTexfieldWithCGRect:recipeCategoryRect withPlaceholder:@"Category" usesNumbers:NO];
    _recipeDescription  = [self makeTexfieldWithCGRect:recipeDescRect withPlaceholder:@"Short Description of Recipe" usesNumbers:NO];
    _recipeInstructions = [self makeTextViewWithCGRect:recipeInstructionsRect withPlaceholder:@"Recipe Instructions"];
    
    scrollView.contentSize = CGSizeMake(self.frame.size.width, _recipeInstructions.frame.size.height + _recipeInstructions.frame.origin.y);
    [self addSubview:scrollView];
    
    //ui toolbar on top of picker
    _toolbar = [[UIToolbar alloc] initWithFrame:toolbarRect];
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(slidePickerDown)];
    NSMutableArray *buttons = [NSMutableArray arrayWithObjects: doneBtn, nil];
    [_toolbar setItems:buttons animated:YES];
    _toolbar.barStyle = UIBarStyleBlackOpaque;
    
    [self addSubview:_toolbar];
    
    //picker view
    _categoryPicker = [[UIPickerView alloc] initWithFrame:pickerRect];
    _categoryPicker.delegate = self;
    _categoryPicker.showsSelectionIndicator = YES;
    _recipeCategory.inputView = _categoryPicker;
}

#pragma mark - Button Click

-(void)addIngredient
{
    _addIngredientBtn.frame   = CGRectMake(_addIngredientBtn.frame.origin.x,     _addIngredientBtn.frame.origin.y + 45,
                                           _addIngredientBtn.frame.size.width,   _addIngredientBtn.frame.size.height);
    _recipeInstructions.frame = CGRectMake(_recipeInstructions.frame.origin.x,   _recipeInstructions.frame.origin.y + 45,
                                           _recipeInstructions.frame.size.width, _recipeInstructions.frame.size.height);
    
    amountLocation            = CGRectMake(amountLocation.origin.x,              amountLocation.origin.y + 45,
                                           amountLocation.size.width,            amountLocation.size.height);
    ingredientLocation        = CGRectMake(ingredientLocation.origin.x,          ingredientLocation.origin.y + 45,
                                           ingredientLocation.size.width,        ingredientLocation.size.height);
    
    [_recipeIngredients addObject:[self makeTexfieldWithCGRect:amountLocation     withPlaceholder:@"2/3" usesNumbers:YES]];
    [_recipeIngredients addObject:[self makeTexfieldWithCGRect:ingredientLocation withPlaceholder:@"Ingredient" usesNumbers:NO]];
    
    [scrollView setContentSize:(CGSizeMake(scrollView.frame.size.width, (float)(_recipeInstructions.frame.size.height + _recipeInstructions.frame.origin.y + 75)))];
}


#pragma mark - Text Field Delegate Methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [scrollView setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - 226 - 40)];
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    [scrollView setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}


#pragma mark - Text View Delegate Methods
-(void)textViewDidBeginEditing:(UITextView *)textView {
    [scrollView setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - 226 - 40)];
    [scrollView scrollRectToVisible:_recipeInstructions.frame  animated:YES];
}



#pragma mark - Creation Methods

-(UIButton*)makeButtonWithCGRect:(CGRect)rect
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(addIngredient)
     forControlEvents:UIControlEventTouchDown];
    [button setTitle:@"Add Ingredient" forState:UIControlStateNormal];
    button.frame = rect;
    [scrollView addSubview:button];
    return button;
}

-(UITextField*)makeTexfieldWithCGRect:(CGRect)cgrect withPlaceholder:(NSString*)placeholder usesNumbers:(BOOL)numberKeyboard
{
    UITextField* textField = [[UITextField alloc] initWithFrame:cgrect];
    textField.borderStyle = UITextBorderStyleBezel;
    textField.placeholder = placeholder;
    textField.returnKeyType = UIReturnKeyDone;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.delegate = self;
    if(numberKeyboard)
        textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    [scrollView addSubview:textField];
    return textField;
}

-(UITextView*)makeTextViewWithCGRect:(CGRect)cgrect withPlaceholder:(NSString*)placeholder
{
    UITextView *textView = [[UITextView alloc]initWithFrame:cgrect];
    textView.text = placeholder;
    textView.layer.borderColor = [UIColor grayColor].CGColor;
    textView.layer.borderWidth = 2.0f;
    textView.contentInset = UIEdgeInsetsMake(5, 5, 5, 5);
    textView.delegate = self;
    [scrollView addSubview:textView];
    return textView;
}

#pragma mark - Picker View Delegate Methods
// Handle the selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    if([[categories objectAtIndex:row] isEqualToString:@"New Category"]){
        _recipeCategory.inputView = _recipeTitle.inputView;
        _recipeCategory.text = @"";
        _isNewCategory = YES;
        [_recipeTitle becomeFirstResponder];
        [_recipeCategory becomeFirstResponder];
    }
    else {
        _isNewCategory = NO;
        _recipeCategory.text = [categories objectAtIndex:row];
    }
}

// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [categories count];
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// tell the picker the title for a given component
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [categories objectAtIndex:row];
}

// tell the picker the width of each row for a given component
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return 300;
}


#pragma mark - Custom Functions

-(NSMutableArray*)arrayFromFetchedResults
{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    [arr addObject:@" "];
    [arr addObject:@"New Category"];
    for(Recipe *recipe in _fetchedResultsController.fetchedObjects){
        [arr addObject:recipe.category];
    }
    return arr;
}

@end
