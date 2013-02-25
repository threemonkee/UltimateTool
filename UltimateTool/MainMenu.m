//
//  MainMenu.m
//  UltimateTool
//
//  Created by Victor Chandra on 11/16/12.
//  Copyright (c) 2012 ThreeMonkee. All rights reserved.
//

#import "MainMenu.h"

typedef enum
{
    FONT_BROWSER,
    DEVICE_INFO,
    GESTURE_RECOGNIZER,
    COLOR_GENERATOR,
    ATTRIBUTED_STRING
}main_menu;

@interface MainMenu ()

@end

@implementation MainMenu

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.title = @"Ultimate Tool";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell.textLabel setNumberOfLines:0];
    }
    
    // Configure the cell...
    NSString *stringMenu;
    switch (indexPath.row)
    {
        case FONT_BROWSER:
            stringMenu = @"Font Browser";
            break;
        case DEVICE_INFO:
            stringMenu = @"Device Information";
            break;
        case GESTURE_RECOGNIZER:
            stringMenu = @"Gesture Recognizer";
            break;
        case COLOR_GENERATOR:
            stringMenu = @"Color Generator";
            break;
        case ATTRIBUTED_STRING:
            stringMenu = @"Attributed String";
            break;
    }
    [cell.textLabel setText:stringMenu];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    if (indexPath.row == FONT_BROWSER)
    {
        FontBrowser *fontBrowser = [[FontBrowser alloc] initWithStyle:UITableViewStylePlain];
        [fontBrowser setTitle:@"Font Browser"];
        [self.navigationController pushViewController:fontBrowser animated:TRUE];
        
    }else if (indexPath.row == DEVICE_INFO)
    {
        DeviceInfo *deviceInfo = [[DeviceInfo alloc] initWithStyle:UITableViewStyleGrouped];
        [deviceInfo setTitle:@"Device Information"];
        [self.navigationController pushViewController:deviceInfo animated:TRUE];
        
    }else if (indexPath.row == GESTURE_RECOGNIZER)
    {
        GestureRecognizer *gestureRecognizer = [[GestureRecognizer alloc] initWithNibName:@"GestureRecognizer" bundle:nil];
        [gestureRecognizer setTitle:@"Gesture Recognizer"];
        [self.navigationController pushViewController:gestureRecognizer animated:TRUE];
        
    }else if (indexPath.row == COLOR_GENERATOR)
    {
        ColorGenerator *colorGenerator = [[ColorGenerator alloc] initWithNibName:@"ColorGenerator" bundle:nil];
        [colorGenerator setTitle:@"Color Generator"];
        [self.navigationController pushViewController:colorGenerator animated:TRUE];
        
    }else if (indexPath.row == ATTRIBUTED_STRING)
    {
        AttributedString *attributedString = [[AttributedString alloc] initWithNibName:@"AttributedString" bundle:nil];
        [attributedString setTitle:@"Attributed String"];
        [self.navigationController pushViewController:attributedString animated:TRUE];
        
    }
}

@end
