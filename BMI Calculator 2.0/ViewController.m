//
//  ViewController.m
//  BMI Calculator 2.0
//
//  Created by Daniela Guillen on 6/29/16.
//  Copyright © 2016 Daniela Guillen. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController
static bool sexSelected = NO;
static bool isImperial = YES; //NO = metric

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 3;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.genderArray = [[NSArray alloc] initWithObjects:  @"select sex", @"male", @"female", nil];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)toggleSwitch:(id)sender {
    isImperial = self.isMetric.on;
    if(self.isMetric.on) {
        self.weightBox.text = @"pounds";
        self.heightBox.text = @"inches";
    }
    else {
        self.weightBox.text = @"kg";
        self.heightBox.text = @"meters";

    }
}

- (IBAction)weightEditingEnd:(id)sender {
    
    
    
    NSCharacterSet* numbers = [NSCharacterSet characterSetWithCharactersInString: @"0123456789."];
    numbers=[numbers invertedSet];
    NSRange range = [self.weightBox.text rangeOfCharacterFromSet:(numbers) ];
    if(range.location != NSNotFound) {
        [self.weightBox setText: @""];
    }
    int deci = 0;
    for (int count =1; count <= ([self.weightBox.text length] ); count++) {
        if([self.weightBox.text characterAtIndex:count-1] == '.') {
            deci++;
            
        }
        
    }
    if(deci > 1) {
        [self.weightBox setText: @""];
    }
    
   
    
}

- (IBAction)weightEditingBegin:(id)sender {
    if([self.weightBox.text isEqualToString:@"kg"] || [self.weightBox.text isEqualToString:@"pounds"]) {
        [self.weightBox setText:@""];
    }
}


- (IBAction)heightEditingEnd:(id)sender {
    
    
    NSCharacterSet* numbers = [NSCharacterSet characterSetWithCharactersInString: @"0123456789."];
    numbers=[numbers invertedSet];
    NSRange range = [self.heightBox.text rangeOfCharacterFromSet:(numbers) ];
    if(range.location != NSNotFound) {
        [self.heightBox setText: @""];
    }
    int deci = 0;
    for (int count =1; count <= ([self.heightBox.text length]); count++) {
        if([self.heightBox.text characterAtIndex:count-1] == '.') {
            deci++;
            
        }
        
    }
    if(deci > 1) {
        [self.heightBox setText: @""];
    }
    
}

- (IBAction)heightEditingBegin:(id)sender {
    if([self.heightBox.text isEqualToString:@"meters"] || [self.heightBox.text isEqualToString:@"inches"]) {
        [self.heightBox setText:@""];
    }
}


- (IBAction)ageEditingEnd:(id)sender {
    NSCharacterSet* numbers = [NSCharacterSet characterSetWithCharactersInString: @"0123456789"];
    numbers=[numbers invertedSet];
    NSRange range = [self.ageBox.text rangeOfCharacterFromSet:(numbers) ];
    if(range.location != NSNotFound) {
        [self.ageBox setText: @""];
    }
}
- (IBAction)ageEditingBegin:(id)sender {
    if([self.ageBox.text isEqualToString:@"years"]) {
        [self.ageBox setText:@""];
    }
}



- (IBAction)buttonPressed:(id)sender {
    
    if([self.weightBox.text isEqualToString: @""] || [self.heightBox.text isEqualToString: @""]) {
        NSLog(@"Cannot Calculate");
        
    }
    else {
        if(isImperial) {
            [[Person personExists] setHeight:[NSNumber numberWithDouble:[[self.heightBox text] doubleValue]*0.0254]];
            [[Person personExists]setWeight:[NSNumber numberWithDouble:[[self.weightBox text] doubleValue]*0.45359237]];
        }
        else {
    [[Person personExists] setHeight:[NSNumber numberWithDouble:[[self.heightBox text] doubleValue]]];
    [[Person personExists]setWeight:[NSNumber numberWithDouble:[[self.weightBox text] doubleValue]]]; }
        
        [self.actualWeightChangeLabel setText: [NSString stringWithFormat:@"%0.2f", [[[Person personExists] changeAWeek] doubleValue]]];
        
        
        
        if ([[[Person personExists] bmi] doubleValue] < 18.5) {
            [self.aWeek setText: @"more kcals a day"];
        }
        else if (([[[Person personExists] bmi] doubleValue] >= 25)) {
            [self.aWeek setText: @"less kcals a day"];
            
        }
        else {
            [self.aWeek setText: @"more kcals a day"];
        }
        
        
        [self.actualWeeksLabel setText: [[[Person personExists] weeks] stringValue]]; 
    [self.BMIResultLabel setText: [NSString stringWithFormat:@"%0.2f", [[[Person personExists] bmi] doubleValue]]];
    
    }
    if([self.ageBox.text isEqualToString: @""] || [self.weightBox.text isEqualToString: @""] || [self.heightBox.text isEqualToString: @""] || !sexSelected) {
        NSLog(@"Cannot Calculate bmr");
       
    }
    else {
        
        if(isImperial) {
        [[Person personExists] setHeight:[NSNumber numberWithDouble:[[self.heightBox text] doubleValue]*0.0254]];
        [[Person personExists]setWeight:[NSNumber numberWithDouble:[[self.weightBox text] doubleValue]*0.45359237]];
            [[Person personExists]setAge:[NSNumber numberWithDouble:[[self.ageBox text] doubleValue]]]; }
        else {
            [[Person personExists] setHeight:[NSNumber numberWithDouble:[[self.heightBox text] doubleValue]]];
            [[Person personExists]setWeight:[NSNumber numberWithDouble:[[self.weightBox text] doubleValue]]];
            [[Person personExists]setAge:[NSNumber numberWithDouble:[[self.ageBox text] doubleValue]]];
        }
        
        [self.BMRResultLabel setText:[NSString stringWithFormat:@"%0.2f", [[[Person personExists] bmr] doubleValue]]];
    }
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@ "touch");
    
    if([self.weightBox isFirstResponder]) {
        [self.weightBox resignFirstResponder];
    }
    if([self.heightBox isFirstResponder]) {
        [self.heightBox resignFirstResponder];
    }
    if([self.ageBox isFirstResponder]) {
        [self.ageBox resignFirstResponder];
    }
}
    // [self.view endEditing:YES];

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component __TVOS_PROHIBITED {
        switch(row)
    {
        case 0: {
            NSLog(@"not selected");
            sexSelected = NO;
            break;
        }
        case 1: {
            NSLog(@"male");
            [[Person personExists] setSex: NO];
            sexSelected = YES;
            break;
        }
        case 2: {
            NSLog(@"female");
            [[Person personExists] setSex: YES];
            sexSelected = YES;
            break;
                
            }
       
    }
    
}
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component __TVOS_PROHIBITED {
    return [self.genderArray objectAtIndex:(row)];
}




@end
