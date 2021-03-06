//
//  PlaceViewController.m
//  Search
//
//  Created by Vitaliy Cherepakha on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PlaceViewController.h"

@interface PlaceViewController ()

@end

@implementation PlaceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
	{
		secondArray = @[@"Гиппократ", @"Медицентр", @"Клиника имени Амосова", @"Биотек", @"Все Клиники..."];
		firstArray = @[@"Частные клиники",@"Государственные клиники",@"Все"];
		currentArray = firstArray;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.contentSizeForViewInPopover = self.view.bounds.size;
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
	navigationItem = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return currentArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
	if (!cell) 
	{
		cell = [[UITableViewCell alloc] initWithFrame:CGRectZero];
	}
	
	cell.textLabel.text = [currentArray objectAtIndex:indexPath.row];    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (currentArray == firstArray)
	{
//		self.navigationItem
		navigationItem.title = @"Частные клиники";
		currentArray = secondArray;
		double delayInSeconds = 0.2;
		dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
		dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
			[tableView reloadData];
		});
		
	}
	else
	{
		[[NSNotificationCenter defaultCenter] postNotificationName:@"piu" object:nil];
	}
}


- (IBAction)backButtonTouched:(id)sender
{
	[[NSNotificationCenter defaultCenter] postNotificationName:@"closePopover" object:nil];
}
@end
