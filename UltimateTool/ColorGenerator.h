//
//  ColorGenerator.h
//  UltimateTool
//
//  Created by Victor Chandra on 1/22/13.
//  Copyright (c) 2013 ThreeMonkee. All rights reserved.
//

struct ColorSpaceWhite{
    float white;
    float alpha;
}colorSpaceWhite;

struct ColorSpaceHSB{
    float hue;
    float saturation;
    float brightness;
    float alpha;
}colorSpaceHSB;

struct ColorSpaceRGB{
    float red;
    float green;
    float blue;
    float alpha;
}colorSpaceRGB;


#import <UIKit/UIKit.h>

#import "UIColor+Components.h"


@interface ColorGenerator : UIViewController
{
    IBOutlet UIScrollView *outletScrollView;
    
    IBOutlet UIView *viewContainer;
    IBOutlet UIView *viewWhite;
    IBOutlet UIView *viewHSB;
    IBOutlet UIView *viewRGB;
    
    IBOutlet UILabel *labelWhite;
    IBOutlet UILabel *labelWhiteAlpha;

    IBOutlet UILabel *labelHue;
    IBOutlet UILabel *labelSaturation;
    IBOutlet UILabel *labelBrightness;
    IBOutlet UILabel *labelHSBAlpha;

    IBOutlet UILabel *labelRed;
    IBOutlet UILabel *labelGreen;
    IBOutlet UILabel *labelBlue;
    IBOutlet UILabel *labelRGBAlpha;
}

-(IBAction)segmentChanged:(id)sender;

-(IBAction)sliderWhite:(id)sender;
-(IBAction)sliderWhiteAlpha:(id)sender;

@end
