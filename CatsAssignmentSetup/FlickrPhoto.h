//
//  FlickrPhoto.h
//  CatsAssignmentSetup
//
//  Created by James Cash on 20-11-17.
//  Copyright © 2017 Occasionally Cogent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface FlickrPhoto : NSObject

@property (nonatomic,strong) NSString *flickrID;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSURL *url;
@property (nonatomic,assign) CLLocationCoordinate2D coordinate;
@property (nonatomic,strong) UIImage *image;

- (instancetype)initWithInfo:(NSDictionary*)info;


@end
