//
//  PetUnit.h
//  pet
//
//  Created by Home on 1/1/13.
//
//

#import <Foundation/Foundation.h>

@interface PetUnit : NSObject{
	
    NSString* clickUrl;
    
    NSString* picUrl;
    
    NSString* title;
    
    NSString* nick;
    
    NSInteger prize;
    
    NSInteger numIid;
    
    NSInteger sellerCreditScore;
}


@property (nonatomic,strong) NSString* clickUrl;

@property (nonatomic,strong) NSString* picUrl;

@property (nonatomic,strong) NSString* title;

@property (nonatomic,strong) NSString* nick;

@property (nonatomic,readwrite) NSInteger prize;

@property (nonatomic,readwrite) NSInteger numIid;

@property (nonatomic,readwrite) NSInteger sellerCreditScore;




@end
