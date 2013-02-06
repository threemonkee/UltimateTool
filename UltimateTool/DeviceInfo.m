//
//  DeviceInfo.m
//  UltimateTool
//
//  Created by Victor Chandra on 11/17/12.
//  Copyright (c) 2012 ThreeMonkee. All rights reserved.
//

#import "DeviceInfo.h"

typedef enum{
    DEVICE_NAME,
    MULTITASKING_SUPPORTED,
    UNIQUE_IDENTIFIER,
    BATTERY_INFORMATION
}device_info;


@interface DeviceInfo ()

@end

@implementation DeviceInfo


#pragma mark - Methods

-(NSString*)statusForBatteryState:(NSUInteger)batteryState
{
    switch (batteryState) {
        case UIDeviceBatteryStateUnknown:
            return @"Battery State: Unknown";
            break;
        case UIDeviceBatteryStateUnplugged:
            return @"Battery State: Unplugged";
            break;
        case UIDeviceBatteryStateCharging:
            return @"Battery State: Charging";
            break;
        case UIDeviceBatteryStateFull:
            return @"Battery State: Full";
            break;
        default:
            return @"Battery State: Unknown";
            break;
    }
    return @"Error Happened";
}


#pragma mark - Override

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
    
    //[[UIDevice currentDevice] setBatteryMonitoringEnabled:TRUE];
    //[self.tableView reloadData];
    
    [[UIDevice currentDevice] setBatteryMonitoringEnabled:TRUE];

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
        case DEVICE_NAME:
            return 5;
            break;
            
        case MULTITASKING_SUPPORTED:
            return 1;
            break;
            
        case UNIQUE_IDENTIFIER:
            return 1;
            break;
            
        case BATTERY_INFORMATION:
            return 2;
            break;
            
        default:
            return 0;
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case DEVICE_NAME:
            return 44;
            break;
            
        case MULTITASKING_SUPPORTED:
            return 44;
            break;
            
        case UNIQUE_IDENTIFIER:
            return 68;
            break;
            
        case BATTERY_INFORMATION:
            return 44;
            break;
            
        default:
            return 0;
            break;
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case DEVICE_NAME:
            return @"Device Name";
            break;
            
        case MULTITASKING_SUPPORTED:
            return @"Multitasking Support";
            break;
            
        case UNIQUE_IDENTIFIER:
            return @"Unique Identifier";
            break;
            
        case BATTERY_INFORMATION:
            return @"Battery Information";
            break;

        default:
            return nil;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    NSString *stringOutput;
    
    switch (indexPath.section)
    {
        case DEVICE_NAME:
            switch (indexPath.row)
            {
                case 0:
                    stringOutput = [NSString stringWithFormat:@"Name: %@", [[UIDevice currentDevice] name]];
                    break;
                case 1:
                    stringOutput = [NSString stringWithFormat:@"System Name: %@", [[UIDevice currentDevice] systemName]];
                    break;
                case 2:
                    stringOutput = [NSString stringWithFormat:@"System Version: %@", [[UIDevice currentDevice] systemVersion]];
                    break;
                case 3:
                    stringOutput = [NSString stringWithFormat:@"Model: %@", [[UIDevice currentDevice] model]];
                    break;
                case 4:
                    stringOutput = [NSString stringWithFormat:@"Model (localized): %@", [[UIDevice currentDevice] localizedModel]];
                    break;
            }
            break;
            
        case MULTITASKING_SUPPORTED:
            if ([[UIDevice currentDevice] respondsToSelector:@selector(isMultitaskingSupported)]) {
                if ([[UIDevice currentDevice] isMultitaskingSupported])
                    stringOutput = @"TRUE";
                else
                    stringOutput = @"FALSE";
            }else
                stringOutput = @"Undefined";
            break;
            
        case UNIQUE_IDENTIFIER:
            if ([[UIDevice currentDevice] respondsToSelector:@selector(uniqueIdentifier)])
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
                stringOutput = [[UIDevice currentDevice] uniqueIdentifier];
#pragma GCC diagnostic warning "-Wdeprecated-declarations"
            else
                stringOutput = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
            break;
            
        case BATTERY_INFORMATION:
            if (indexPath.row == 0)
                stringOutput = [NSString stringWithFormat:@"%.2f %%",[[UIDevice currentDevice] batteryLevel] * 100];
            else
                stringOutput = [self statusForBatteryState:[[UIDevice currentDevice] batteryState]];
            break;
    }
    
    [cell.textLabel setText:stringOutput];
    [cell.textLabel setNumberOfLines:0];
    
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
}

@end
