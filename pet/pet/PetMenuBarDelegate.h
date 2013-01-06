//
//  LightMenuBarDelegate.h
//  LightMenuBar
//
//  Created by Haoxiang on 6/9/11.
//  Copyright 2011 DEV. All rights reserved.
//

#import <UIKit/UIKit.h>

//typedef enum {
//    LightMenuBarAnimationNone,
//    LightMenuBarAnimationFade,
//    LightMenuBarAnimationSlide,
//    LightMenuBarAnimationBounce,
//    LightMenuBarAnimationUnderline
//} LightMenuBarAnimation;

@class PetMenuBar;

@protocol PetMenuBarDelegate

@required

- (NSUInteger)itemCountInMenuBar:(PetMenuBar *)menuBar;
- (NSString *)itemTitleAtIndex:(NSUInteger)index inMenuBar:(PetMenuBar *)menuBar;
- (void)itemSelectedAtIndex:(NSUInteger)index inMenuBar:(PetMenuBar *)menuBar;

@optional

/**< Whether an Item is selectable, by Default return YES */
- (BOOL)itemSelectableAtIndex:(NSUInteger)index inMenuBar:(PetMenuBar *)menuBar;

/**< Customize the Width of Each Item, by Default each item is of the same width */
- (CGFloat)itemWidthAtIndex:(NSUInteger)index inMenuBar:(PetMenuBar *)menuBar;

/****************************************************************************/
//< For Background Area
/****************************************************************************/

/**< Top and Bottom Padding, by Default 5.0f */
- (CGFloat)verticalPaddingInMenuBar:(PetMenuBar *)menuBar;

/**< Left and Right Padding, by Default 5.0f */
- (CGFloat)horizontalPaddingInMenuBar:(PetMenuBar *)menuBar;

/**< Corner Radius of the background Area, by Default 5.0f */
- (CGFloat)cornerRadiusOfBackgroundInMenuBar:(PetMenuBar *)menuBar;

/**< Color of Background, by Default RGB Code 0xe9f4e9 */
- (UIColor *)colorOfBackgroundInMenuBar:(PetMenuBar *)menuBar;

/****************************************************************************/
//< For Button 
/****************************************************************************/

/**< Corner Radius of the Button highlight Area, by Default 5.0f */
- (CGFloat)cornerRadiusOfButtonInMenuBar:(PetMenuBar *)menuBar;

/**< Color of Button in Highlight State, by Default RGB Code 0x4d9c5d */
- (UIColor *)colorOfButtonHighPetInMenuBar:(PetMenuBar *)menuBar;

/**< Color of Button Title in Normal State, by Default RGB Code 0x4d9c5d */
- (UIColor *)colorOfTitleNormalInMenuBar:(PetMenuBar *)menuBar;

/**< Color of Button Title in Highlight State, by Default RGB Code 0xe9f4e9 */
- (UIColor *)colorOfTitleHighPetInMenuBar:(PetMenuBar *)menuBar;

/**< Font for Button Title, by Default [UIFont systemFontOfSize:12.0f] */
- (UIFont *)fontOfTitleInMenuBar:(PetMenuBar *)menuBar;

/****************************************************************************/
//< For Seperator 
/****************************************************************************/

/**< Color of Seperator, by Default White */
- (UIColor *)seperatorColorInMenuBar:(PetMenuBar *)menuBar;

/**< Width of Seperator, by Default 1.0f */
- (CGFloat)seperatorWidthInMenuBar:(PetMenuBar *)menuBar;

/**< Height Rate of Seperator, by Default 0.7f */
- (CGFloat)seperatorHeightRateInMenuBar:(PetMenuBar *)menuBar;


///****************************************************************************/
////< Animation Type
///****************************************************************************/
//
///**< Animation Type when an item Button is tapped, by Default LightMenuBarAnimationSlide */
//- (LightMenuBarAnimation)animationForMenuBar:(LightMenuBar *)menuBar;

@end
