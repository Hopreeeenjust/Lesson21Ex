//
//  ViewController.m
//  Lesson21Ex
//
//  Created by Hopreeeeenjust on 04.01.15.
//  Copyright (c) 2015 Hopreeeeenjust. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) UIView *view1;
@property (weak, nonatomic) UIView *view2;
@property (weak, nonatomic) UIView *view3;
@property (weak, nonatomic) UIView *view4;
@property (weak, nonatomic) IBOutlet UIView *cornerView1;
@property (weak, nonatomic) IBOutlet UIView *cornerView2;
@property (weak, nonatomic) IBOutlet UIView *cornerView3;
@property (weak, nonatomic) IBOutlet UIView *cornerView4;
@property (weak, nonatomic) UIImageView *imageView;
@property (weak, nonatomic) UIImageView *background;
@property (strong, nonatomic) UIImageView *money;
@property (strong, nonatomic) UIImageView *bag;
@property (strong, nonatomic) UIImageView *hand;
@property (weak, nonatomic) UIImageView *car;
@property (weak, nonatomic) UIImageView *wheel1;
@property (weak, nonatomic) UIImageView *wheel2;
@property (weak, nonatomic) UIImageView *lantern;
@property (strong, nonatomic) NSArray *array;

@end

static NSInteger n;
CGFloat factor = 1.2f;

@implementation ViewController

#pragma mark - View

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    NSInteger indent = (CGRectGetHeight(self.view.bounds) - 4 * 100) / 5;
    UIView *view1 = [UIView new];
    view1.frame = CGRectMake(0, 1 * (100 + indent) - 100, 100, 100);
    view1.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view1];
    self.view1 = view1;
    
    UIView *view2 = [UIView new];
    view2.frame = CGRectMake(0, 2 * (100 + indent) - 100, 100, 100);
    view2.backgroundColor = [UIColor redColor];
    [self.view addSubview:view2];
    self.view2 = view2;

    UIView *view3 = [UIView new];
    view3.frame = CGRectMake(0, 3 * (100 + indent) - 100, 100, 100);
    view3.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view3];
    self.view3 = view3;

    UIView *view4 = [UIView new];
    view4.frame = CGRectMake(0, 4 * (100 + indent) - 100, 100, 100);
    view4.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view4];
    self.view4 = view4;
    */
    UIImage *back = [UIImage imageNamed:@"Background.png"];
    UIImageView *background = [[UIImageView alloc] initWithImage:back];
    [self.view addSubview:background];
    self.background = background;
    
    UIImage *moneyImage = [UIImage imageNamed:@"money2.png"];
    UIImageView *money = [[UIImageView alloc] initWithImage:moneyImage];
    money.frame = CGRectMake(-100, -100, 99, 66);
    [background addSubview:money];
    self.money = money;
    
    UIImageView *carView = [UIImageView new];
    [background addSubview:carView];
    self.car = carView;
    
    UIImageView *wheel1 = [UIImageView new];
    [carView addSubview:wheel1];
    self.wheel1 = wheel1;
    
    UIImageView *wheel2 = [UIImageView new];
    [carView addSubview:wheel2];
    self.wheel2 = wheel2;
    
    
    UIImageView *bag = [UIImageView new];
    self.bag = bag;
    
    UIImageView *hand = [UIImageView new];
    self.hand = hand;
    
    UIImageView *imageView = [UIImageView new];
    imageView.frame = CGRectMake(0, CGRectGetMaxY(self.view.bounds) - 320, 240, 320);
    [background addSubview:imageView];
    self.imageView = imageView;
    [self.imageView addSubview:bag];
    [self.imageView addSubview:hand];
    
    UIImage *lantern = [UIImage imageNamed:@"Lantern.png"];
    UIImageView *lanternView = [[UIImageView alloc] initWithImage:lantern];
    [background addSubview:lanternView];
    self.lantern = lanternView;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    /*
    [self animatedView:self.view1 withOptions:UIViewAnimationOptionCurveEaseInOut];
    [self animatedView:self.view2 withOptions:UIViewAnimationOptionCurveEaseIn];
    [self animatedView:self.view3 withOptions:UIViewAnimationOptionCurveEaseOut];
    [self animatedView:self.view4 withOptions:UIViewAnimationOptionCurveLinear];
    */
    /*
     [self moveCornerViews:self.cornerView1 :self.cornerView2 :self.cornerView3 :self.cornerView4];
    */
    n = 0;
    [self takeMoney];

}

