//
//  FlickrPhoto.m
//  CatsAssignmentSetup
//
//  Created by James Cash on 20-11-17.
//  Copyright © 2017 Occasionally Cogent. All rights reserved.
//

#import "FlickrPhoto.h"

@implementation FlickrPhoto

- (instancetype)initWithInfo:(NSDictionary *)info
{
    self = [super init];
    if (self) {
        _flickrID = info[@"id"];
        _url = [NSURL URLWithString:info[@"url_m"]];
        _title = info[@"title"];
    }
    return self;
}

@end
