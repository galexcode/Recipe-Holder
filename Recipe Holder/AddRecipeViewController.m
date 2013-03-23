//
//  AddRecipeViewController.m
//  Recipe Holder
//
//  Created by Cody Callahan on 3/12/13.
//  Copyright (c) 2013 Callahan. All rights reserved.
//


#import "AddRecipeViewController.h"
#import "Ingredient.h"

@interface AddRecipeViewController ()
    
@end

@implementation AddRecipeViewController
@synthesize form = _form;
@synthesize currentRecipe = _currentRecipe;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _fetchedResultsController = [self fetchedResultsController];
    _form = [[RecipeFormView alloc]initWithFrame:CGRectMake(0, 45, self.view.frame.size.width, self.view.frame.size.height)];
    _form.fetchedResultsController = _fetchedResultsController;
    _form.parentView = self;
    [self.view addSubview:_form];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}


#pragma mark - IBActions

- (IBAction)backBtn:(id)sender {
    [_delegate AddRecipeViewControllerDidCancel:_currentRecipe];
}

- (IBAction)saveBtn:(id)sender {
    if(_form.recipeCategory.text && _form.recipeTitle.text){
        _currentRecipe.category     = _form.recipeCategory.text;
        _currentRecipe.title        = _form.recipeTitle.text;
        _currentRecipe.desc         = _form.recipeDescription.text;
        _currentRecipe.instructions = _form.recipeInstructions.text;
        [_delegate AddRecipeViewControllerDidSave:_currentRecipe];
    }
    else {
        NSLog(@"need title and category\nInsert alertview in saveBtn of addRecipeViewController.m");
    }
}


#pragma mark - Fetched Results Controller Section

//Create fetched results controller
-(NSFetchedResultsController*)fetchedResultsController
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Category"
                                              inManagedObjectContext:_managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name"
                                                                   ascending:YES];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    _fetchedResultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:fetchRequest managedObjectContext:_managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    _fetchedResultsController.delegate = self;
    return _fetchedResultsController;
}


@end
