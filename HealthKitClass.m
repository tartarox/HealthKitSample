//
//  HealthKitClass.m
//  HealthKitSample
//
//  Created by Fabio Yudi Takahara on 15/05/15.
//  Copyright (c) 2015 Fabio Yudi Takahara. All rights reserved.
//

#import "HealthKitClass.h"

@implementation HealthKitClass

+ (BOOL)isHealthKitIsEnable {
    if(NSClassFromString(@"HKHealthStore") && [HKHealthStore isHealthDataAvailable]) return YES;
    return NO;
}

+ (void)setupHealthKit {
    //Verificar se Healthkit está disponível para uso
    
    //Autorização para o uso do Health Kit
    HKHealthStore *healthStore = [[HKHealthStore alloc] init];
    
    // Share body mass, height and body mass index
    NSSet *shareObjectTypes = [NSSet setWithObjects:
                               [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass],
                               [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeight],
                               [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMassIndex],
                               [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyFatPercentage],
                               [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCarbohydrates],
                               [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryProtein],
                               [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatSaturated],
                               [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatTotal],
                               [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFiber],
                               [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietarySugar],
                               [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietarySodium],
                               [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCalcium],
                               [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryIron],
                               [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned],
                               [HKSampleType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount],
                               nil];
    
    // Read date of birth, biological sex and step count
    NSSet *readObjectTypes  = [NSSet setWithObjects:
                               //[HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierDateOfBirth],
                               //[HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierBiologicalSex],
                               [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount],
                               [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierFlightsClimbed],
                               nil];
    
    // Request access
    [healthStore requestAuthorizationToShareTypes:shareObjectTypes readTypes:readObjectTypes completion:^(BOOL success, NSError *error) {
        if(success)         NSLog(@"Sucesso");
        else                NSLog(@"Fail");
    }];
}

//Adicionando Peso no HealthKit
+ (void) addWeight:(float)weight {
    
    HKUnit *poundUnit =  [HKUnit gramUnitWithMetricPrefix:HKMetricPrefixKilo]   ;
    HKQuantity *weightQuantity = [HKQuantity quantityWithUnit:poundUnit doubleValue:weight];
    
    HKQuantityType *weightType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass];
    NSDate *now = [NSDate date];
    
    HKQuantitySample *weightSample = [HKQuantitySample quantitySampleWithType:weightType quantity:weightQuantity startDate:now endDate:now];
    
    HKHealthStore *store = [[HKHealthStore alloc]init];
    
    [store saveObject:weightSample withCompletion:^(BOOL success, NSError *error) {

    }];
}

//Adicionando Altura no HealthKit

+ (void) addHeight:(float)height {
    
    HKUnit *poundUnit =  [HKUnit meterUnit];
    HKQuantity *heightQuantity = [HKQuantity quantityWithUnit:poundUnit doubleValue:height];
    
    HKQuantityType *heightType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeight];
    NSDate *now = [NSDate date];
    
    HKQuantitySample *weightSample = [HKQuantitySample quantitySampleWithType:heightType quantity:heightQuantity startDate:now endDate:now];
    
    HKHealthStore *store = [[HKHealthStore alloc]init];
    
    [store saveObject:weightSample withCompletion:^(BOOL success, NSError *error) {
        
    }];
}

+ (void) addIMC:(float)value {
    
    HKUnit *poundUnit =  [HKUnit countUnit];
    HKQuantity *quantity = [HKQuantity quantityWithUnit:poundUnit doubleValue:value];
    
    HKQuantityType *type = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMassIndex];
    NSDate *now = [NSDate date];
    
    HKQuantitySample *percentageSample = [HKQuantitySample quantitySampleWithType:type quantity:quantity startDate:now endDate:now];
    
    HKHealthStore *store = [[HKHealthStore alloc]init];
    
    [store saveObject:percentageSample withCompletion:^(BOOL success, NSError *error) {
        
    }];
}

+ (void) addBodyFatPercentage:(float)percentage {
    
    HKUnit *poundUnit =  [HKUnit percentUnit];
    HKQuantity *percentageQuantity = [HKQuantity quantityWithUnit:poundUnit doubleValue:percentage];
    
    HKQuantityType *percentageType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyFatPercentage];
    NSDate *now = [NSDate date];
    
    HKQuantitySample *percentageSample = [HKQuantitySample quantitySampleWithType:percentageType quantity:percentageQuantity startDate:now endDate:now];
    
    HKHealthStore *store = [[HKHealthStore alloc]init];
    
    [store saveObject:percentageSample withCompletion:^(BOOL success, NSError *error) {
        
    }];
}

