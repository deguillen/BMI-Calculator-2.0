//
//  Person.h
//  BMI Calculator 2.0
//
//  Created by Daniela Guillen on 6/29/16.
//  Copyright © 2016 Daniela Guillen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (strong, nonatomic) NSNumber* weight;
@property (strong, nonatomic) NSNumber* height;
@property (strong, nonatomic) NSNumber* age;
@property (assign) bool sex;
@property NSNumber* weeks;

-(NSNumber*) bmi;

-(NSNumber*) bmr;
//hi
-(NSNumber*) changeAWeek;

+(Person*) personExists;


@end
