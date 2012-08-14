//
//  PatientView.m
//  Search
//
//  Created by Gennadij on 8/6/12.
//
//

#import "PatientView.h"

@implementation PatientView
@synthesize outcom;
@synthesize diagnos;
@synthesize nameLAbel;
@synthesize birthLabel;
@synthesize incom;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//		NSArray* array = [[NSBundle mainBundle] loadNibNamed:@"PatientCellView" owner:self options:nil];
//		PatientView* view = [array lastObject];
//		view.frame = self.contentView.bounds;
//		[self.contentView setClipsToBounds:YES];
//		[self.contentView addSubview:view];
//		//		[view ]
//		view.nameLAbel.text = @"test name";
//		view.birthLabel.text = @"test birth date";
//		view.incom.text = @"incomText";
//		view.outcom.text = @"outcomm text";
//		view.diagnos.text = @"Idiot";
    }
    return self;
}

- (void)initializeWithParams:(NSDictionary*)dict
{
	
	self.nameLAbel.text = [dict objectForKey:@"name"];
	self.birthLabel.text = [NSString stringWithFormat:@"Дата рождения: %@",[dict objectForKey:@"birth"]];
	self.diagnos.text = [NSString stringWithFormat:@"Диагноз: %@",[dict objectForKey:@"diagnos"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
	
    // Configure the view for the selected state
}


@end
