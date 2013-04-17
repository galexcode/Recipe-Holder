//
//  AddRecipeViewController.h
//  Recipe_Holder
//
//  Created by Cody Callahan on 4/16/13.
//  Copyright (c) 2013 Callahan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddRecipeViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (strong, nonatomic) NSMutableArray *form;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)backBtn:(id)sender;
- (IBAction)saveBtn:(id)sender;

@end
