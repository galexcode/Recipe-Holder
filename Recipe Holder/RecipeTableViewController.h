//
//  RecipeTableViewController.h
//  Recipe Holder
//
//  Created by Cody Callahan on 3/14/13.
//  Copyright (c) 2013 Callahan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "AddRecipeViewController.h"

@interface RecipeTableViewController : UITableViewController
<AddRecipeViewControllerDelegate, NSFetchedResultsControllerDelegate>

@property (nonatomic, retain) AppDelegate *theAppDelegate;
@property NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSIndexPath *selectedIndex;

- (IBAction)menuBtn:(id)sender;



@end
