//
//  DetailsViewController.m
//  projetoIOS
//
//  Created by FLAG on 16/04/18.
//  Copyright © 2018 Andre Costa. All rights reserved.
//

#import "DetailsViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "Series+CoreDataClass.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface DetailsViewController ()
@property NSData *imageData;
@property NSMutableArray *series;
@property AppDelegate * appDelegate;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
    if([_series count]!=0){
        for(int i=0;i<[_series count];i++){
             Series *serie=[_series objectAtIndex:i];
            NSInteger value = [_idSerieD integerValue];
            if([serie idSerie]==value){
                _btnaddFav.hidden=YES;
            }
        }
    }else{
        _btnaddFav.hidden=NO;
    }
    NSString *nSerieSEspaco=[_nomeSerie stringByReplacingOccurrencesOfString:@" " withString:@""];
    [self.imageDetails sd_setImageWithURL:[NSURL URLWithString:_imageD]placeholderImage:[UIImage imageNamed:nSerieSEspaco]];
    [self.dataLancamento setText:_dataLancamento1];
    [self.rating setText:[_rating1 stringValue]];
    [self.status setText:_status1];
    [self.sinopse setText:_sinopse1];
    [self.genero setText:_genero1];
     }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadData{
    NSFetchRequest *request =[NSFetchRequest fetchRequestWithEntityName:@"Series"];
    NSArray<Series*> *series=[[[AppDelegate appDelegate]context]executeFetchRequest:request error:nil];
    _series =[[NSMutableArray alloc]initWithArray:series];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    WebSiteViewController *website =segue.destinationViewController;
    [website setOficialSite:_oficialSite1];
}
- (IBAction)addFavoritos:(id)sender {
     _btnaddFav.hidden=YES;
    Series *series=[NSEntityDescription insertNewObjectForEntityForName:@"Series" inManagedObjectContext:[[AppDelegate appDelegate]context]];
    series.idSerie=[_idSerieD integerValue];
    series.nomeSerie=_nomeSerie;
    series.genero=_genero1;
    series.rating= [_rating1 doubleValue];
    series.status=_status1;
    series.oficialSite=_oficialSite1;
    series.dataLancamento=_dataLancamento1;
    series.sinopse=_sinopse1;
    series.image=_imageD;
    [[AppDelegate appDelegate]saveContext];
    [self dismissViewControllerAnimated:YES completion:nil];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"Refresh" object:series];
    NSLog(@"Added Series");
}
@end
