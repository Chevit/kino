//
//  DepartmentViewController.h
//  Search
//
//  Created by Gennadij on 8/5/12.
//
//

#import <UIKit/UIKit.h>

@interface DepartmentViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
	NSDictionary* source;
	NSArray* keys;
	NSInteger selectedDepartment;
}
@property (unsafe_unretained, nonatomic) IBOutlet UITableView *leftTableView;
@property (unsafe_unretained, nonatomic) IBOutlet UITableView *rightTableView;

@end