#pragma mark - Memory warning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Help methds

- (void)animatedView:(UIView *)view withOptions:(UIViewAnimationOptions)options {
    [UIView animateWithDuration:5.f
                          delay:1.f
                        options:options | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         view.center = CGPointMake(CGRectGetWidth(self.view.bounds) - CGRectGetWidth(view.frame) / 2, CGRectGetMinY(view.frame) + CGRectGetHeight(view.frame) / 2);
                         view.backgroundColor = [self randomColor];
                     }
                     completion:^(BOOL finished) {
                     }];
}

- (UIColor *)randomColor {
    CGFloat r = (float)arc4random_uniform(256) / 255;
    CGFloat g = (float)arc4random_uniform(256) / 255;
    CGFloat b = (float)arc4random_uniform(256) / 255;
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}

- (void)moveCornerViews:(UIView *)view1 :(UIView *)view2 :(UIView *)view3 :(UIView *)view4 {
    self.view1 = view1;
    self.view2 = view2;
    self.view3 = view3;
    self.view4 = view4;
    BOOL clockwise = arc4random_uniform(2);
    if (clockwise) {
        [self clockwiseViewsExchange];
    } else {
        [self counterclockwiseViewsExchange];
    }
}

- (void)clockwiseViewsExchange {
    CGRect frame1 =  self.view1.frame;
    UIColor *color1 = self.view1.backgroundColor;
    CGRect frame2 =  self.view2.frame;
    UIColor *color2 = self.view2.backgroundColor;
    CGRect frame3 =  self.view3.frame;
    UIColor *color3 = self.view3.backgroundColor;
    CGRect frame4 =  self.view4.frame;
    UIColor *color4 = self.view4.backgroundColor;
    [UIView animateWithDuration:3.f
                          delay:0.f
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.view1.frame = frame4;
                         self.view1.backgroundColor = color4;
                         self.view2.frame = frame1;
                         self.view2.backgroundColor = color1;
                         self.view3.frame = frame2;
                         self.view3.backgroundColor = color2;
                         self.view4.frame = frame3;
                         self.view4.backgroundColor = color3;
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             [self moveCornerViews:self.view1 :self.view2 :self.view3 :self.view4];
                         }
                     }];
}

- (void)counterclockwiseViewsExchange {
    CGRect frame1 =  self.view1.frame;
    UIColor *color1 = self.view1.backgroundColor;
    CGRect frame2 =  self.view2.frame;
    UIColor *color2 = self.view2.backgroundColor;
    CGRect frame3 =  self.view3.frame;
    UIColor *color3 = self.view3.backgroundColor;
    CGRect frame4 =  self.view4.frame;
    UIColor *color4 = self.view4.backgroundColor;
    [UIView animateWithDuration:3.f
                          delay:0.f
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.view1.frame = frame2;
                         self.view1.backgroundColor = color2;
                         self.view2.frame = frame3;
                         self.view2.backgroundColor = color3;
                         self.view3.frame = frame4;
                         self.view3.backgroundColor = color4;
                         self.view4.frame = frame1;
                         self.view4.backgroundColor = color1;
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             [self moveCornerViews:self.view1 :self.view2 :self.view3 :self.view4];
                         }
                     }];
}

- (void)layerPriorityOfView:(UIImageView *)view1 andView:(UIImageView *)view2 {
    if ([[view1 superview] isEqual:[view2 superview]]) {
        if (CGRectGetMinY(view1.frame) < CGRectGetMinY(view2.frame)) {
            [[view1 superview] insertSubview:view2 aboveSubview:view1];
        } else {
            [[view2 superview] insertSubview:view1 aboveSubview:view2];
        }
    } else
        nil;
}

#pragma mark - Robber methods

