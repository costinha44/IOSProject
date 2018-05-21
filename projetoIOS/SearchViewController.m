//
//  SearchViewController.m
//  projetoIOS
//
//  Created by Andre Costa on 4/22/18.
//  Copyright © 2018 Andre Costa. All rights reserved.
//

#import "SearchViewController.h"
#import "ViewController.h"
#import "SearchTableViewCell.h"

@interface SearchViewController ()
@property AppDelegate * appDelegate;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SearchViewController *searchViewController=[[SearchViewController alloc]init];
    searchViewController.title=NSLocalizedString(@"search", nil);
    NSLog(@"%@",NSLocalizedString(@"search", nil));
    _appDelegate =[AppDelegate appDelegate];
    _searchSeries=[[NSMutableArray alloc]initWithArray:_appDelegate.arrayApiData];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardShown:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)keyboardShown:(NSNotification *)n{
    CGRect *keyboardFrame;
    [[[n userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey]getValue:&keyboardFrame];
    CGRect tableViewFrame=_tableView.frame;
    tableViewFrame.size.height-=keyboardFrame->size.height;
    [_tableView setFrame:tableViewFrame];
    
}
-(void)keyboardHide:(NSNotification *)n{
    [_tableView setFrame:self.view.bounds];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_searchSeries count];
}
- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier=@"search";
    self.tableView.rowHeight=120;
    SearchTableViewCell *cell =[_tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell==nil){
        cell=[[SearchTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    ConstrutoresAPI *cApi=[_searchSeries objectAtIndex:indexPath.row];
    NSData *imageData =[[NSData alloc]initWithContentsOfURL:[NSURL URLWithString: [cApi image]]];
    cell.imageV.image=[[UIImage alloc]initWithData:imageData];
    cell.nomeSerie.text=[cApi nomeSerie];
    cell.rating.text=[NSString stringWithFormat:@"%@",[cApi rating]];
    cell.dataLancamento.text=[cApi dataLancamento];
    return cell;
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)aSearchBar{
    //[_searckBar resignFirstResponder];
    NSString *searchText=[_searckBar text];
        if([searchText length] >0){
            [self TakeShowsSearch:searchText];
        }
    [_tableView reloadData];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    DetailsViewController *details =segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    ConstrutoresAPI *cApi = [_searchSeries objectAtIndex:indexPath.row];
    
    details.title=[cApi nomeSerie];
    [details setIdSerieD:[cApi idSeries]];
    [details setNomeSerie:[cApi nomeSerie]];
    [details setImageD:[cApi image]];
    [details setRating1:[cApi rating]];
    [details setStatus1:[cApi status]];
    [details setSinopse1:[cApi sinopse]];
    [details setOficialSite1:[cApi oficialSite]];
    [details setDataLancamento1:[cApi dataLancamento]];
    [details setGenero1:[cApi genero]];
    
}
-(void)TakeShowsSearch:(NSString *)searchWord{
    [_searchSeries removeAllObjects];
    NSString *newStringWord = [searchWord stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    NSString *lowerWord = [newStringWord lowercaseString];
    NSArray * Api=[Http makeExternalRequestSearch:@"http://api.tvmaze.com/search/shows" andParam:lowerWord];
    ConstrutoresAPI *saveDataApi;
    for(int i=0;i<[Api count];i++){
        NSString *bodyApi=[Api valueForKey:@"show"];
        NSNumber *idSerie=[bodyApi valueForKey:@"id"][i];
        NSString *nome=[bodyApi valueForKey:@"name"][i];
        NSArray *generoArray=[bodyApi valueForKey:@"genres"][i];
        NSString *genero;
        if([generoArray count]!=0){
            genero =[generoArray componentsJoinedByString:@"\n"];;
        }else{
            genero=@"";
        }
        
        NSString *status=[bodyApi valueForKey:@"status"][i];
        if(status == (id)[NSNull null]){
            status=@"";
        }
        NSString *dataLancamento=[bodyApi valueForKey:@"premiered"][i];
        if(dataLancamento == (id)[NSNull null]){
            dataLancamento=@"";
        }
        NSString *oficialSite=[bodyApi valueForKey:@"officialSite"][i];
        if(oficialSite == (id)[NSNull null]){
            oficialSite=@"";
        }
        NSString *rating=[bodyApi valueForKey:@"rating"][i];
        NSNumber *ratAverage=[rating valueForKey:@"average"];
        if(ratAverage == (id)[NSNull null]){
            ratAverage=0;
        }
        NSString *image=[bodyApi valueForKey:@"image"][i];
        NSString *imageURL;
        if(image == (id)[NSNull null] ){
            imageURL=@"https://www.wilderness-survival-gear.com/images/detailed/18/no_image_sm_4qp7-bk.png";
        }else{
            imageURL=[image valueForKey:@"medium"];
        }
        NSString *sinopse=[bodyApi valueForKey:@"summary"][i];
        NSString *sinopseFormatado;
        if(sinopse == (id)[NSNull null] ){
            sinopseFormatado=@"";
        }else{
            sinopseFormatado=[self stringByStrippingHTML:sinopse];
        }
        saveDataApi=[[ConstrutoresAPI alloc]initWithId:idSerie Nome:nome Genero:genero Status:status DataLancamento:dataLancamento OficialSite:oficialSite Rating:ratAverage Image:imageURL Sinopse:sinopseFormatado];
        [_searchSeries addObject:saveDataApi];
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
