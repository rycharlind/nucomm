//
//  AskViewController.m
//  NuComm
//
//  Created by Ryan Lindbeck on 2/23/14.
//  Copyright (c) 2014 Inndevers LLC. All rights reserved.
//

#import "AskViewController.h"
#import "OptionsViewController.h"
#import "Constants.h"

@interface AskViewController ()
@property (nonatomic, strong) IBOutlet UILabel *labelState;
@property (nonatomic, strong) IBOutlet UILabel *labelBranch;
@property (nonatomic, strong) IBOutlet UILabel *labelDepartment;
@property (nonatomic, strong) IBOutlet UILabel *labelDepartmentSubCat;
@property (nonatomic, strong) IBOutlet UILabel *labelQuestionCat;
@property (nonatomic, strong) IBOutlet UITextField *textFieldClient;
@property (nonatomic, strong) IBOutlet UITextView *textViewMessage;

- (IBAction)send:(id)sender;
@end

@implementation AskViewController
@synthesize labelState, labelBranch, labelDepartment, labelDepartmentSubCat, labelQuestionCat, textFieldClient, textViewMessage;

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

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(optionSelected:) name:kOptionSelected object:nil];
}

- (IBAction)send:(id)sender {
    [self showSuccessAlert];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    OptionsViewController *optionsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"options"];
    switch (indexPath.row) {
        case 0:
            optionsViewController.optionType = STATES;
            break;
            
        case 1:
            optionsViewController.optionType = BRANCH;
            break;
            
        case 2:
            optionsViewController.optionType = DEPARTMENT;
            break;
            
        case 3:
            optionsViewController.optionType = DEPARTMENTSUBCAT;
            break;
            
        case 4:
            optionsViewController.optionType = QUESTIONCAT;
            break;
            
        default:
            break;
    }
    [self.navigationController pushViewController:optionsViewController animated:YES];
}

- (void) optionSelected:(NSNotification *)note {
    NSDictionary *userInfo = note.userInfo;
    NSNumber *type = (NSNumber*)[userInfo objectForKey:@"optionType"];
    switch ([type intValue]) {
        case STATES:
            self.labelState.text = [userInfo objectForKey:@"selection"];
            break;
            
        case BRANCH:
            self.labelBranch.text = [userInfo objectForKey:@"selection"];
            break;
            
        case DEPARTMENT:
            self.labelDepartment.text = [userInfo objectForKey:@"selection"];
            break;
            
        case DEPARTMENTSUBCAT:
            self.labelDepartmentSubCat.text = [userInfo objectForKey:@"selection"];
            break;
            
        case QUESTIONCAT:
            self.labelQuestionCat.text = [userInfo objectForKey:@"selection"];
            break;
            
        default:
            break;
    }
    
}

- (void) showSuccessAlert {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success!" message:@"Someone will respond to your question within 24 hours." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
