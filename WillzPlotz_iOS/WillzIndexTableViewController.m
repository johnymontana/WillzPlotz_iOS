//
//  WillzIndexTableViewController.m
//  WillzPlotz_iOS
//
//  Created by lyonwj on 2/28/13.
//  Copyright (c) 2013 William Lyon. All rights reserved.
//

#import "WillzIndexTableViewController.h"
#import "StockModel.h"
#import "PlotViewController.h"

@interface WillzIndexTableViewController ()

@end

@implementation WillzIndexTableViewController

-(void)awakeFromNib
{
    self.indexModel = [[WillzIndexModel alloc] init];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.indexModel = [[WillzIndexModel alloc] init];

    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    //self.indexModel = [[WillzIndexModel alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self.tableView reloadData];
    
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
    NSLog(@"Count of array: %d", [self.indexModel.stockArray count]);
    return [self.indexModel.stockArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Stock";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    StockModel* stockModel = [self.indexModel.stockArray objectAtIndex:indexPath.row];
    
    NSLog(@"symbol: %@", stockModel.symbol);
    cell.textLabel.text = stockModel.symbol;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"YTD return: %@", [stockModel.ytdReturn stringValue]];
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UITableViewCell* cell = (UITableViewCell*)sender;
    NSIndexPath* indexPath = [self.tableView indexPathForCell:cell];
    
    StockModel* stockModel = [self.indexModel.stockArray objectAtIndex:indexPath.row];
    
    NSLog(@"prepareforSegue stockModel.symbol: %@", stockModel.symbol);
    
    
    //PlotViewController* plvc = [[PlotViewController alloc] initWithStockModel:stockModel];
   // plvc = [segue destinationViewController];
    
    //[segue.destinationViewController performSelector:@selector(setUpWithSymbol:) withObject:stockModel.symbol];
    //[segue.destinationViewController setUpWithSymbol:stockModel.symbol];
    [segue.destinationViewController setUpWithStockModel:stockModel];
    
    [segue.destinationViewController setTitle:stockModel.symbol];
    
    //[segue.destinationViewController setTitle:[self titleForRow:indexPath.row]];
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
