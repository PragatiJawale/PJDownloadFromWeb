//
//  ViewController.h
//  PJDownloadFromWeb
//
//  Created by Mac on 16/10/16.
//  Copyright © 2016 Pragati Jawale. All rights reserved.
//
#define kImageURLString @"http://allpicts.in/wp-content/uploads/2015/09/Natural-3d-Images-for-Wallpaper-with-Butterfly-and-Flowers-600x375.jpg"

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *myImageView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *myImageViewActivityIndicator;
- (IBAction)startAction:(id)sender;


@end