- (void)moveLeft {
    UIImage *image1 = [UIImage imageNamed:@"robber1.png"];
    UIImage *image2 = [UIImage imageNamed:@"robber2.png"];
    UIImage *image3 = [UIImage imageNamed:@"robber3.png"];
    UIImage *image4 = [UIImage imageNamed:@"robber1f.png"];
    UIImage *image5 = [UIImage imageNamed:@"robber2f.png"];
    UIImage *image6 = [UIImage imageNamed:@"robber3f.png"];
    NSArray *array  = @[image1, image2, image3, image2, image4, image5, image6, image5];
    self.imageView.animationImages = array;
    self.imageView.animationDuration = 2.f;
    [self.imageView startAnimating];
}

-(void)moveRight {
    UIImage *image1 = [UIImage imageNamed:@"robber1r.png"];
    UIImage *image2 = [UIImage imageNamed:@"robber2r.png"];
    UIImage *image3 = [UIImage imageNamed:@"robber3r.png"];
    UIImage *image4 = [UIImage imageNamed:@"robber1rf.png"];
    UIImage *image5 = [UIImage imageNamed:@"robber2rf.png"];
    UIImage *image6 = [UIImage imageNamed:@"robber3rf.png"];
    NSArray *array  = @[image1, image2, image3, image2, image4, image5, image6, image5];
    self.imageView.animationImages = array;
    self.imageView.animationDuration = 2.f;
    [self.imageView startAnimating];
}

-(void)takeMoney {
    if (n < 10) {
        [self randomMoneyPosition];
        [self initWithBag];
        [UIImageView animateWithDuration:2.f
                                   delay:0.f
                                 options:UIViewAnimationOptionCurveLinear
                              animations:^{
                                  [self moveToMoney];
                              }
                              completion:^(BOOL finished) {
                                  [self takeMoney];
                              }];
    } else {
        NSArray *array = [self.imageView animationImages];
        UIImage *stopImage = [array objectAtIndex:1];
        [self.imageView stopAnimating];
        self.imageView.image = stopImage;
        [self.money removeFromSuperview];
        [self giveMoney];
    }
}

- (void)moveToMoney {
    if (CGRectGetMidX(self.imageView.frame) < CGRectGetMidX(self.money.frame)) {
        [self moveRight];
        self.imageView.frame = CGRectMake(CGRectGetMidX(self.money.frame) - CGRectGetWidth(self.imageView.frame), CGRectGetMidY(self.money.frame) - CGRectGetHeight(self.imageView.frame) / 2, CGRectGetWidth(self.imageView.frame), CGRectGetHeight(self.imageView.frame));
    } else {
        [self moveLeft];
        self.imageView.frame = CGRectMake(CGRectGetMidX(self.money.frame), CGRectGetMidY(self.money.frame) - CGRectGetHeight(self.imageView.frame) / 2, CGRectGetWidth(self.imageView.frame), CGRectGetHeight(self.imageView.frame));
    }
}

- (void)moveToCar {
    self.imageView.image = nil;
    [self takeFullBag];
    [UIImageView animateWithDuration:2.f
                               delay:0.f
                             options:UIViewAnimationOptionCurveLinear
                          animations:^{
                              if (CGRectGetMinX(self.imageView.frame) < CGRectGetMinX(self.car.frame)) {
                                  [self moveRight];
                                  self.imageView.frame = CGRectMake(CGRectGetMinX(self.car.frame) - CGRectGetWidth(self.imageView.frame), CGRectGetMidY(self.car.frame) - CGRectGetHeight(self.imageView.frame) / 2, CGRectGetWidth(self.imageView.frame), CGRectGetHeight(self.imageView.frame));
                              } else {
                                  [self moveLeft];
                                  self.imageView.frame = CGRectMake(CGRectGetMaxX(self.car.frame), CGRectGetMidY(self.car.frame) - CGRectGetHeight(self.imageView.frame) / 2, CGRectGetWidth(self.imageView.frame), CGRectGetHeight(self.imageView.frame));
                              }
                          }
                          completion:^(BOOL finished) {
                              self.array = [self.imageView animationImages];
                              UIImage *stopImage = [self.array objectAtIndex:5];
                              [self.imageView stopAnimating];
                              self.imageView.image = stopImage;
                              [self emptyBag];
                              [self performSelector:@selector(carGoesAway) withObject:nil afterDelay:1.f];
                          }];
}

