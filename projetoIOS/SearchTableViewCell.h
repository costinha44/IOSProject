//
//  SearchTableViewCell.h
//  projetoIOS
//
//  Created by Andre Costa on 4/28/18.
//  Copyright © 2018 Andre Costa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *nomeSerie;
@property (weak, nonatomic) IBOutlet UILabel *rating;
@property (weak, nonatomic) IBOutlet UILabel *dataLancamento;

@end
