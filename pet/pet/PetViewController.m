//
//  ViewController.m
//  WaterFlowDisplay
//
//  Created by B.H. Liu on 12-3-29.
//  Copyright (c) 2012年 Appublisher. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "PetViewController.h"
#import "AsyncImageView.h"

#define NUMBER_OF_COLUMNS 3
#define COUNT 20
#define petURL @"http://192.168.1.100:8080/pet-web/pet/"

@interface PetViewController ()
@property (nonatomic,retain) NSMutableArray *petUnits;
@property (nonatomic,readwrite) int currentPage;
@property (nonatomic,readwrite) int type;
@property (nonatomic, retain) ASIHTTPRequest *request;
@end

@implementation PetViewController
@synthesize petUnits;
@synthesize request;
@synthesize currentPage;
@synthesize type;


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
    PetMenuBar *menuBar = [[PetMenuBar alloc] initWithFrame:CGRectMake(0, 0, 320, 40) andStyle:PetMenuBarStyleItem];
    menuBar.delegate = self;
    menuBar.bounces = YES;
    menuBar.selectedItemIndex = 0;
    menuBar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:menuBar];
 
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
	self.collectionView.backgroundColor = [UIColor whiteColor];
	[self.collectionView registerClass:[PetUICollectionViewCell class] forCellWithReuseIdentifier:@"CELL_ID"];
    [((WaterFlowLayout*)self.collectionView.collectionViewLayout) setFlowdatasource:self];
    [((WaterFlowLayout*)self.collectionView.collectionViewLayout) setFlowdelegate:self];
    
	self.collectionView.allowsSelection = YES;
    self.collectionView.frame = CGRectMake(0, 40, 320, 440);
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    refreshControl = [[UIRefreshControl alloc] init];
	refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Refresh"];
	[self.collectionView addSubview:refreshControl];
	[refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];

    [self loadData];
    
    
}


- (void)setup
{
    self.currentPage = 1;
    self.petUnits = [NSMutableArray array];
    parser = [[SBJsonParser alloc] init];
    typeDictionary =[[NSMutableDictionary alloc]init];
    [typeDictionary setValue:[[NSNumber alloc]initWithInt:50023067] forKey:@"0"];
    [typeDictionary setValue:[[NSNumber alloc]initWithInt:50015262] forKey:@"1"];
    [typeDictionary setValue:[[NSNumber alloc]initWithInt:50023066] forKey:@"2"];
    [typeDictionary setValue:[[NSNumber alloc]initWithInt:50015380] forKey:@"3"];
    [typeDictionary setValue:[[NSNumber alloc]initWithInt:50016383] forKey:@"4"];
    [typeDictionary setValue:[[NSNumber alloc]initWithInt:217309] forKey:@"5"];
    [typeDictionary setValue:[[NSNumber alloc]initWithInt:50015289] forKey:@"6"];
    [typeDictionary setValue:[[NSNumber alloc]initWithInt:50015288] forKey:@"7"];
    [typeDictionary setValue:[[NSNumber alloc]initWithInt:50001739] forKey:@"8"];
    
    typeNameDictionary=[[NSMutableDictionary alloc]init];
    [typeNameDictionary setValue:@"猫零食" forKey:@"0"];
    [typeNameDictionary setValue:@"狗零食" forKey:@"1"];
    [typeNameDictionary setValue:@"猫主粮" forKey:@"2"];
    [typeNameDictionary setValue:@"犬主粮" forKey:@"3"];
    [typeNameDictionary setValue:@"猫咪" forKey:@"4"];
    [typeNameDictionary setValue:@"狗狗" forKey:@"5"];
    [typeNameDictionary setValue:@"猫/狗医疗用品" forKey:@"6"];
    [typeNameDictionary setValue:@"猫/狗保健品" forKey:@"7"];
    [typeNameDictionary setValue:@"宠物服饰及配件" forKey:@"8"];
    self.type=50023067;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)refresh:(UIRefreshControl*)senderVal
{
    [self initLoad];
    sender=senderVal;
}
-(void)initLoad{
    self.currentPage = 1;
    isEnd=false;
    [self loadData];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
	return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [petUnits count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PetUICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL_ID" forIndexPath:indexPath];
     NSDictionary * petUnit= [petUnits objectAtIndex:indexPath.row];
	[cell.imageView loadImage:[petUnit objectForKey:@"picUrl"]  withPlaceholdImage:nil];
    cell.petId=[petUnit objectForKey:@"numIid"];
    cell.price=[petUnit objectForKey:@"price"];
    cell.petUrl=[petUnit objectForKey:@"clickUrl"];
    return cell;
}

#pragma mark - UICollectionViewDelegate methods
- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    PetUICollectionViewCell *cell = [collectionView  cellForItemAtIndexPath:indexPath];
    PetDetailViewController *detailViewController=  [[PetDetailViewController alloc]init];
    detailViewController.petId=cell.petId;
    detailViewController.petUrl=cell.petUrl;
    [self presentModalViewController:detailViewController animated:true];
}