- (void)giveMoney {
    [self giveCar];
}

#pragma mark - Money methods

- (void)randomMoneyPosition {
    CGRect rect = CGRectMake(CGRectGetMinX(self.view.bounds), CGRectGetMaxY(self.view.bounds) / 3, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) * 5 / 9);
    rect = CGRectInset(rect, CGRectGetWidth(self.money.frame) * 1.5f, CGRectGetHeight(self.money.frame) * 1.5f);
    NSInteger x = arc4random_uniform(CGRectGetWidth(rect) + 1) + CGRectGetMinX(rect);
    NSInteger y = arc4random_uniform(CGRectGetHeight(rect) + 1) + CGRectGetMinY(rect);
    self.money.center = CGPointMake(x + CGRectGetWidth(self.money.frame) / 2, y + CGRectGetHeight(self.money.frame) / 2);
}

#pragma mark - Bag methods

- (void)initWithBagWhileMoovingLeft {
    UIImage *hand = [UIImage imageNamed:@"HandL.png"];
    self.hand.frame = CGRectMake(CGRectGetMinX(self.imageView.bounds) + 85, CGRectGetMinY(self.imageView.bounds) - 49, 240, 320);
    self.hand.image = hand;
    if (n == 0) {
        UIImage *bag = [UIImage imageNamed:@"Bag1.png"];
        self.bag.frame = CGRectMake(CGRectGetMaxX(self.imageView.bounds) - 50, CGRectGetMinY(self.imageView.bounds) + 120, 60, 60);
        self.bag.image = bag;
        n++;
    } else if (n == 1) {
        UIImage *bag = [UIImage imageNamed:@"Bag2.png"];
        self.bag.frame = CGRectMake(CGRectGetMaxX(self.imageView.bounds) - 50, CGRectGetMinY(self.imageView.bounds) + 115, 75, 75);
        self.bag.image = bag;
        n++;
    } else if (n == 2) {
        UIImage *bag = [UIImage imageNamed:@"Bag3.png"];
        self.bag.frame = CGRectMake(CGRectGetMaxX(self.imageView.bounds) - 53, CGRectGetMinY(self.imageView.bounds) + 114, 90, 90);
        self.bag.image = bag;
        n++;
    } else if (n == 3) {
        UIImage *bag = [UIImage imageNamed:@"Bag4.png"];
        self.bag.frame = CGRectMake(CGRectGetMaxX(self.imageView.bounds) - 55, CGRectGetMinY(self.imageView.bounds) + 109, 105, 105);
        self.bag.image = bag;
        n++;
    } else if (n == 4) {
        UIImage *bag = [UIImage imageNamed:@"Bag5.png"];
        self.bag.frame = CGRectMake(CGRectGetMaxX(self.imageView.bounds) - 60, CGRectGetMinY(self.imageView.bounds) + 109, 120, 120);
        self.bag.image = bag;
        n++;
    } else if (n == 5) {
        UIImage *bag = [UIImage imageNamed:@"Bag6.png"];
        self.bag.frame = CGRectMake(CGRectGetMaxX(self.imageView.bounds) - 60, CGRectGetMinY(self.imageView.bounds) + 109, 135, 135);
        self.bag.image = bag;
        n++;
    } else if (n == 6) {
        UIImage *bag = [UIImage imageNamed:@"Bag7.png"];
        self.bag.frame = CGRectMake(CGRectGetMaxX(self.imageView.bounds) - 62, CGRectGetMinY(self.imageView.bounds) + 109, 150, 150);
        self.bag.image = bag;
        n++;
    } else if (n == 7) {
        UIImage *bag = [UIImage imageNamed:@"Bag8.png"];
        self.bag.frame = CGRectMake(CGRectGetMaxX(self.imageView.bounds) - 62, CGRectGetMinY(self.imageView.bounds) + 100, 160, 160);
        self.bag.image = bag;
        n++;
    } else if (n == 8) {
        UIImage *bag = [UIImage imageNamed:@"Bag9.png"];
        self.bag.frame = CGRectMake(CGRectGetMaxX(self.imageView.bounds) - 65, CGRectGetMinY(self.imageView.bounds) + 100, 170, 170);
        self.bag.image = bag;
        n++;
    } else if (n == 9) {
        UIImage *bag = [UIImage imageNamed:@"Bag10.png"];
        self.bag.frame = CGRectMake(CGRectGetMaxX(self.imageView.bounds) - 65, CGRectGetMinY(self.imageView.bounds) + 100, 180, 180);
        self.bag.image = bag;
        n++;
    } else if (n == 10) {
        UIImage *bag = [UIImage imageNamed:@"Bag1.png"];
        self.bag.frame = CGRectMake(CGRectGetMaxX(self.imageView.bounds) - 50, CGRectGetMinY(self.imageView.bounds) + 120, 60, 60);
        self.bag.image = bag;
    }
}

