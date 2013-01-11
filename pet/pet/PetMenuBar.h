//
//  LightMenuBar.h
//  LightMenuBar
//
//  Created by Haoxiang on 6/9/11.
//  Copyright 2011 DEV. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    PetMenuBarStyleItem,  /**< After tapping on an item, the item is highlighted */
    PetMenuBarStyleButton /**< When tapping on an item, the item is highlighted, after tapping, the item state changed to normal */
} PetMenuBarStyle;

@class PetMenuBarView;
@protocol PetMenuBarDelegate;

@interface PetMenuBar : UICollectionReusableView {
    PetMenuBarView *_menuBarView;
    UIScrollView *_scrollView;
    PetMenuBarStyle _style;
}

@property (nonatomic, assign) NSUInteger selectedItemIndex;
@property (nonatomic, weak) id<PetMenuBarDelegate> delegate;
@property (nonatomic, readonly) PetMenuBarView *menuBarView;
@property (nonatomic, readonly) PetMenuBarStyle barStyle;

@property (nonatomic, assign) BOOL bounces; // defaults to NO


- (id)initWithFrame:(CGRect)frame andStyle:(PetMenuBarStyle)barStyle;

- (void)setSelectedItemIndex:(NSUInteger)itemIndex animated:(BOOL)animated notifyDelegate:(BOOL)notifyDelegate;

- (void)handleAutoScrolling:(BOOL)animated;

@end
