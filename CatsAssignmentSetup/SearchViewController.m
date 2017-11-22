//
//  SearchViewController.m
//  CatsAssignmentSetup
//
//  Created by Larry Luk on 2017-11-21.
//  Copyright © 2017 Occasionally Cogent. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backPressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)searchPressed:(UIButton *)sender {
    
    [self.delegate fetchData:self.searchTextField.text];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
