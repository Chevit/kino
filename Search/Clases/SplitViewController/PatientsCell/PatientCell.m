//
//  PatientCell.m
//  Search
//
//  Created by Gennadij on 8/6/12.
//
//

#import "PatientCell.h"
#import "PatientView.h"


@implementation PatientCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier dictionary:(NSDictionary*)dict
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
		NSArray* array = [[NSBundle mainBundle] loadNibNamed:@"PatientCellView" owner:self options:nil];
		PatientView* view = [array lastObject];
		view.frame = self.contentView.bounds;
		[self.contentView setClipsToBounds:YES];
		[self.contentView addSubview:view];
//		[view ]
		view.nameLAbel.text = @"test name";
		view.birthLabel.text = @"test birth date";
		view.incom.text = @"incomText";
		view.outcom.text = @"outcomm text";
		view.diagnos.text = @"Idiot";
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
