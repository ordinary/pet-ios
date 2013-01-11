//
//  PetUICollectionViewCell.h
//  pet
//
//  Created by Home on 1/6/13.
//
//

#import <UIKit/UIKit.h>
#import "AsyncImageView.h"

@interface PetUICollectionViewCell: UICollectionViewCell{
    NSNumber * petId;
    NSNumber * price;
}

@property ( nonatomic,strong) AsyncImageView* imageView;
@property ( nonatomic,strong) NSNumber * petId;
@property ( nonatomic,strong) NSNumber * price;
@property ( nonatomic,strong) NSString * petUrl;


@end
