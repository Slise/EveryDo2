//
//  MasterViewController.m
//  EveryDo2
//
//  Created by Benson Huynh on 2016-01-26.
//  Copyright © 2016 Benson Huynh. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDo.h"
#import "ToDoTableViewCell.h"
#import "AddNewItemViewController.h"

@interface MasterViewController () <NewItemDelegate>

@property NSMutableArray *toDoList;

@end


@implementation MasterViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ToDo *list1 = [[ToDo alloc] initWithTitle:@"Doctor Appt" descriptions:@"check up" priorityNumber:1 isCompletedIndicator: YES];
    ToDo *list2 = [[ToDo alloc] initWithTitle:@"Groceries" descriptions:@"weekly groceries" priorityNumber:2 isCompletedIndicator:NO];
    ToDo *list3 = [[ToDo alloc] initWithTitle:@"Clean Computer" descriptions:@"yearly electronic cleaning" priorityNumber:3 isCompletedIndicator:NO];
    
    self.toDoList = [[NSMutableArray alloc] init];
    [self.toDoList addObjectsFromArray:@[list1, list2, list3]];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    // make the view controller
    AddNewItemViewController *newVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SetToDo"];
    [newVC setDelegate:self];
    [self presentViewController:newVC animated:YES completion:NULL];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ToDo *object = self.toDoList[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.toDoList count];
}

- (void)newItemAdded:(ToDo *)newItem {
    [self.toDoList addObject:newItem];
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ToDoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    ToDo *object = self.toDoList[indexPath.row];
    cell.descriptionLabel.text = [object descriptions];
    cell.titleLabel.text = [object title];
    cell.priorityLevel.text = ([NSString stringWithFormat:@"%d", [object priorityNumber]]);
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.toDoList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
