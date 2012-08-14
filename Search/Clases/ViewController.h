//
//  ViewController.h
//  Search
//
//  Created by Vitaliy Cherepakha on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DepartmentViewController;

@interface ViewController : UIViewController <UISplitViewControllerDelegate, UIPopoverControllerDelegate>
{
	UIPopoverController* pc;
	DepartmentViewController* depVC;
}
@property (unsafe_unretained, nonatomic) IBOutlet UIView *splitView;
- (IBAction)placeButtonTouched:(id)sender;
- (IBAction)filterButtonTouched:(id)sender;

@end
