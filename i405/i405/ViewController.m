//
//  ViewController.m
//  i405
//
//  Created by Inyoung Woo on 8/26/17.
//  Copyright © 2017 Inyoung Woo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *imgURL = @"https://images.wsdot.wa.gov/nwflow/flowmaps/I-405_ExpressTollLanes.gif";
    NSData *img = [NSData dataWithContentsOfURL:[NSURL URLWithString:imgURL]];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageWithData:img]];
    imgView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imgView];
    unsigned int hzMargin = 50, vzMargin = 50;
    NSString *hStr = [[NSString alloc] initWithFormat:@"H:|-%u-[imgView]-%u-|", hzMargin, hzMargin];
    NSString *vStr = [[NSString alloc] initWithFormat:@"V:|-%u-[imgView]-%u-|", vzMargin, vzMargin];
    NSDictionary *dictionary = NSDictionaryOfVariableBindings(imgView);
    NSArray *hConstraints = [NSLayoutConstraint constraintsWithVisualFormat:hStr
                                                                   options:0
                                                                   metrics:nil
                      	                                               views:dictionary];
    
    NSArray *vConstraints = [NSLayoutConstraint constraintsWithVisualFormat:vStr
                                                                   options:0    	                                                               metrics:nil
                                                                     views:dictionary];
    imgView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraints:hConstraints];
    [self.view addConstraints:vConstraints];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
