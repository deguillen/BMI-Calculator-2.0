//
//  ViewController.h
//  BMI Calculator 2.0
//
//  Created by Daniela Guillen on 6/29/16.
//  Copyright © 2016 Daniela Guillen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *weightLabel;

@property (strong, nonatomic) IBOutlet UILabel *heightLabel;

@property (strong, nonatomic) IBOutlet UILabel *BMILabel;

@property (weak, nonatomic) IBOutlet UILabel *BMIResultLabel;

@property (weak, nonatomic) IBOutlet UITextField *weightBox;

@property (weak, nonatomic) IBOutlet UITextField *heightBox;

@property (weak, nonatomic) IBOutlet UIButton *Calc;

@property (weak, nonatomic) IBOutlet UILabel *ageLabel;

@property (weak, nonatomic) IBOutlet UITextField *ageBox;

@property (weak, nonatomic) IBOutlet UIPickerView *genderPick;


@property (weak, nonatomic) IBOutlet UILabel *weightChangeLabel;

@property (weak, nonatomic) IBOutlet UILabel *actualWeightChangeLabel;

@property (weak, nonatomic) IBOutlet UILabel *aWeek;

@property (weak, nonatomic) IBOutlet UILabel *BMRlabel;

@property (weak, nonatomic) IBOutlet UILabel *BMRResultLabel;
@property (strong, nonatomic) NSArray* genderArray;

@property (weak, nonatomic) IBOutlet UILabel *forLabel;

@property (weak, nonatomic) IBOutlet UILabel *actualWeeksLabel;

@property (weak, nonatomic) IBOutlet UILabel *weeksLabel;
@property (weak, nonatomic) IBOutlet UISwitch *isMetric;
@property (weak, nonatomic) IBOutlet UILabel *unitsLabel;

@end

