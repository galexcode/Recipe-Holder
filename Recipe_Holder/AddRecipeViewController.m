//
//  AddRecipeViewController.m
//  Recipe_Holder
//
//  Created by Cody Callahan on 4/15/13.
//  Copyright (c) 2013 Callahan. All rights reserved.
//

#import "AddRecipeViewController.h"

@interface AddRecipeViewController ()

@end

@implementation AddRecipeViewController

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
    // Do any additional setup after loading the view from its nib.
    //add navbar
    UINavigationBar *navbar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 45)];
    navbar.barStyle = UIBarStyleBlack;
    
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    UIBarButtonItem *saveBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save)];
    UINavigationItem *navBack = [[UINavigationItem alloc]initWithTitle:@"Add Recipe"];
    navBack.leftBarButtonItem = backBtn;
    navBack.rightBarButtonItem = saveBtn;
    [navbar pushNavigationItem:navBack animated:NO];
    
    [self.view addSubview:navbar];
}
- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)save {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
