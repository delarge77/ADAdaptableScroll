//
//  ViewController.m
//  ADAdaptableScroll
//
//  Created by Alessandro dos Santos Pinto on 07/01/15.
//  Copyright (c) 2015 Alessandro dos Santos Pinto. All rights reserved.
//

//typedef enum
//{
//    ETAddressModePickup,
//    ETAddressModeDestination,
//} ETAddressMode;

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) ADAdaptableScroll *adaptableScroll;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *options = @[@"OptionOne", @"OptionTwo", @"OptionOne", @"OptionTwo"];
    
    _adaptableScroll = [[ADAdaptableScroll alloc] initWithFrame:CGRectMake(0, 20, 320, 50) withOptions:options
                                                 andAddressMode:ETAddressModeDestination];
    _adaptableScroll.delegate = self;
    
    [self.view addSubview:_adaptableScroll];
    
}



- (void)selectedOption:(NSUInteger)option
{
//    ETSearchAddressType type = option;
//    switch (type) {
//        case ETSearchAddressTypeRecent:
//            [self loadRecents];
//            break;
//        case ETSearchAddressTypeFavorite:
//            [self loadFavorites];
//            break;
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