- (void)initWithBagWhileMoovingRight {
    UIImage *hand = [UIImage imageNamed:@"HandR.png"];
    self.hand.frame = CGRectMake(CGRectGetMinX(self.imageView.bounds) - 64, CGRectGetMinY(self.imageView.bounds) - 49, 240, 320);
    self.hand.image = hand;
    if (n == 0) {
        UIImage *bag = [UIImage imageNamed:@"Bag1r.png"];
        self.bag.frame = CGRectMake(CGRectGetMinX(self.imageView.bounds) - 15, CGRectGetMinY(self.imageView.bounds) + 112, 60, 60);
        self.bag.image = bag;
        n++;
    } else if (n == 1) {
        UIImage *bag = [UIImage imageNamed:@"Bag2r.png"];
        self.bag.frame = CGRectMake(CGRectGetMinX(self.imageView.bounds) - 28, CGRectGetMinY(self.imageView.bounds) + 112, 75, 75);
        self.bag.image = bag;
        n++;
    } else if (n == 2) {
        UIImage *bag = [UIImage imageNamed:@"Bag3r.png"];
        self.bag.frame = CGRectMake(CGRectGetMinX(self.imageView.bounds) - 36, CGRectGetMinY(self.imageView.bounds) + 107, 90, 90);
        self.bag.image = bag;
        n++;
    } else if (n == 3) {
        UIImage *bag = [UIImage imageNamed:@"Bag4r.png"];
        self.bag.frame = CGRectMake(CGRectGetMinX(self.imageView.bounds) - 40, CGRectGetMinY(self.imageView.bounds) + 107, 105, 105);
        self.bag.image = bag;
        n++;
    } else if (n == 4) {
        UIImage *bag = [UIImage imageNamed:@"Bag5r.png"];
        self.bag.frame = CGRectMake(CGRectGetMinX(self.imageView.bounds) - 55, CGRectGetMinY(self.imageView.bounds) + 107, 120, 120);
        self.bag.image = bag;
        n++;
    } else if (n == 5) {
        UIImage *bag = [UIImage imageNamed:@"Bag6r.png"];
        self.bag.frame = CGRectMake(CGRectGetMinX(self.imageView.bounds) - 70, CGRectGetMinY(self.imageView.bounds) + 107, 135, 135);
        self.bag.image = bag;
        n++;
    } else if (n == 6) {
        UIImage *bag = [UIImage imageNamed:@"Bag7r.png"];
        self.bag.frame = CGRectMake(CGRectGetMinX(self.imageView.bounds) - 90, CGRectGetMinY(self.imageView.bounds) + 107, 150, 150);
        self.bag.image = bag;
        n++;
    } else if (n == 7) {
        UIImage *bag = [UIImage imageNamed:@"Bag8r.png"];
        self.bag.frame = CGRectMake(CGRectGetMinX(self.imageView.bounds) - 91, CGRectGetMinY(self.imageView.bounds) + 107, 160, 160);
        self.bag.image = bag;
        n++;
    } else if (n == 8) {
        UIImage *bag = [UIImage imageNamed:@"Bag9r.png"];
        self.bag.frame = CGRectMake(CGRectGetMinX(self.imageView.bounds) - 101, CGRectGetMinY(self.imageView.bounds) + 100, 170, 170);
        self.bag.image = bag;
        n++;
    } else if (n == 9) {
        UIImage *bag = [UIImage imageNamed:@"Bag10r.png"];
        self.bag.frame = CGRectMake(CGRectGetMinX(self.imageView.bounds) - 116, CGRectGetMinY(self.imageView.bounds) + 100, 185, 185);
        self.bag.image = bag;
        n++;
    } else if (n == 10) {
        UIImage *bag = [UIImage imageNamed:@"Bag1r.png"];
        self.bag.frame = CGRectMake(CGRectGetMinX(self.imageView.bounds) - 15, CGRectGetMinY(self.imageView.bounds) + 112, 60, 60);
        self.bag.image = bag;
    }
}