+ (void)addAlimento:(id)alimento {
    
    HKUnit *poundUnit =  [HKUnit gramUnit];
    NSDate *now = [NSDate date];
    
    NSArray *quantityArray = @[[HKQuantity quantityWithUnit:poundUnit doubleValue:10],  //Carboidrato
                               [HKQuantity quantityWithUnit:poundUnit doubleValue:11],  //Proteínas
                               [HKQuantity quantityWithUnit:poundUnit doubleValue:12],  //Gordura saturada
                               [HKQuantity quantityWithUnit:poundUnit doubleValue:13],  //Gordura Total
                               [HKQuantity quantityWithUnit:poundUnit doubleValue:14],  //Fibra
                               [HKQuantity quantityWithUnit:poundUnit doubleValue:15],  //Açúcar
                               [HKQuantity quantityWithUnit:poundUnit doubleValue:16],  //Sódio
                               [HKQuantity quantityWithUnit:poundUnit doubleValue:17],  //Cálcio
                               [HKQuantity quantityWithUnit:poundUnit doubleValue:18]]; //Ferro
    
    NSArray *typeArray = @[[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCarbohydrates],
                           [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryProtein],
                           [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatSaturated],
                           [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatTotal],
                           [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFiber],
                           [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietarySugar],
                           [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietarySodium],
                           [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCalcium],
                           [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryIron]];
    
    //HKQuantityTypeIdentifierActiveEnergyBurned
    
    
    NSMutableArray *sampleArray = @[].mutableCopy;
    
    for (int i = 0; i < quantityArray.count; i++) {
        HKQuantitySample *percentageSample = [HKQuantitySample quantitySampleWithType:typeArray[i] quantity:quantityArray[i] startDate:now endDate:now];
        [sampleArray addObject:percentageSample];
    }
    
    
    
    HKHealthStore *store = [[HKHealthStore alloc]init];
    [store saveObjects:sampleArray withCompletion:^(BOOL success, NSError *error) {
        NSLog(@"Success?");
    }];
}

+ (void)addCalories:(float)calories {
    
    HKQuantity *percentageQuantity = [HKQuantity quantityWithUnit:[HKUnit kilocalorieUnit] doubleValue:calories];
    
    HKQuantityType *type = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned];
    NSDate *now = [NSDate date];
    
    HKQuantitySample *sample = [HKQuantitySample quantitySampleWithType:type quantity:percentageQuantity startDate:now endDate:now];
    
    HKHealthStore *store = [[HKHealthStore alloc]init];
    
    [store saveObject:sample withCompletion:^(BOOL success, NSError *error) {
        NSLog(@"success burn");
    }];
}

+ (void)getUsersSteps:(NSDate*)startDate end:(NSDate*)endDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *interval = [[NSDateComponents alloc] init];
    interval.day = 1;
    
    NSDateComponents *anchorComponents = [calendar components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear
                                                     fromDate:[NSDate date]];
    anchorComponents.hour = 0;
    NSDate *anchorDate = [calendar dateFromComponents:anchorComponents];
    HKQuantityType *quantityType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierFlightsClimbed];
    
    // Create the query
    HKStatisticsCollectionQuery *query = [[HKStatisticsCollectionQuery alloc]   initWithQuantityType:quantityType
                                                                                quantitySamplePredicate:nil
                                                                                options:HKStatisticsOptionCumulativeSum
                                                                                anchorDate:anchorDate
                                                                                intervalComponents:interval];
    
    // Set the results handler
    query.initialResultsHandler = ^(HKStatisticsCollectionQuery *query, HKStatisticsCollection *results, NSError *error) {
        if (error) {
            // Perform proper error handling here
            NSLog(@"*** An error occurred while calculating the statistics: %@ ***",error.localizedDescription);
        }
        
        [results enumerateStatisticsFromDate:startDate toDate:endDate withBlock:^(HKStatistics *result, BOOL *stop) {
            HKQuantity *quantity = result.sumQuantity;
            if (quantity) {
                NSDate *date = result.startDate;
                double value = [quantity doubleValueForUnit:[HKUnit countUnit]];
                NSLog(@"%@: %f", date, value);
            }
                                       
        }];
    };
    
    HKHealthStore *store = [[HKHealthStore alloc]init];
    [store executeQuery:query];
}

+ (void)getUserClimb:(NSDate*)startDate end:(NSDate*)endDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *interval = [[NSDateComponents alloc] init];
    interval.day = 7;
    
    // Set the anchor date to Monday at 3:00 a.m.
    NSDateComponents *anchorComponents =
    [calendar components:NSCalendarUnitDay | NSCalendarUnitMonth |
     NSCalendarUnitYear | NSCalendarUnitWeekday fromDate:[NSDate date]];
    
    NSInteger offset = (7 + anchorComponents.weekday - 2) % 7;
    anchorComponents.day -= offset;
    anchorComponents.hour = 3;
    
    NSDate *anchorDate = [calendar dateFromComponents:anchorComponents];
    
    HKQuantityType *quantityType =
    [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierFlightsClimbed];
    
    // Create the query
    HKStatisticsCollectionQuery *query =
    [[HKStatisticsCollectionQuery alloc]
     initWithQuantityType:quantityType
     quantitySamplePredicate:nil
     options:HKStatisticsOptionCumulativeSum
     anchorDate:anchorDate
     intervalComponents:interval];
    
    // Set the results handler
    query.initialResultsHandler =
    ^(HKStatisticsCollectionQuery *query, HKStatisticsCollection *results, NSError *error) {
        
        if (error) {
            // Perform proper error handling here
            NSLog(@"*** An error occurred while calculating the statistics: %@ ***",
                  error.localizedDescription);
            abort();
        }

        [results
         enumerateStatisticsFromDate:startDate
         toDate:endDate
         withBlock:^(HKStatistics *result, BOOL *stop) {
             
             HKQuantity *quantity = result.sumQuantity;
             if (quantity) {
                 double value = [quantity doubleValueForUnit:[HKUnit countUnit]];
                 
                 NSLog(@"sdfhdsuhfu %f", value);
                 
                 //[self plotData:value forDate:date];
             }
             
         }];
    };
    
    HKHealthStore *store = [[HKHealthStore alloc]init];
    [store executeQuery:query];
}

@end
