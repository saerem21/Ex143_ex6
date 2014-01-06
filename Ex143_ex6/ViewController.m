//
//  ViewController.m
//  Ex143_ex6
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController
{
    UIActionSheet *sheet;
    UIDatePicker *picker;
    NSDateFormatter *formatter;
    float height;
}
- (void)handleDone:(id)sender{
    [sheet dismissWithClickedButtonIndex:0 animated:YES];
    
    if(nil == formatter){
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy 년 MM 월 dd 일"];
        [formatter setLocale:[NSLocale currentLocale]];
        
    }
    NSDate *date = picker.date;
    NSString *dateStr = [formatter stringFromDate:date];
    [self.btn setTitle:dateStr forState:UIControlStateNormal];
}

- (IBAction)chooseDate:(id)sender {
    CGSize viewSize = self.view.bounds.size;
    
    if(nil == sheet){
        sheet = [[UIActionSheet alloc] init];
        
        UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, viewSize.width,44)];
        UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(handleDone:)];
        NSArray *items = [NSArray arrayWithObject:done];
        [toolbar setItems:items];
        
        picker = [[UIDatePicker alloc] init];
        picker.datePickerMode = UIDatePickerModeDateAndTime;
        picker.frame = CGRectMake(0, toolbar.frame.size.height, viewSize.width, picker.frame.size.height);
        
        [sheet addSubview:toolbar];
        [sheet addSubview:picker];
        
        [sheet showInView:self.view];
        
        height = toolbar.frame.size.height + picker.frame.size.height;
        
    }
    
    [sheet showInView:self.view];
    sheet.frame = CGRectMake(0, viewSize.height - height, viewSize.width, height);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
