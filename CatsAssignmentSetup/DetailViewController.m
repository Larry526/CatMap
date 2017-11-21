//
//  DetailViewController.m
//  CatsAssignmentSetup
//
//  Created by Larry Luk on 2017-11-21.
//  Copyright © 2017 Occasionally Cogent. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <CLLocationManagerDelegate, MKMapViewDelegate>

@property (nonatomic, assign) CLLocationCoordinate2D currentCoordinate;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.detailPhoto.title;
    
    [FlickrAPI getCoordinate:self.detailPhoto.flickrID complete:^(CLLocationCoordinate2D results) {
        self.currentCoordinate = results;
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            MKCoordinateSpan span = MKCoordinateSpanMake(.5f, .5f);
            self.mapView.region = MKCoordinateRegionMake(self.currentCoordinate, span);
            MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
            [annotation setCoordinate:self.currentCoordinate];
            [annotation setTitle:self.detailPhoto.title]; //You can set the subtitle too
            [self.mapView addAnnotation:annotation];
            
        }];
        
        NSLog(@"Coordinate are (%.4f, %.4f).",self.currentCoordinate.latitude, self.currentCoordinate.longitude);

        }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setTitleLabel:(FlickrPhoto*)detailPhoto {
    _detailPhoto = detailPhoto;
}



@end
