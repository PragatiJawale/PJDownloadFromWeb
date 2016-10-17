//
//  ViewController.m
//  PJDownloadFromWeb
//
//  Created by Mac on 16/10/16.
//  Copyright © 2016 Pragati Jawale. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setUp];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setUp{
    
    self.myImageViewActivityIndicator .hidesWhenStopped =YES;
}



-(void)downloadImageFromURLString: (NSString *)urlString{
    [self.myImageViewActivityIndicator startAnimating];
    NSURL *URL =[NSURL URLWithString:urlString];
    NSURLSessionConfiguration * myConfigration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *mySession =[NSURLSession sessionWithConfiguration:myConfigration];
    NSURLSessionDownloadTask * myDownloadTask =[mySession downloadTaskWithURL:URL completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
           //alert
        }
        else{
            if (response) {
                NSHTTPURLResponse *httpResponse =(NSHTTPURLResponse *)response;
                if (httpResponse.statusCode ==200) {
                    NSData *imageData =[NSData dataWithContentsOfURL:location];
                    UIImage *myImage =[UIImage imageWithData:imageData];
                    [self performSelectorOnMainThread:@selector(reloadImage:) withObject:myImage waitUntilDone:NO];
                }
                else{
                    [self.myImageViewActivityIndicator stopAnimating];
                }
            }
            else{
                [self.myImageViewActivityIndicator stopAnimating];
            }
        }
        
    
    }];
    [myDownloadTask resume];
}
-(void)reloadImage:(UIImage *)myImage{
    [self.myImageViewActivityIndicator stopAnimating];
    self.myImageView.image =myImage;
}

- (IBAction)startAction:(id)sender {
    [self downloadImageFromURLString:kImageURLString];
}
@end
