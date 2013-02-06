//
//  GestureRecognizer.m
//  UltimateTool
//
//  Created by Victor Chandra on 1/22/13.
//  Copyright (c) 2013 ThreeMonkee. All rights reserved.
//

#import "GestureRecognizer.h"

@interface GestureRecognizer ()

@end

@implementation GestureRecognizer

-(IBAction)singleTapAction:(id)sender
{
    [outletLabel setText:@"Single Tap (UITapGestureRecognizer)"];
}

-(IBAction)doubleTapAction:(id)sender
{
    [outletLabel setText:@"Double Tap (UITapGestureRecognizer)"];
}

-(IBAction)pinchAction:(id)sender
{
    [outletLabel setText:@"Pinch (UIPinchGestureRecognizer)"];
}

-(IBAction)rotationAction:(id)sender
{
    [outletLabel setText:@"Rotation (UIRotationGestureRecognizer)"];
}

-(IBAction)swipeAction:(id)sender
{
    [outletLabel setText:@"Swipe (UISwipeGestureRecognizer)"];
}

-(IBAction)panAction:(id)sender
{
    [outletLabel setText:@"Pan (UIPanGestureRecognizer)"];
}

-(IBAction)longPressAction:(id)sender
{
    [outletLabel setText:@"Long Press (UILongPressGestureRecognizer)"];
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