#pragma mark-  UICollecitonViewDelegateWaterFlowLayout
- (CGFloat)flowLayout:(WaterFlowLayout *)flowView heightForRowAtIndex:(int)index
{
    float height = 0;
	switch (index  % 5) {
		case 0:
			height = 127;
			break;
		case 1:
			height = 100;
			break;
		case 2:
			height = 87;
			break;
		case 3:
			height = 114;
			break;
		case 4:
			height = 140;
			break;
		case 5:
			height = 158;
			break;
		default:
			break;
	}
	
	return height;
}


#pragma mark- UICollectionViewDatasourceFlowLayout
- (NSInteger)numberOfColumnsInFlowLayout:(WaterFlowLayout*)flowlayout
{
    return 3;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    float bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;
    
    if (bottomEdge >=  floor(scrollView.contentSize.height) )
    {
        self.currentPage ++;
        [self loadMoreData];
    }
}


- (void)requestFinished:(ASIHTTPRequest *)theRequest
{
    NSString *response = [theRequest responseString];
    NSMutableArray* result=[parser objectWithString:response] ;
    if ([result count]==0) {
        isEnd=true;
    }else{
        if (currentPage==1) {
            [petUnits removeAllObjects];
            [petUnits addObjectsFromArray:result];
        }else{
            [petUnits addObjectsFromArray:result];
        }
      
        [self.collectionView reloadData];
        [refreshControl endRefreshing];
    }
}


- (void)requestFailed:(ASIHTTPRequest *)theRequest
{
	NSError *error = [theRequest error];
	NSLog(@"erro Description:\n%@", [error localizedDescription]);
	NSLog(@"erro FailedReason:\n%@", [error localizedFailureReason]);
    [refreshControl endRefreshing];

}

- (void)loadData {
	[request cancel];
    if (!isEnd) {
//        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%d/%d/%d",petURL,self.type,currentPage,count]];
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%d",petURL,self.type]];
        [self setRequest:[ASIHTTPRequest requestWithURL:url]];
        [request setDelegate:self];
        [request startAsynchronous];
        [requestList addObject:request];
    }

}

- (void)loadMoreData {
	[self loadData];
}

#pragma mark LightMenuBarDelegate
- (NSUInteger)itemCountInMenuBar:(PetMenuBar *)menuBar {
    return [typeNameDictionary count];
}

- (NSString *)itemTitleAtIndex:(NSUInteger)index inMenuBar:(PetMenuBar *)menuBar {
    return [typeNameDictionary objectForKey:[NSString stringWithFormat:@"%d",index]];
}

- (void)itemSelectedAtIndex:(NSUInteger)index inMenuBar:(PetMenuBar *)menuBar {
    type=[[typeDictionary objectForKey:[NSString stringWithFormat:@"%d",index] ]intValue];
    [self initLoad];
}

//< Optional
- (CGFloat)itemWidthAtIndex:(NSUInteger)index inMenuBar:(PetMenuBar *)menuBar {
    return 106.0f;
}

#if USE_CUSTOM_DISPLAY

/****************************************************************************/
//< For Background Area
/****************************************************************************/

/**< Top and Bottom Padding, by Default 5.0f */
- (CGFloat)verticalPaddingInMenuBar:(PetMenuBar *)menuBar {
    return 1.0f;
}

- (CGFloat)horizontalPaddingInMenuBar:(PetMenuBar *)menuBar {
    return 0.0f;
}


- (CGFloat)cornerRadiusOfBackgroundInMenuBar:(PetMenuBar *)menuBar {
    return 0.0f;
}

- (UIColor *)colorOfBackgroundInMenuBar:(PetMenuBar *)menuBar {
    return [UIColor blackColor];
}


- (CGFloat)cornerRadiusOfButtonInMenuBar:(PetMenuBar *)menuBar {
    return 1.0f;
}

- (UIColor *)colorOfButtonHighPetInMenuBar:(PetMenuBar *)menuBar {
    return [UIColor whiteColor];
    
}

- (UIColor *)colorOfTitleNormalInMenuBar:(PetMenuBar *)menuBar {
    return [UIColor whiteColor];
}

- (UIColor *)colorOfTitleHighPetInMenuBar:(PetMenuBar *)menuBar {
    return [UIColor blackColor];
}

- (UIFont *)fontOfTitleInMenuBar:(PetMenuBar *)menuBar {
    return [UIFont systemFontOfSize:15.0f];
}




- (CGFloat)seperatorWidthInMenuBar:(PetMenuBar *)menuBar {
    return 0.0f;
}

- (CGFloat)seperatorHeightRateInMenuBar:(PetMenuBar *)menuBar {
    return 0.0f;
}

#endif



@end
