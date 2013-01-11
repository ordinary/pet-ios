//
//  PetDetailViewController.h
//  pet
//
//  Created by Home on 1/8/13.
//
//

#import <UIKit/UIKit.h>

@interface PetDetailViewController : UIViewController{
    NSNumber *petId;
}

@property ( nonatomic,strong) NSNumber * petId;

@property ( nonatomic,strong) NSString * petUrl;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

- (IBAction)back:(id)sender;

@end
