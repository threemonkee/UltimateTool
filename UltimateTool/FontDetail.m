//
//  FontDetail.m
//  UltimateTool
//
//  Created by Victor Chandra on 11/16/12.
//  Copyright (c) 2012 ThreeMonkee. All rights reserved.
//

#import "FontDetail.h"

@interface FontDetail ()

@end

@implementation FontDetail

@synthesize outletTextView = _outletTextView;
@synthesize outletBarButtonItem = _outletBarButtonItem;
@synthesize fontName = _fontName;

-(IBAction)sizeChanged:(id)sender
{
    UISlider *slider = sender;
    CGFloat sizeValue = slider.value;
    [_outletTextView setFont:[UIFont fontWithName:_fontName size:sizeValue]];
    [_outletBarButtonItem setTitle:[NSString stringWithFormat:@"%.0f",sizeValue]];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [_outletTextView setText:[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"CharacterList" ofType:nil] encoding:NSUTF8StringEncoding error:nil]];
    [_outletTextView setFont:[UIFont fontWithName:_fontName size:20]];
    [_outletBarButtonItem setTitle:@"20"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