- (void)initWithBag {
    if (CGRectGetMidX(self.imageView.frame) < CGRectGetMidX(self.money.frame)) {
        [self initWithBagWhileMoovingRight];
    } else {
        [self initWithBagWhileMoovingLeft];
    }
}

- (void)initWithNewBag {
    if (CGRectGetMidX(self.imageView.frame) < CGRectGetMidX(self.car.frame)) {
        [self initWithBagWhileMoovingRight];
    } else {
        [self initWithBagWhileMoovingLeft];
    }
}

- (void)takeFullBag {
    if (CGRectGetMidX(self.imageView.frame) < CGRectGetMidX(self.car.frame)) {
        UIImage *hand = [UIImage imageNamed:@"HandR.png"];
        self.hand.frame = CGRectMake(CGRectGetMinX(self.imageView.bounds) - 64, CGRectGetMinY(self.imageView.bounds) - 49, 240, 320);
        self.hand.image = hand;
        UIImage *bag = [UIImage imageNamed:@"Bag10r.png"];
        self.bag.frame = CGRectMake(CGRectGetMinX(self.imageView.bounds) - 116, CGRectGetMinY(self.imageView.bounds) + 100, 185, 185);
        self.bag.image = bag;
    } else {
        UIImage *hand = [UIImage imageNamed:@"HandL.png"];
        self.hand.frame = CGRectMake(CGRectGetMinX(self.imageView.bounds) + 85, CGRectGetMinY(self.imageView.bounds) - 49, 240, 320);
        self.hand.image = hand;
        UIImage *bag = [UIImage imageNamed:@"Bag10.png"];
        self.bag.frame = CGRectMake(CGRectGetMaxX(self.imageView.bounds) - 65, CGRectGetMinY(self.imageView.bounds) + 100, 180, 180);
        self.bag.image = bag;
    }
}

- (void)emptyBag {
    [self.bag removeFromSuperview];
    [self.hand removeFromSuperview];
    [self.imageView stopAnimating];
    if (CGRectGetMidX(self.imageView.frame) < CGRectGetMidX(self.car.frame)) {
        UIImage *putMoney = [UIImage imageNamed:@"robber2rcar.png"];
        self.imageView.image = putMoney;
    } else {
        UIImage *putMoney = [UIImage imageNamed:@"robber2car.png"];
        self.imageView.image = putMoney;
    }
}

#pragma mark - Car methods

