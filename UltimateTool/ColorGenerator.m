//
//  ColorGenerator.m
//  UltimateTool
//
//  Created by Victor Chandra on 1/22/13.
//  Copyright (c) 2013 ThreeMonkee. All rights reserved.
//

#import "ColorGenerator.h"

@interface ColorGenerator ()

@end

@implementation ColorGenerator


#pragma mark - IBAction White

-(IBAction)sliderWhite:(id)sender
{
    UISlider *slider = sender;
    colorSpaceWhite.white = slider.value;
    [labelWhite setText:[NSString stringWithFormat:@"%.1f",colorSpaceWhite.white]];
    [self updateWhite];
}

-(IBAction)sliderWhiteAlpha:(id)sender
{
    UISlider *slider = sender;
    colorSpaceWhite.alpha = slider.value;
    [labelWhiteAlpha setText:[NSString stringWithFormat:@"%.1f",colorSpaceWhite.alpha]];
    [self updateWhite];
}


#pragma mark - IBAction HSB

-(IBAction)sliderHue:(id)sender
{
    UISlider *slider = sender;
    colorSpaceHSB.hue = slider.value;
    [labelHue setText:[NSString stringWithFormat:@"%.1f",colorSpaceHSB.hue]];
    [self updateHSB];
}

-(IBAction)sliderSaturation:(id)sender
{
    UISlider *slider = sender;
    colorSpaceHSB.saturation = slider.value;
    [labelSaturation setText:[NSString stringWithFormat:@"%.1f",colorSpaceHSB.saturation]];
    [self updateHSB];
}

-(IBAction)sliderBrightness:(id)sender
{
    UISlider *slider = sender;
    colorSpaceHSB.brightness = slider.value;
    [labelBrightness setText:[NSString stringWithFormat:@"%.1f",colorSpaceHSB.brightness]];
    [self updateHSB];
}

-(IBAction)sliderHSBAlpha:(id)sender
{
    UISlider *slider = sender;
    colorSpaceHSB.alpha = slider.value;
    [labelHSBAlpha setText:[NSString stringWithFormat:@"%.1f",colorSpaceHSB.alpha]];
    [self updateHSB];
}


#pragma mark - IBAction RGB

-(IBAction)sliderRed:(id)sender
{
    UISlider *slider = sender;
    colorSpaceRGB.red = slider.value;
    [labelRed setText:[NSString stringWithFormat:@"%.1f",colorSpaceRGB.red]];
    [self updateRGB];
}

-(IBAction)sliderGreen:(id)sender
{
    UISlider *slider = sender;
    colorSpaceRGB.green = slider.value;
    [labelGreen setText:[NSString stringWithFormat:@"%.1f",colorSpaceRGB.green]];
    [self updateRGB];
}

-(IBAction)sliderBlue:(id)sender
{
    UISlider *slider = sender;
    colorSpaceRGB.blue = slider.value;
    [labelBlue setText:[NSString stringWithFormat:@"%.1f",colorSpaceRGB.blue]];
    [self updateRGB];
}

-(IBAction)sliderRGBAlpha:(id)sender
{
    UISlider *slider = sender;
    colorSpaceRGB.alpha = slider.value;
    [labelRGBAlpha setText:[NSString stringWithFormat:@"%.1f",colorSpaceRGB.alpha]];
    [self updateRGB];
}


#pragma mark - IBAction Umum

-(IBAction)segmentChanged:(id)sender
{
    UISegmentedControl *segment = sender;
    NSInteger index = [segment selectedSegmentIndex];
    [outletScrollView setContentOffset:CGPointMake(320 * index, 0) animated:TRUE];
}


#pragma mark - Update Color

-(void)updateWhite
{
    UIColor *newColor = [UIColor colorWithWhite:colorSpaceWhite.white
                                          alpha:colorSpaceWhite.alpha];
    UIColor *fontColor = [newColor getReverseColor];
    
    [labelWhite setTextColor:fontColor];
    [labelWhiteAlpha setTextColor:fontColor];
    [viewWhite setBackgroundColor:newColor];
}

-(void)updateHSB
{
    UIColor *newColor = [UIColor colorWithHue:colorSpaceHSB.hue
                                   saturation:colorSpaceHSB.saturation
                                   brightness:colorSpaceHSB.brightness
                                        alpha:colorSpaceHSB.alpha];
    UIColor *fontColor = [newColor getReverseColor];
    
    [labelHue setTextColor:fontColor];
    [labelSaturation setTextColor:fontColor];
    [labelBrightness setTextColor:fontColor];
    [labelHSBAlpha setTextColor:fontColor];
    [viewHSB setBackgroundColor:newColor];
}

-(void)updateRGB
{
    UIColor *newColor = [UIColor colorWithRed:colorSpaceRGB.red
                                        green:colorSpaceRGB.green
                                         blue:colorSpaceRGB.blue
                                        alpha:colorSpaceRGB.alpha];
    UIColor *fontColor = [newColor getReverseColor];
    
    [labelRed setTextColor:fontColor];
    [labelGreen setTextColor:fontColor];
    [labelBlue setTextColor:fontColor];
    [labelRGBAlpha setTextColor:fontColor];
    
    /*CGFloat whiteValue = 0;
    CGFloat alphaValue = 0;
    if ([newColor getWhite:&whiteValue alpha:&alphaValue]) {
        NSLog(@"whitevalue %f", whiteValue);
    }else{
        NSLog(@"fail whitevalue");
    }*/
    
    [viewRGB setBackgroundColor:newColor];
}


#pragma mark - Override

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
    
    [outletScrollView addSubview:viewContainer];
    [outletScrollView setContentSize:viewContainer.bounds.size];
    
    colorSpaceWhite.white = 1.0;
    colorSpaceWhite.alpha = 1.0;
    
    colorSpaceHSB.hue = 1.0;
    colorSpaceHSB.saturation = 1.0;
    colorSpaceHSB.brightness = 1.0;
    colorSpaceHSB.alpha = 1.0;
    
    colorSpaceRGB.red = 1.0;
    colorSpaceRGB.green = 1.0;
    colorSpaceRGB.blue = 1.0;
    colorSpaceRGB.alpha = 1.0;

    [self updateWhite];
    [self updateHSB];
    [self updateRGB];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
