//
//  MessageViewController.h
//  NuComm
//
//  Created by Ryan Lindbeck on 2/23/14.
//  Copyright (c) 2014 Inndevers LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSMessagesViewController.h"

@interface MessageViewController : JSMessagesViewController <JSMessagesViewDataSource, JSMessagesViewDelegate>

@property (strong, nonatomic) NSMutableArray *messages;
@property (strong, nonatomic) NSDictionary *avatars;

@end
