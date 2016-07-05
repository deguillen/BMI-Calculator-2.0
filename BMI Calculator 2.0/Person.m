//
//  Person.m
//  BMI Calculator 2.0
//
//  Created by Daniela Guillen on 6/29/16.
//  Copyright © 2016 Daniela Guillen. All rights reserved.
//

#import "Person.h"

@implementation Person

static Person* secretPerson;

@synthesize height;
@synthesize weight;
@synthesize age;
@synthesize sex;
@synthesize weeks;

-(NSNumber*) bmi {
    return [NSNumber numberWithDouble:[self.weight doubleValue]/pow([self.height doubleValue], 2)];
    //Putting an @ turns a primitive type into a NSSNumber type
}

-(NSNumber*) bmr {
        if(![self sex]) { //((13.397m/1kg) + (4.799h/1cm) - (5.677a/1year) + 88.362)
            return [NSNumber numberWithDouble:((13.397*[self.weight doubleValue]) + (4.799*100*[self.height doubleValue]) - 5.677*[self.age doubleValue] + 88.362)];
            
        }
        else if ([self sex]) { //((9.247m/1kg) + (3.098h/1cm) - (4.330a/1year) + 447.593
            return [NSNumber numberWithDouble:((9.247*[self.weight doubleValue]) + (3.098*100*[self.height doubleValue]) - 4.33*[self.age doubleValue] + 447.593)];
            
        }
        else {
            return nil;
        }
        
    }

-(NSNumber*) changeAWeek {
    if([[self bmi] doubleValue] < 18.5) {
        double weightToGain = 18.5*[[self height] doubleValue]*[[self height] doubleValue]-[[self weight] doubleValue];
        int weeksone;
        for( weeksone = 1; weightToGain > 0.45; weeksone++) {
            weightToGain = weightToGain/weeksone;
        }
        self.weeks = [NSNumber numberWithInt:weeksone];
        return [NSNumber numberWithDouble:weightToGain*(500/0.45)]; //returns the amount of calories a day
        
    }
    if([[self bmi] doubleValue] >=25) {
        double weightToLose = 24.9*[[self height] doubleValue]*[[self height] doubleValue]-[[self weight] doubleValue];
        int weeksone;
        
        for( weeksone  = 1; weightToLose < (-0.45); weeksone++) {
            weightToLose = weightToLose/weeksone;
        }
        self.weeks = [NSNumber numberWithInt:weeksone];
        return [NSNumber numberWithDouble:(-1)*weightToLose*(500/0.45)]; //returns the amount of calories a day
    }
    else {
        self.weeks = [NSNumber numberWithInt:0];
        return [NSNumber numberWithDouble:0]; //returns the amount of calories a day 
    }
}

+(Person*) personExists {
    if(secretPerson == nil) {
        secretPerson = [[Person alloc] init];
    }
    return secretPerson;
    
}



@end
