//
//  DepartmentViewController.m
//  Search
//
//  Created by Gennadij on 8/5/12.
//
//

#import "DepartmentViewController.h"
#import "PatientView.h"

@interface DepartmentViewController ()

@end

@implementation DepartmentViewController
@synthesize leftTableView;
@synthesize rightTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        source = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DepartmentsList" ofType:@"plist"]];
		keys = [[source allKeys] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
			return [(NSString*)obj1 compare:obj2];
		}];
		selectedDepartment = 0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(searchTouched) name:@"search" object:nil];
	[leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
	
	[rightTableView setRowHeight:125.0];
//	[leftTableView reloadData];
//	[rightTableView reloadData];
	// Do any additional setup after loading the view.
}

- (void)searchTouched
{
	
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

#pragma mark - TableViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	NSInteger result = 1;
	if (tableView == rightTableView)
	{
		result = [[[source objectForKey:[keys objectAtIndex:selectedDepartment]] objectForKey:@"patients"] count];
	}
	return result;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	NSInteger result = 1;
	if (tableView == leftTableView)
		result = keys.count;
	return result;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell* cell = nil;
	if (tableView == rightTableView)
	{
		cell = [tableView dequeueReusableCellWithIdentifier:@"person"];
		if (cell == nil)
		{
			NSArray* array = [[NSBundle mainBundle] loadNibNamed:@"PatientCellView" owner:self options:nil];
			cell = [array lastObject];
			[(PatientView*)cell initializeWithParams:nil];
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//			cell = [[PatientCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"person"  dictionary:nil];
		}
//		cell.textLabel.text = nil;
//		NSArray* array = [[source objectForKey:[keys objectAtIndex:selectedDepartment]] objectForKey:@"patients"];
//		cell.textLabel.text = [array objectAtIndex:indexPath.row];
	}
	else if (tableView == leftTableView)
	{
		cell = [tableView dequeueReusableCellWithIdentifier:@"department"];
		if (cell == nil)
		{
			cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"department"];
		}
		cell.textLabel.text = [[source objectForKey:[keys objectAtIndex:indexPath.row]] objectForKey:@"department"];
		
	}
	return cell;
}

#pragma mark - TableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
	if (tableView == leftTableView)
	{
		selectedDepartment = [indexPath row];
		[rightTableView reloadData];
	}
}

@end
