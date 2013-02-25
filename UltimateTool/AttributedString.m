//
//  AttributedString.m
//  UltimateTool
//
//  Created by Victor Chandra on 2/25/13.
//  Copyright (c) 2013 ThreeMonkee. All rights reserved.
//

#import "AttributedString.h"

/*NSString *NSFontAttributeName;
NSString *NSParagraphStyleAttributeName;
NSString *NSForegroundColorAttributeName;
NSString *NSUnderlineStyleAttributeName;
NSString *NSSuperscriptAttributeName;
NSString *NSBackgroundColorAttributeName;
NSString *NSAttachmentAttributeName;
NSString *NSLigatureAttributeName;
NSString *NSBaselineOffsetAttributeName;
NSString *NSKernAttributeName;
NSString *NSLinkAttributeName;
NSString *NSStrokeWidthAttributeName;
NSString *NSStrokeColorAttributeName;
NSString *NSUnderlineColorAttributeName;
NSString *NSStrikethroughStyleAttributeName;
NSString *NSStrikethroughColorAttributeName;
NSString *NSShadowAttributeName;
NSString *NSObliquenessAttributeName;
NSString *NSExpansionAttributeName;
NSString *NSCursorAttributeName;
NSString *NSToolTipAttributeName;
NSString *NSMarkedClauseSegmentAttributeName;
NSString *NSWritingDirectionAttributeName;
NSString *NSVerticalGlyphFormAttributeName;
NSString *NSTextAlternativesAttributeName;*/

@interface AttributedString ()

@end

@implementation AttributedString

-(IBAction)doAttributedString:(id)sender
{
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithAttributedString:outletLabel.attributedText];
    NSRange stringRange = NSMakeRange(0, outletLabel.attributedText.length);
    [attString addAttribute:NSStrokeWidthAttributeName value:[NSNumber numberWithFloat:3.0] range:stringRange];
    [outletLabel setAttributedText:attString];
}

-(IBAction)resetAttributedString:(id)sender
{
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:outletLabel.text];
    [outletLabel setAttributedText:attString];
}


#pragma mark - 

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
