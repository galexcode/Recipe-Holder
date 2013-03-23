//
//  InitViewController.h
//  Recipe Holder
//
//  Created by Cody Callahan on 3/11/13.
//  Copyright (c) 2013 Callahan. All rights reserved.
//

#import "ECSlidingViewController.h"
#import "AppDelegate.h"

@interface InitViewController : ECSlidingViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) AppDelegate *theAppDelegate;

@end