- (void)giveCar {
    UIImage *carR = [UIImage imageNamed:@"car1R.png"];
    UIImage *carL = [UIImage imageNamed:@"car1L.png"];
    UIImage *car2R = [UIImage imageNamed:@"car2R.png"];
    UIImage *car2L = [UIImage imageNamed:@"car2L.png"];
    self.wheel1.transform = CGAffineTransformMakeRotation(0);
    self.wheel2.transform = CGAffineTransformMakeRotation(0);
    if (CGRectGetMidX(self.imageView.frame) < CGRectGetMidX(self.view.bounds)) {
        self.car.frame = CGRectMake(- 448 * factor, CGRectGetHeight(self.view.bounds) / 4 * 3 - 257, 448 * factor, 307 * factor);
        self.car.image = carR;
        [self initWithTurningWeels];
        [self layerPriorityOfView:self.imageView andView:self.car];
        [UIImageView animateWithDuration:4.f
                                   delay:0.f
                                 options:UIViewAnimationOptionCurveLinear
                              animations:^{
                                  self.car.frame = CGRectMake(CGRectGetWidth(self.view.bounds) -CGRectGetWidth(self.car.frame), CGRectGetMinY(self.car.frame), CGRectGetWidth(self.car.frame), CGRectGetHeight(self.car.frame));
                                  self.wheel1.transform = CGAffineTransformMakeRotation(M_PI);
                                  self.wheel2.transform = CGAffineTransformMakeRotation(M_PI);
                              }
                              completion:^(BOOL finished) {
                                  self.car.image = car2R;
                                  [self moveToCar];
                              }];
    } else {
        self.car.frame = CGRectMake(CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) / 4 * 3 - 257, 448 * factor, 307 * factor);
        self.car.image = carL;
        [self initWithTurningWeels];
        [self layerPriorityOfView:self.imageView andView:self.car];
        [UIImageView animateWithDuration:4.f
                                   delay:0.f
                                 options:UIViewAnimationOptionCurveLinear
                              animations:^{
                                  self.car.frame = CGRectMake(0, CGRectGetMinY(self.car.frame), CGRectGetWidth(self.car.frame), CGRectGetHeight(self.car.frame));
                                  self.wheel1.transform = CGAffineTransformMakeRotation(-3.14);
                                  self.wheel2.transform = CGAffineTransformMakeRotation(-3.14);
                              }
                              completion:^(BOOL finished) {
                                  self.car.image = car2L;
                                  [self moveToCar];
                              }];
    }
}

- (void)initWithTurningWeels {
    self.wheel1.frame = CGRectMake(52 * factor, CGRectGetHeight(self.car.bounds) - 116 * factor, 70 * factor, 70 * factor);
    self.wheel1.image = [UIImage imageNamed:@"wheelR"];
    self.wheel2.frame = CGRectMake(CGRectGetWidth(self.car.frame) - (52 + 70) * factor, CGRectGetHeight(self.car.bounds) - 116 * factor, 70 * factor, 70 *factor);
    self.wheel2.image = [UIImage imageNamed:@"wheelL"];
}

- (void)carGoesAway {
    UIImage *carR = [UIImage imageNamed:@"car1R.png"];
    UIImage *carL = [UIImage imageNamed:@"car1L.png"];
    __weak UIImageView *bag = self.bag;
    __weak UIImageView *hand = self.hand;
    [self.imageView addSubview:bag];
    [self.imageView addSubview:hand];
    self.imageView.image = nil;
    [self initWithNewBag];
    if (CGRectGetMidX(self.imageView.frame) < CGRectGetMidX(self.view.bounds)) {
        self.car.image = carR;
        self.imageView.image = [self.array objectAtIndex:5];
    } else {
        self.car.image = carL;
        self.imageView.image = [self.array objectAtIndex:5];
    }
    self.wheel1.transform = CGAffineTransformMakeRotation(0);
    self.wheel2.transform = CGAffineTransformMakeRotation(0);
    [UIImageView animateWithDuration:2.f
                               delay:0.f
                             options:UIViewAnimationOptionCurveLinear
                          animations:^{
                              if (CGRectGetMidX(self.imageView.frame) < CGRectGetMidX(self.view.bounds)) {
                                  self.car.frame = CGRectMake(CGRectGetWidth(self.view.bounds), CGRectGetMinY(self.car.frame), CGRectGetWidth(self.car.frame), CGRectGetHeight(self.car.frame));
                                  self.wheel1.transform = CGAffineTransformMakeRotation(M_PI);
                                  self.wheel2.transform = CGAffineTransformMakeRotation(M_PI);
                              } else {
                                  self.car.frame = CGRectMake(-448 * factor, CGRectGetMinY(self.car.frame), CGRectGetWidth(self.car.frame), CGRectGetHeight(self.car.frame));
                                  self.wheel1.transform = CGAffineTransformMakeRotation(-3.14);
                                  self.wheel2.transform = CGAffineTransformMakeRotation(-3.14);                         }
                          }
                          completion:^(BOOL finished) {
                              __weak UIImageView *money = self.money;
                              [self.background addSubview:money];
                              [self.background insertSubview:self.imageView aboveSubview:money];
                              [self.background insertSubview:self.lantern aboveSubview:self.imageView];
                              n = 0;
                              [self takeMoney];
                          }];
}

@end
