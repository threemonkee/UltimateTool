//
//  FontDetail.h
//  UltimateTool
//
//  Created by Victor Chandra on 11/16/12.
//  Copyright (c) 2012 ThreeMonkee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FontDetail : UIViewController

@property (nonatomic,retain) IBOutlet UITextView        *outletTextView;
@property (nonatomic,retain) IBOutlet UIBarButtonItem   *outletBarButtonItem;
@property (nonatomic,retain) NSString *fontName;

-(IBAction)sizeChanged:(id)sender;

@end
