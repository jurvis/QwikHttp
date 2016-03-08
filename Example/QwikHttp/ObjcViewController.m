//
//  ObjcViewController.m
//  QwikHttp
//
//  Created by Logan Sease on 3/8/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

#import "ObjcViewController.h"
#import "QwikHttp_Example-Swift.h"
#import "UIAlertController+Helpers.h"
#import "QwikHttp-Swift.h"

@implementation ObjcViewController

-(void)viewDidLoad
{
    
    [[[[QwikHttpObjc alloc]init:@"http://resttest2016.herokuapp.com/restaurants" httpMethod:HttpRequestMethodGet] addUrlParams:@{@"format" : @"json"}]getStringResponse:^(NSString * data, NSError * error, QwikHttpObjc * request) {
       
        if(data)
        {
            NSArray * jsonArray = [NSArray fromJsonString:data];
            NSArray<Restaurant*> * results = [Restaurant arrayForJsonArray:jsonArray ofClass:[Restaurant class]];
            [UIAlertController showAlertWithTitle:@"Success" andMessage:[NSString stringWithFormat:@"Got %li",(long)results.count] from:self];
        }
    }];
}

-(IBAction)sendRequest:(id)sender
{
    [[[[QwikHttpObjc alloc]init:@"http://resttest2016.herokuapp.com/restaurants" httpMethod:HttpRequestMethodGet] addUrlParams:@{@"format" : @"json"}]getArrayResponse:^(NSArray * data, NSError * error, QwikHttpObjc * request) {
        
        if(data)
        {
            NSArray * restaurants = [Restaurant arrayForJsonArray:data ofClass:[Restaurant class]];
            [UIAlertController showAlertWithTitle:@"Success" andMessage:[NSString stringWithFormat:@"Got %li",(long)restaurants.count] from:self];
        }
    }];
}

@end
