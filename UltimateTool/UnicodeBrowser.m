//
//  UnicodeBrowser.m
//  UltimateTool
//
//  Created by Victor Chandra on 3/20/13.
//  Copyright (c) 2013 ThreeMonkee. All rights reserved.
//

#import "UnicodeBrowser.h"

@interface UnicodeBrowser ()

@end

@implementation UnicodeBrowser

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

    self.title = @"Unicode";

    _arrayIndex = @[@"0000",@"1000",@"2000",@"3000",@"4000",@"5000",@"6000",@"7000",
                        @"8000",@"9000",@"A000",@"B000",@"C000",@"D000",@"E000",@"F000"];
    
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(openSearchAlert)];
    [self.navigationItem setRightBarButtonItem:searchButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Search

-(void)openSearchAlert
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Search" message:@"Please type 4 digits Unicode Hex ex: 52dd" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [[alert textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeASCIICapable];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
        return;
    
    NSString *stringInput = [[alertView textFieldAtIndex:0] text];
    if ([[stringInput stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""])
        return;
    
    //NSString *stringToScan = [stringInput substringToIndex:4];
    NSString *stringToScan = stringInput;
    NSScanner *scanner = [NSScanner scannerWithString:stringToScan];
    unsigned int index = 0;
    [scanner scanHexInt:&index];
    if (index > 655535)
        index = 0;
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];

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
    return 65536;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        [cell.textLabel setFont:[UIFont systemFontOfSize:42]];
        [cell setIndentationLevel:1];
    }
    
    // Configure the cell...
    
    unsigned int code = indexPath.row;
    NSString *stringCode = [NSString stringWithFormat:@"%d", code];
    NSScanner *scanner = [NSScanner scannerWithString:stringCode];
    [scanner scanInt:(unsigned)&code];
    NSString *text = [NSString stringWithFormat:@"%C ", (unsigned short)code];
    
    [cell.textLabel setText:text];
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"0x %04X", code]];
    
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


#pragma mark - Indexing

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    // Find the correct index of cell should scroll to.
    /*int foundIndex = 0;
    for (Object *obj in dataArray) {
        if ([[[obj.YOURNAME substringToIndex:1] uppercaseString] compare: title] == NSOrderedDescending)
            break;
        foundIndex++;
    }
    if(foundIndex > dataArray.count)
        foundIndex = dataArray.count;
    [tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:foundIndex inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
    return 1;*/
    
    unsigned int foundIndex = 0;
    NSScanner *scanner = [NSScanner scannerWithString:title];
    [scanner scanHexInt:&foundIndex];
    NSLog(@"index title %d", foundIndex);
    [tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:foundIndex inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
    return 1;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _arrayIndex;
}

@end
