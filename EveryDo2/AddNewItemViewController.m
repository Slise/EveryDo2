//
//  AddNewItemViewController.m
//  EveryDo2
//
//  Created by Benson Huynh on 2016-01-26.
//  Copyright © 2016 Benson Huynh. All rights reserved.
//

#import "AddNewItemViewController.h"

@interface AddNewItemViewController ()

@end

@implementation AddNewItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createButtonPress:(id)sender {
    ToDo *newItem = [[ToDo alloc] initWithTitle:self.modalTitle.text descriptions:self.modalDescription.text priorityNumber:(int)self.priorityNumber.selectedSegmentIndex isCompletedIndicator:NO];
    [self.delegate newItemAdded:newItem];
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)cancelButtonPress:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
