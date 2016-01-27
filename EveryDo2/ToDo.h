//
//  ToDo.h
//  EveryDo2
//
//  Created by Benson Huynh on 2016-01-26.
//  Copyright © 2016 Benson Huynh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *descriptions;
@property (nonatomic, assign) int priorityNumber;
@property (nonatomic, assign) BOOL isCompletedIndicator;

-(instancetype)initWithTitle: (NSString *) title descriptions: (NSString *)descriptions priorityNumber: (int) priorityNumber isCompletedIndicator: (BOOL) isCompletedIndicator;

@end
