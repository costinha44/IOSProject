//
//  ViewController.m
//  projetoIOS
//
//  Created by Andre Costa on 3/11/18.
//  Copyright © 2018 Andre Costa. All rights reserved.
//

#import "ViewController.h"
#import "SeriesTableViewCell.h"
#import "SearchViewController.h"


@interface ViewController ()
@property ConstrutoresAPI * cApi;
@property AppDelegate * appDelegate;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    _appDelegate =[AppDelegate appDelegate];
    _appDelegate.arrayApiData = [[NSMutableArray alloc]init];
    ViewController *viewController=[[ViewController alloc]init];
    viewController.title=NSLocalizedString(@"series", nil);
    NSLog(@"%@",NSLocalizedString(@"series", nil));
    [self TakeAllShows];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [_appDelegate.arrayApiData count];
}



- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier=@"series";
    self.tableView.rowHeight=120;
    SeriesTableViewCell *cell =[_tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell==nil){
        cell=[[SeriesTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
_cApi = [_appDelegate.arrayApiData objectAtIndex:indexPath.row];
    NSData *imageData =[[NSData alloc]initWithContentsOfURL:[NSURL URLWithString: [_cApi image]]];
    cell.seriesImage.image=[[UIImage alloc]initWithData:imageData];
    cell.nomeSeries.text=[_cApi nomeSerie];
    cell.rating.text=[NSString stringWithFormat:@"%@",[_cApi rating]];
    cell.dataLancamento.text=[_cApi dataLancamento];
    return cell;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    DetailsViewController *details =segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    _cApi = [_appDelegate.arrayApiData objectAtIndex:indexPath.row];
    
    details.title=[self.cApi nomeSerie];
    [details setIdSerieD:[self.cApi idSeries]];
    [details setNomeSerie:[self.cApi nomeSerie]];
    [details setImageD:[self.cApi image]];
    [details setRating1:[self.cApi rating]];
    [details setStatus1:[self.cApi status]];
    [details setSinopse1:[self.cApi sinopse]];
    [details setOficialSite1:[self.cApi oficialSite]];
    [details setDataLancamento1:[self.cApi dataLancamento]];
    [details setGenero1:[self.cApi genero]];
     
    NSLog(@"%@",[self.cApi nomeSerie]);
    NSLog(@"%@",[self.cApi nomeSerie]);
    
}
    

-(void)TakeAllShows{
    NSArray * bodyApi=[Http makeExternalRequest:@"https://api.tvmaze.com/shows?page=1"];
    ConstrutoresAPI *saveDataApi;
    for(int i=0;i<[bodyApi count];i++){
        NSNumber *idSerie=[bodyApi valueForKey:@"id"][i];
        NSString *nome=[bodyApi valueForKey:@"name"][i];
        NSArray *generoArray=[bodyApi valueForKey:@"genres"][i];
        NSString *genero=[generoArray componentsJoinedByString:@"\n"];
        NSString *status=[bodyApi valueForKey:@"status"][i];
        NSString *dataLancamento=[bodyApi valueForKey:@"premiered"][i];
        NSString *oficialSite=[bodyApi valueForKey:@"officialSite"][i];
        NSString *rating=[bodyApi valueForKey:@"rating"][i];
        NSNumber *ratAverage=[rating valueForKey:@"average"];
        if(ratAverage == (id)[NSNull null]){
            ratAverage=0;
        }
        NSString *image=[bodyApi valueForKey:@"image"][i];
        NSString *imageURL=[image valueForKey:@"medium"];
        NSString *sinopse=[bodyApi valueForKey:@"summary"][i];
        NSString *sinopseFormatado=[self stringByStrippingHTML:sinopse];
        saveDataApi=[[ConstrutoresAPI alloc]initWithId:idSerie Nome:nome Genero:genero Status:status DataLancamento:dataLancamento OficialSite:oficialSite Rating:ratAverage Image:imageURL Sinopse:sinopseFormatado];
       [_appDelegate.arrayApiData addObject:saveDataApi];
    }
}


-(NSString *)stringByStrippingHTML:(NSString*)str
{
    NSRange r;
    while ((r = [str rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location     != NSNotFound)
    {
        str = [str stringByReplacingCharactersInRange:r withString:@""];
    }
    return str;
}
@end
