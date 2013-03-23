//
//  ViewRecipeViewController.m
//  Recipe Holder
//
//  Created by Cody Callahan on 3/15/13.
//  Copyright (c) 2013 Callahan. All rights reserved.
//

#import "ViewRecipeViewController.h"

@interface ViewRecipeViewController ()

@end

@implementation ViewRecipeViewController

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
    self.title = _currentRecipe.title;
    if(_currentRecipe.category)
        _lbl1.text = [NSString stringWithFormat:@"Category: %@", _currentRecipe.category ];
    if(_currentRecipe.desc)
        _lbl2.text = [NSString stringWithFormat:@"Description: %@", _currentRecipe.desc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
