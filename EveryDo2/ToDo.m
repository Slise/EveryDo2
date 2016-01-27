//
//  ToDo.m
//  EveryDo2
//
//  Created by Benson Huynh on 2016-01-26.
//  Copyright © 2016 Benson Huynh. All rights reserved.
//

#import "ToDo.h"

@implementation ToDo

-(instancetype)initWithTitle: (NSString *) title descriptions: (NSString *)descriptions priorityNumber: (int) priorityNumber isCompletedIndicator: (BOOL) isCompletedIndicator {
    self = [super init];
    if (self) {
        _title = title;
        _descriptions = descriptions;
        _priorityNumber = priorityNumber;
        _isCompletedIndicator = isCompletedIndicator;
    }
    return self;
}

@end
