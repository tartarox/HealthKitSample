//
//  ViewController.m
//  HealthKitSample
//
//  Created by Fabio Yudi Takahara on 14/05/15.
//  Copyright (c) 2015 Fabio Yudi Takahara. All rights reserved.
//

#import "ViewController.h"
#import "HealthKitClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [HealthKitClass setupHealthKit];
    
    UIButton *testButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [testButton addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchDown];
    testButton.frame = CGRectMake(10, 30, 300, 30);
    testButton.backgroundColor = [UIColor redColor];
    [self.view addSubview:testButton];
    
}

- (void)buttonAction {
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond ) fromDate:[[NSDate alloc] init]];
    
    [components setHour:-[components hour]];
    [components setMinute:-[components minute]];
    [components setSecond:-[components second]];
    NSDate *today = [cal dateByAddingComponents:components toDate:[[NSDate alloc] init] options:0]; //This variable should now be pointing at a date object that is the start of today (midnight);
    
    [components setHour:-24];
    [components setMinute:0];
    [components setSecond:0];
    NSDate *yesterday = [cal dateByAddingComponents:components toDate: today options:0];
    
    //[HealthKitClass getUserClimb:yesterday end:[NSDate date]];
    
    [HealthKitClass getUsersSteps:yesterday end:[NSDate date]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
