//
//  SeriesTableViewCell.h
//  projetoIOS
//
//  Created by FLAG on 18/04/18.
//  Copyright © 2018 Andre Costa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SeriesTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *seriesImage;
@property (weak, nonatomic) IBOutlet UILabel *nomeSeries;
@property (weak, nonatomic) IBOutlet UILabel *rating;
@property (weak, nonatomic) IBOutlet UILabel *dataLancamento;



@end
