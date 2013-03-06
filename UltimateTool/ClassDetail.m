//
//  ClassDetail.m
//  UltimateTool
//
//  Created by Victor Chandra on 3/6/13.
//  Copyright (c) 2013 ThreeMonkee. All rights reserved.
//

#import "ClassDetail.h"

typedef enum
{
    PROPERTY,
    PROTOCOL,
    CLASS_METHOD,
    INSTANCE_METHOD,
}CLASS_DETAIL;

@interface ClassDetail ()

@end

@implementation ClassDetail

#pragma mark -

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
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
    
//    _arrayClassMethod = [NSMutableArray array];
//    _arrayInstanceMethod = [NSMutableArray array];
    
    self.title = [_dictThisClass objectForKey:@"name"];

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
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    switch (section) {
        case PROPERTY:
            return [[_dictThisClass objectForKey:@"property"] count];
            break;
        case PROTOCOL:
            return [[_dictThisClass objectForKey:@"protocol"] count];
            break;
        case CLASS_METHOD:
            return [[_dictThisClass objectForKey:@"class_method"] count];
            break;
        case INSTANCE_METHOD:
            return [[_dictThisClass objectForKey:@"instance_method"] count];
            break;
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell.textLabel setMinimumScaleFactor:MINIMUM_SCALE_FACTOR];
        [cell.textLabel setAdjustsFontSizeToFitWidth:TRUE];
    }
    
    // Configure the cell...
    switch (indexPath.section) {
        case PROPERTY:
            [cell.textLabel setText:[[_dictThisClass objectForKey:@"property"] objectAtIndex:indexPath.row]];
            break;
        case PROTOCOL:
            [cell.textLabel setText:[[_dictThisClass objectForKey:@"protocol"] objectAtIndex:indexPath.row]];
            break;
        case CLASS_METHOD:
            [cell.textLabel setText:[[_dictThisClass objectForKey:@"class_method"] objectAtIndex:indexPath.row]];
            break;
        case INSTANCE_METHOD:
            [cell.textLabel setText:[[_dictThisClass objectForKey:@"instance_method"] objectAtIndex:indexPath.row]];
            break;
        default:
            return 0;
            break;
    }
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case PROPERTY:
            return [NSString stringWithFormat:@"Property (%d)", [[_dictThisClass objectForKey:@"property"] count]];
            break;
        case PROTOCOL:
            return [NSString stringWithFormat:@"Protocol (%d)", [[_dictThisClass objectForKey:@"protocol"] count]];
            break;
        case CLASS_METHOD:
            return [NSString stringWithFormat:@"Class Methods (%d)", [[_dictThisClass objectForKey:@"class_method"] count]];
            break;
        case INSTANCE_METHOD:
            return [NSString stringWithFormat:@"Instance Methods (%d)", [[_dictThisClass objectForKey:@"instance_method"] count]];
            break;
        default:
            return 0;
            break;
    }

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
}

@end
