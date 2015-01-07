//
//  ADAdaptableScroll.m
//  ADAdaptableScroll
//
//  Created by Alessandro dos Santos Pinto on 07/01/15.
//  Copyright (c) 2015 Alessandro dos Santos Pinto. All rights reserved.
//

#import "ADAdaptableScroll.h"

@interface ADAdaptableScroll()

@property(strong, nonatomic) NSMutableArray *buttons;
@property(strong, nonatomic) UIColor *modeColor;
@property(strong, nonatomic) NSArray *options;
@property(strong, nonatomic) UIScrollView *filterScrollView;
@property(strong, nonatomic) UIImageView *centralImageView;

@end

@implementation ADAdaptableScroll

- (instancetype)initWithFrame:(CGRect)frame withOptions:(NSArray *) options
               andAddressMode:(ETAddressMode) mode
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.buttons = [[NSMutableArray alloc] init];
        self.options = [[NSArray alloc] initWithArray:options];
        UIColor *yellow = [UIColor yellowColor];
        UIColor *green = [UIColor greenColor];
        self.modeColor = (mode == ETAddressModePickup) ? yellow : green;
        _centralImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hacker.jpg"]];
        _filterScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [_filterScrollView setScrollEnabled:YES];
        _filterScrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_filterScrollView];
        [self layoutFilterView];
    }
    
    return self;
}

#define MAX_SCREEN_BUTTONS 3

- (void) layoutFilterView
{
    float sizeWidthButton = 0.0f;
    
    if ([self.options count] <= MAX_SCREEN_BUTTONS)
    {
        sizeWidthButton = self.frame.size.width / [self.options count];
    }
    else
    {
        sizeWidthButton = self.frame.size.width / MAX_SCREEN_BUTTONS;
    }
    
    [_filterScrollView setContentSize:CGSizeMake(sizeWidthButton * [self.options count], self.frame.size.height)];
    
    for (int i = 0 ; i < [self.options count]; i++)
    {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i * sizeWidthButton, 0, sizeWidthButton, self.frame.size.height)];
        NSString *titleButton = [self.options objectAtIndex:i];
        [button setTag:i];
        [button setTitle:titleButton forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:18.0f];
        [button addTarget:self action:@selector(selectedFilter:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.buttons addObject:button];
        [self.filterScrollView addSubview:button];
    }
    
    [self selectedFilter:[self.buttons objectAtIndex:0]];
}

#define CENTRAL_IMAGE_BUTTON 4

- (void) selectedFilter:(UIButton *)sender
{
    for (UIButton *button in self.buttons)
    {
        if (button == sender)
        {
            CGRect frame = CGRectMake(sender.bounds.size.width / 2 - CENTRAL_IMAGE_BUTTON /2 ,
                                      25.f , CENTRAL_IMAGE_BUTTON, CENTRAL_IMAGE_BUTTON);
            [_centralImageView setFrame:frame];
            [sender addSubview:_centralImageView];
            [button setTitleColor:self.modeColor forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:18.0f];
        }
        else
        {
            button.titleLabel.font = [UIFont systemFontOfSize:18.0f];
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        }
    }
    
    self.selectedFilter = sender.tag;
    [_delegate selectedOption:sender.tag];
}

@end
