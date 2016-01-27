//
//  AddNewItemViewController.h
//  EveryDo2
//
//  Created by Benson Huynh on 2016-01-26.
//  Copyright © 2016 Benson Huynh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@protocol NewItemDelegate

- (void)newItemAdded:(ToDo *)newItem;

@end

@interface AddNewItemViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *priorityNumber;
@property (weak, nonatomic) IBOutlet UITextField *modalTitle;
@property (weak, nonatomic) IBOutlet UITextField *modalDescription;
@property (weak, nonatomic) id<NewItemDelegate> delegate;

@end
