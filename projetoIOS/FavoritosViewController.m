//
//  FavoritosViewController.m
//  projetoIOS
//
//  Created by FLAG on 16/04/18.
//  Copyright © 2018 Andre Costa. All rights reserved.
//

#import "FavoritosViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "Series+CoreDataClass.h"
#import "FavTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "DetailsViewController.h"

@interface FavoritosViewController ()
   @property NSMutableArray *series;
@property AppDelegate * appDelegate;
@end

@implementation FavoritosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    FavoritosViewController *favoritos=[[FavoritosViewController alloc]init];
    favoritos.title=NSLocalizedString(@"fav", nil);
    NSLog(@"%@",NSLocalizedString(@"fav", nil));
    [self loadData];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(refreshTable:) name:@"Refresh" object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)refreshTable:(NSNotification*)notification{
    [self.series addObject:notification.object];
    [self loadData];
    [self.table reloadData];
    
}
-(void)loadData{
    NSFetchRequest *request =[NSFetchRequest fetchRequestWithEntityName:@"Series"];
    NSArray<Series*> *series=[[[AppDelegate appDelegate]context]executeFetchRequest:request error:nil];
    _series =[[NSMutableArray alloc]initWithArray:series];
    [self.table reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_series count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier=@"favoritos";
     self.table.rowHeight=120;
    FavTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell==nil){
        cell=[[FavTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    Series *serie=[_series objectAtIndex:indexPath.row];
    NSString *nSerieSEspaco=[[serie nomeSerie] stringByReplacingOccurrencesOfString:@" " withString:@""];
    [cell.imageV sd_setImageWithURL:[NSURL URLWithString:[serie image]]placeholderImage:[UIImage imageNamed:nSerieSEspaco]];
    cell.nomeSerie.text=[serie nomeSerie];
    cell.dataLancamento.text=[serie dataLancamento];
    cell.rating.text=[NSString stringWithFormat:@"%f",[serie rating]];
    cell.genero.text=[serie genero];
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(void)deleteSerie:(Series*)serie{
    [[[AppDelegate appDelegate]context] deleteObject:serie];
    [[AppDelegate appDelegate]saveContext];
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    DetailsViewController *details =segue.destinationViewController;
    NSIndexPath *indexPath = [self.table indexPathForSelectedRow];
    Series *serie=[_series objectAtIndex:indexPath.row];
    details.title=[serie nomeSerie];
    NSNumber *idSerie=[NSNumber numberWithInt:[serie idSerie]];
    NSNumber *rating=[NSNumber numberWithDouble:[serie rating]];
    [details setIdSerieD:idSerie];
    [details setNomeSerie:[serie nomeSerie]];
    [details setImageD:[serie image]];
    [details setRating1:rating];
    [details setStatus1:[serie status]];
    [details setSinopse1:[serie sinopse]];
    [details setOficialSite1:[serie oficialSite]];
    [details setDataLancamento1:[serie dataLancamento]];
    [details setGenero1:[serie genero]];
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        Series *serie=[_series objectAtIndex:indexPath.row];
        [_series removeObjectAtIndex:indexPath.row];
        [self deleteSerie:serie];
        [self.table deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}
@end
