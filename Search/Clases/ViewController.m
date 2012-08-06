//
//  ViewController.m
//  Search
//
//  Created by Vitaliy Cherepakha on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "PlaceViewController.h"
#import "ZFloatingManager.h"
#import "ZPopoverController.h"
#import "FilterViewController.h"
#import "DepartmentViewController.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize splitView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	
	
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background-pattern.png"]];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showMore:) name:@"piu" object:nil];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
	[self setSplitView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction)placeButtonTouched:(UIButton*)sender 
{
	if ([ZFloatingManager shouldFloatingWithIdentifierAppear:@"test1"]) {
		PlaceViewController *contentViewController = [[PlaceViewController alloc] initWithNibName:nil bundle:nil];
		popoverController = [[ZPopoverController alloc] initWithContentViewController:contentViewController];
		popoverController.identifier = @"test1";
		popoverController.delegate = self;
		[popoverController presentPopoverFromRect:sender.frame
										   inView:self.view
						 permittedArrowDirections:UIPopoverArrowDirectionAny
										 animated:YES];
	}
}

//- (BOOL)popoverControllerShouldDismissPopover:(UIPopoverController *)aPopoverController
//{
//	if (popoverController == aPopoverController)
//	{
//		[self showMore:nil];
//	}
//	return YES;
//}

- (IBAction)filterButtonTouched:(UIButton*)sender
{
	if ([ZFloatingManager shouldFloatingWithIdentifierAppear:@"test2"]) {
		FilterViewController *contentViewController = [[FilterViewController alloc] initWithNibName:nil bundle:nil];
		popoverController = [[ZPopoverController alloc] initWithContentViewController:contentViewController];
		popoverController.identifier = @"test2";
		popoverController.delegate = self;
		[popoverController presentPopoverFromRect:sender.frame
										   inView:self.view
						 permittedArrowDirections:UIPopoverArrowDirectionAny
										 animated:YES];
	}
}

- (void)showMore:(NSNotification*)notif
{
	[popoverController dismissPopoverAnimated:YES];

	
	depVC = [[DepartmentViewController alloc] initWithNibName:@"DepartmrntViewController" bundle:nil];

	depVC.view.frame = CGRectMake(0, 69, 786, 939);
	[self.view addSubview:depVC.view];
	
}

#pragma mark - SplitView delegate

//// Called when a button should be added to a toolbar for a hidden view controller.
//- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc;
//
//// Called when the view is shown again in the split view, invalidating the button and popover controller.
//- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem;
//
//// Called when the view controller is shown in a popover so the delegate can take action like hiding other popovers.
//- (void)splitViewController:(UISplitViewController *)svc popoverController:(UIPopoverController *)pc willPresentViewController:(UIViewController *)aViewController;
//
//// Returns YES if a view controller should be hidden by the split view controller in a given orientation.
//// (This method is only called on the leftmost view controller and only discriminates portrait from landscape.)
//- (BOOL)splitViewController:(UISplitViewController *)svc shouldHideViewController:(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_5_0);

@end
