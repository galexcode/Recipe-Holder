//
//  MenuViewController.h
//  Recipe Holder
//
//  Created by Cody Callahan on 3/11/13.
//  Copyright (c) 2013 Callahan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface MenuViewController : UITableViewController<NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) AppDelegate *theAppDelegate;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

-(void)reloadData;

@end
