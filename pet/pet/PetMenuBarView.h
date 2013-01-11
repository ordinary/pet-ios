//
//  LightMenuBarView.h
//  LightMenuBar
//
//  Created by Haoxiang on 6/10/11.
//  Copyright 2011 DEV. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PetMenuBar;
@protocol PetMenuBarDelegate;

@interface PetMenuBarView : UICollectionReusableView {

    id<PetMenuBarDelegate> __weak _delegate;
    NSUInteger _selectedItemIndex;
    
    PetMenuBar *__weak _menuBar; //< Weak Reference
    
    //< Parameters
    NSUInteger itemCount;
    
    CGFloat vPadding;
    CGFloat hPadding;
    CGFloat backgroundRad;
    CGFloat buttonRad;
    CGFloat sepWidth;
    CGFloat sepHeightRate;
    
    UIColor *backgoundColor;
    UIColor *buttonHighPetColor;
    UIColor *titleHighPetColor;
    UIColor *titleNormalColor;
    UIColor *sepColor;
    
    UIFont *titleFont;
    
    BOOL autoWidth;
    CGFloat averWidth;
    CGRect bkgrdRect;
    
//    int barAnimation;
}

@property (nonatomic, weak) PetMenuBar *menuBar;
@property (nonatomic, assign) NSUInteger selectedItemIndex;
@property (nonatomic, weak) id<PetMenuBarDelegate> delegate;

- (CGFloat)barLength;
- (void)fillParams;
- (void)render;
- (void)blink;

- (CGFloat)getCenterOfItemAtIndex:(NSInteger)index;

@end
