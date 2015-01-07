//
//  ADAdaptableScroll.h
//  ADAdaptableScroll
//
//  Created by Alessandro dos Santos Pinto on 07/01/15.
//  Copyright (c) 2015 Alessandro dos Santos Pinto. All rights reserved.
//

typedef enum
{
    ETAddressModePickup,
    ETAddressModeDestination,
} ETAddressMode;

#import <UIKit/UIKit.h>

@protocol ADAdaptableScrollViewDelegate <NSObject>

- (void) selectedOption:(NSUInteger) option;

@end

@interface ADAdaptableScroll : UIView<UIScrollViewDelegate>

- (instancetype)initWithFrame:(CGRect)frame withOptions:(NSArray *) options
               andAddressMode:(ETAddressMode) mode;

@property (nonatomic, assign) NSUInteger selectedFilter;
@property(unsafe_unretained, nonatomic) id<ADAdaptableScrollViewDelegate> delegate;

@end
