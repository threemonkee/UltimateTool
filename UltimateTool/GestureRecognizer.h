//
//  GestureRecognizer.h
//  UltimateTool
//
//  Created by Victor Chandra on 1/22/13.
//  Copyright (c) 2013 ThreeMonkee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GestureRecognizer : UIViewController
{
    IBOutlet UILabel *outletLabel;
}

-(IBAction)singleTapAction:(id)sender;
-(IBAction)doubleTapAction:(id)sender;
-(IBAction)pinchAction:(id)sender;
-(IBAction)rotationAction:(id)sender;
-(IBAction)swipeAction:(id)sender;
-(IBAction)panAction:(id)sender;
-(IBAction)longPressAction:(id)sender;

@end
