//
//  HealthKitClass.h
//  HealthKitSample
//
//  Created by Fabio Yudi Takahara on 15/05/15.
//  Copyright (c) 2015 Fabio Yudi Takahara. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <HealthKit/HealthKit.h>

@interface HealthKitClass : NSObject

+ (BOOL)isHealthKitIsEnable;
+ (void)setupHealthKit;

+ (void) addWeight:(float)weight;
+ (void) addHeight:(float)height;
+ (void) addIMC:(float)value;
+ (void) addBodyFatPercentage:(float)percentage;
+ (void) addAlimento:(id)alimento;
+ (void) addCalories:(float)calories;
+ (void) getUsersSteps:(NSDate*)startDate end:(NSDate*)endDate;
+ (void) getUserClimb:(NSDate*)startDate end:(NSDate*)endDate;

@end
