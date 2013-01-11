//
//  PetDetailViewController.m
//  pet
//
//  Created by Home on 1/8/13.
//
//

#import "PetDetailViewController.h"

@interface PetDetailViewController ()

@end

@implementation PetDetailViewController
@synthesize petId;
@synthesize petUrl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     self.webView.scalesPageToFit =YES;
    NSURL *url =[NSURL URLWithString:petUrl];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
    
    [self dismissModalViewControllerAnimated:TRUE];
}
- (void)viewDidUnload {
    [self setWebView:nil];
    [super viewDidUnload];
}
@end
