//
//  PetUICollectionViewCell.m
//  pet
//
//  Created by Home on 1/6/13.
//
//

#import "PetUICollectionViewCell.h"

@implementation PetUICollectionViewCell

@synthesize  petId;
@synthesize price;
@synthesize petUrl;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        AsyncImageView *asyncimageView = [[AsyncImageView alloc]initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
        [self.contentView addSubview:asyncimageView];
        _imageView = asyncimageView;
        
        self.imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        self.imageView.backgroundColor = [UIColor grayColor];
    }
    return self;
}


@end
