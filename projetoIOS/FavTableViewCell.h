//
//  FavTableViewCell.h
//  projetoIOS
//
//  Created by FLAG on 27/04/18.
//  Copyright © 2018 Andre Costa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nomeSerie;
@property (weak, nonatomic) IBOutlet UITextView *genero;
@property (weak, nonatomic) IBOutlet UILabel *rating;
@property (weak, nonatomic) IBOutlet UILabel *dataLancamento;
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end
