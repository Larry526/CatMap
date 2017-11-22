//
//  SearchViewController.h
//  CatsAssignmentSetup
//
//  Created by Larry Luk on 2017-11-21.
//  Copyright © 2017 Occasionally Cogent. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FetchDataDelegate <NSObject>

-(void)fetchData:(NSString*)fetchSearchString;

@end

@interface SearchViewController : UIViewController

@property (nonatomic, weak) id<FetchDataDelegate>delegate;


@end
