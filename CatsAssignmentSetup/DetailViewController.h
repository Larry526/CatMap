//
//  DetailViewController.h
//  CatsAssignmentSetup
//
//  Created by Larry Luk on 2017-11-21.
//  Copyright © 2017 Occasionally Cogent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrPhoto.h"
#import "FlickrAPI.h"
#import <MapKit/MapKit.h>


@interface DetailViewController : UIViewController

@property (nonatomic, strong) FlickrPhoto *detailPhoto;
@property (weak, nonatomic) IBOutlet UINavigationItem *titleLabel;

@end
