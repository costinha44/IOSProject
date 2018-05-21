//
//  DetailsViewController.h
//  projetoIOS
//
//  Created by FLAG on 16/04/18.
//  Copyright © 2018 Andre Costa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebSiteViewController.h"

@interface DetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageDetails;
@property (weak, nonatomic) IBOutlet UILabel *dataLancamento;
@property (weak, nonatomic) IBOutlet UILabel *rating;
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (weak, nonatomic) IBOutlet UIButton *oficialSite;
@property (weak, nonatomic) IBOutlet UITextView *sinopse;
@property (weak, nonatomic) IBOutlet UILabel *genero;
@property (weak, nonatomic) IBOutlet UIButton *btnaddFav;


@property NSNumber *idSerieD;
@property NSString *nomeSerie;
@property NSString *dataLancamento1;
@property NSNumber *rating1;
@property NSString *status1;
@property NSString *oficialSite1;
@property NSString *sinopse1;
@property NSString *genero1;
@property NSString *imageD;

@end
