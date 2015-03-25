//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by Martyn Jacques on 25/03/2015.
//  Copyright (c) 2015 MartynJacques. All rights reserved.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation BNRReminderViewController

- (IBAction)addReminder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
}



@end;
