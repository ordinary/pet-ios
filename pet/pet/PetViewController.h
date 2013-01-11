//
//  ViewController.h
//  WaterFlowDisplay
//
//  Created by B.H. Liu on 12-3-29.
//  Copyright (c) 2012年 Appublisher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PetMenuBarDelegate.h"
#import "PetMenuBar.h"
#import "ASIHTTPRequest.h"
#import "SBJson.h"
#import "PetDetailViewController.h"
#import "PetUICollectionViewCell.h"
#import "WaterFlowLayout.h"
#import "PetUICollectionViewCell.h"
#import "PetDetailViewController.h"


@interface PetViewController  : UICollectionViewController <UICollectionViewDataSource,UICollectionViewDelegate,UICollecitonViewDelegateWaterFlowLayout,UICollectionViewDataSourceWaterFlowLayout,PetMenuBarDelegate>
{
    int count;
    SBJsonParser * parser;
    NSMutableArray *requestList;
    NSInteger type;
    UIRefreshControl* sender;
    NSMutableDictionary * typeDictionary;
    NSMutableDictionary * typeNameDictionary;
    UIRefreshControl * refreshControl;
    Boolean isEnd;
}


@end
