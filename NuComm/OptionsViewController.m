//
//  OptionsViewController.m
//  NuComm
//
//  Created by Ryan Lindbeck on 2/23/14.
//  Copyright (c) 2014 Inndevers LLC. All rights reserved.
//

#import "OptionsViewController.h"

@interface OptionsViewController ()
@property (nonatomic, strong) NSArray *options;

@end

@implementation OptionsViewController
@synthesize optionType, options;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpOptions];

}

- (void) setUpOptions {
    switch (optionType) {
        case STATES:
            self.options = [self states];
            break;
            
        case BRANCH:
            self.options = [self branches];
            break;
            
        case DEPARTMENT:
            self.options = [self departments];
            break;
            
        case DEPARTMENTSUBCAT:
            self.options = [self departmentSubCats];
            break;
            
        case QUESTIONCAT:
            self.options = [self questionCats];
            break;
            
        default:
            break;
    }
}

- (NSArray *) states {
    return [NSArray arrayWithObjects:@"Illiniois", @"Missouri", @"Arizona", nil];
}

- (NSArray *) branches {
    return [NSArray arrayWithObjects:@"Hazelwood", @"Earth City", @"Rocky Hill", nil];
}

- (NSArray *) departments {
    return [NSArray arrayWithObjects:@"Billing", @"DFC", nil];
}

- (NSArray *) departmentSubCats {
    return [NSArray arrayWithObjects:@"Medicare", @"Non-Medicare", nil];
}

- (NSArray *) questionCats {
    return [NSArray arrayWithObjects:@"Co-Pay", @"Status", @"Payer", @"Pricing", @"Customer Concern", nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.options.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self.options objectAtIndex:indexPath.row];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *selection = [self.options objectAtIndex:indexPath.row];
    NSLog(@"selection: %@", selection);
    NSLog(@"optionType: %d", optionType);
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:selection, @"selection", [NSNumber numberWithInt:self.optionType], @"optionType", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:kOptionSelected object:nil userInfo:userInfo];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
