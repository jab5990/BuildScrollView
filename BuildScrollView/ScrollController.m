//
//  ScrollController.m
//  BuildScrollView
//
// Code is from http://oleb.net/blog/2014/04/understanding-uiscrollview/?utm_campaign=iOS_Dev_Weekly_Issue_144&utm_medium=email&utm_source=iOS%2BDev%2BWeekly


#import "ScrollController.h"

@implementation ScrollController

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self == nil) {
        return nil;
    }
    
    UIPanGestureRecognizer *gestureRecognizer = [[UIPanGestureRecognizer alloc]
                                                 initWithTarget:self action:@selector(handlePanGesture:)];
    [self addGestureRecognizer:gestureRecognizer];
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    redView.backgroundColor = [UIColor colorWithRed:0.815 green:0.007
                                               blue:0.105 alpha:1];
    
    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(150, 160, 150, 200)];
    greenView.backgroundColor = [UIColor colorWithRed:0.494 green:0.827
                                                 blue:0.129 alpha:1];
    
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(40, 400, 200, 150)];
    blueView.backgroundColor = [UIColor colorWithRed:0.29 green:0.564
                                                blue:0.886 alpha:1];
    
    UIView *yellowView = [[UIView alloc] initWithFrame:CGRectMake(100, 600, 180, 150)];
    yellowView.backgroundColor = [UIColor colorWithRed:0.972 green:0.905
                                                  blue:0.109 alpha:1];
    
    [self addSubview:redView];
    [self addSubview:greenView];
    [self addSubview:blueView];
    [self addSubview:yellowView];
    
    
    return self;
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)gestureRecognizer
{
    CGPoint translation = [gestureRecognizer translationInView:self];
    CGRect bounds = self.bounds;
    
    // Translate the view's bounds, but do not permit values that would violate contentSize
    CGFloat newBoundsOriginX = bounds.origin.x - translation.x;
    CGFloat minBoundsOriginX = 0.0;
    CGFloat maxBoundsOriginX = self.contentSize.width - bounds.size.width;
    bounds.origin.x = fmax(minBoundsOriginX, fmin(newBoundsOriginX, maxBoundsOriginX));
    
    CGFloat newBoundsOriginY = bounds.origin.y - translation.y;
    CGFloat minBoundsOriginY = 0.0;
    CGFloat maxBoundsOriginY = self.contentSize.height - bounds.size.height;
    bounds.origin.y = fmax(minBoundsOriginY, fmin(newBoundsOriginY, maxBoundsOriginY));
    
    self.bounds = bounds;
    [gestureRecognizer setTranslation:CGPointZero inView:self];
}

@end
