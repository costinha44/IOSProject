//
//  FavoritosViewController.h
//  projetoIOS
//
//  Created by FLAG on 16/04/18.
//  Copyright © 2018 Andre Costa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavoritosViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *table;
@end
