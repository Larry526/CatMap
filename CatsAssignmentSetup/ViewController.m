//
//  ViewController.m
//  CatsAssignmentSetup
//
//  Created by James Cash on 20-11-17.
//  Copyright © 2017 Occasionally Cogent. All rights reserved.
//

#import "ViewController.h"
#import "FlickrAPI.h"
#import "FlickrPhoto.h"
#import "CustomCollectionViewCell.h"
#import "DetailViewController.h"
#import "SearchViewController.h"

@interface ViewController () <UICollectionViewDataSource, FetchDataDelegate>
@property (nonatomic,weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic,strong) NSArray<FlickrPhoto*>* photos;
@property (nonatomic,strong) NSString *searchTag;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchData:@"Cats"];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.collectionView indexPathsForSelectedItems][0];
        FlickrPhoto *flickrPhoto = self.photos[indexPath.item];
        DetailViewController *controller = (DetailViewController*)[segue destinationViewController];
        [controller setDetailPhoto:flickrPhoto];
    }
    
    if([[segue identifier] isEqualToString:@"fetch"]){
        SearchViewController *controller = (SearchViewController *)[segue destinationViewController];
        controller.delegate = self;
    }
}

-(void)fetchData:(NSString *)fetchSearchString {
    self.searchTag = fetchSearchString;
    [FlickrAPI searchFor:fetchSearchString complete:^(NSArray *results) {
        self.photos = results;
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.collectionView reloadData];
        }];
    }];
}

#pragma mark - Collection View

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photos.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];

    FlickrPhoto *photo = self.photos[indexPath.item];

    [FlickrAPI loadImage:photo completionHandler:^(UIImage *image) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            cell.image.image = image;
            cell.label.text = photo.title;
        }];
    }];

    return cell;
}

@end
