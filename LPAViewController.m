//
//  LPAViewController.m
//  Autolayout
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPAViewController.h"

@interface LPAViewController ()

@property (nonatomic, weak) UIButton *squareButton;
@property (nonatomic, weak) UIButton *portraitButton;
@property (nonatomic, weak) UIButton *landscapeButton;

@property (assign) float newHeight;
@property (assign) float newWidth;

@property (nonatomic, weak) UIView *framingView;
@property (assign) float framingViewHeight;
@property (nonatomic, weak) NSLayoutConstraint *framingViewHeightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *framingViewWidthConstraint;

@property (nonatomic, weak) NSLayoutConstraint *purpleBoxRightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *purpleBoxBottomConstraint;
@property (nonatomic, weak) NSLayoutConstraint *purpleBoxWidthConstraint;
@property (nonatomic, weak) NSLayoutConstraint *purpleBoxHeightConstraint;

@property (nonatomic, weak) NSLayoutConstraint *orangeLeftBoxRightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *orangeLeftBoxTopConstraint;
@property (nonatomic, weak) NSLayoutConstraint *orangeLeftBoxWidthConstraint;
@property (nonatomic, weak) NSLayoutConstraint *orangeLeftBoxHeightConstraint;

@property (nonatomic, weak) NSLayoutConstraint *orangeRightBoxRightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *orangeRightBoxTopConstraint;
@property (nonatomic, weak) NSLayoutConstraint *orangeRightBoxWidthConstraint;
@property (nonatomic, weak) NSLayoutConstraint *orangeRightBoxHeightConstraint;

@property (nonatomic, weak) NSLayoutConstraint *redBoxRightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *redBoxTopConstraint;
@property (nonatomic, weak) NSLayoutConstraint *redBoxWidthConstraint;
@property (nonatomic, weak) NSLayoutConstraint *redBoxHeightConstraint;

//@property (nonatomic, weak) UIView *blueTopBox;
//@property (nonatomic, weak) NSLayoutConstraint *blueTopBoxTopConstraint;
@property (nonatomic, weak) NSLayoutConstraint *blueTopBoxWidthConstraint;
@property (nonatomic, weak) NSLayoutConstraint *blueTopBoxHeightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *blueTopBoxCenterXConstraint;
@property (nonatomic, weak) NSLayoutConstraint *blueTopBoxCenterYConstraint;

@property (nonatomic, weak) NSLayoutConstraint *blueMiddleBoxWidthConstraint;
@property (nonatomic, weak) NSLayoutConstraint *blueMiddleBoxHeightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *blueMiddleBoxCenterXConstraint;
@property (nonatomic, weak) NSLayoutConstraint *blueMiddleBoxCenterYConstraint;

@property (nonatomic, weak) NSLayoutConstraint *blueBottomBoxWidthConstraint;
@property (nonatomic, weak) NSLayoutConstraint *blueBottomBoxHeightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *blueBottomBoxCenterXConstraint;
@property (nonatomic, weak) NSLayoutConstraint *blueBottomBoxCenterYConstraint;

@end

@implementation LPAViewController

- (void)viewDidAppear:(BOOL)animated {

  
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [squareButton setTitle:@"Square" forState:UIControlStateNormal];
    [squareButton addTarget:self action:@selector(resizeFramingView:)
    forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:squareButton];
    squareButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.squareButton = squareButton;
    
    UIButton *portraitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [portraitButton setTitle:@"Portrait" forState:UIControlStateNormal];
    [portraitButton addTarget:self action:@selector(resizeFramingView:)
    forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:portraitButton];
    portraitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitButton = portraitButton;
    
    UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [landscapeButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [landscapeButton addTarget:self action:@selector(resizeFramingView:)
    forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landscapeButton];
    landscapeButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.landscapeButton = landscapeButton;
  
  //rectangle 0 value
    UIView *framingView = [[UIView alloc] initWithFrame:CGRectZero];
    framingView.translatesAutoresizingMaskIntoConstraints = NO;
    framingView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:framingView];
    self.framingView = framingView;
    
    NSString *buttonsHorizontalConstraintsFormat = @"|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|";
    NSArray *buttonsHorizontalConstraints = [NSLayoutConstraint
      constraintsWithVisualFormat:buttonsHorizontalConstraintsFormat
      options:NSLayoutFormatAlignAllCenterY
      metrics:nil
      views:NSDictionaryOfVariableBindings(squareButton, portraitButton, landscapeButton)];
    [NSLayoutConstraint activateConstraints:buttonsHorizontalConstraints];
    
    NSLayoutConstraint *squareButtonBottomConstraint = [NSLayoutConstraint
      constraintWithItem:squareButton
      attribute:NSLayoutAttributeBottom
      relatedBy:NSLayoutRelationEqual
      toItem:self.view
      attribute:NSLayoutAttributeBottom
      multiplier:1.0
      constant:-50.0];
    squareButtonBottomConstraint.active = YES;
    
    NSLayoutConstraint *framingViewCenterXConstraint = [NSLayoutConstraint
      constraintWithItem:framingView
      attribute:NSLayoutAttributeCenterX
      relatedBy:NSLayoutRelationEqual
      toItem:self.view
      attribute:NSLayoutAttributeCenterX
      multiplier:1.0
      constant:0.0];
    framingViewCenterXConstraint.active = YES;
    
    NSLayoutConstraint *framingViewCenterY = [NSLayoutConstraint
      constraintWithItem:framingView
      attribute:NSLayoutAttributeCenterY
      relatedBy:NSLayoutRelationEqual
      toItem:self.view
      attribute:NSLayoutAttributeCenterY
      multiplier:1.0
      constant:-50.0];
    framingViewCenterY.active = YES;
    
    self.framingViewHeightConstraint = [NSLayoutConstraint
      constraintWithItem:framingView
      attribute:NSLayoutAttributeHeight
      relatedBy:NSLayoutRelationEqual
      toItem:nil
      attribute:NSLayoutAttributeNotAnAttribute
      multiplier:1.0
      constant:500.0];
    self.framingViewHeightConstraint.active = YES;
    
    self.framingViewWidthConstraint = [NSLayoutConstraint
      constraintWithItem:framingView
      attribute:NSLayoutAttributeWidth
      relatedBy:NSLayoutRelationEqual
      toItem:nil
      attribute:NSLayoutAttributeNotAnAttribute
      multiplier:1.0
      constant:500.0];
    self.framingViewWidthConstraint.active = YES;

    
    // Set up your views and constraints here
    
  UIView *purpleBox = [[UIView alloc] initWithFrame:CGRectZero];
  purpleBox.translatesAutoresizingMaskIntoConstraints = NO;
  purpleBox.backgroundColor = [UIColor purpleColor];
  [self.framingView addSubview:purpleBox];
  
  self.purpleBoxRightConstraint = [NSLayoutConstraint
                                    constraintWithItem:purpleBox
                                    attribute:NSLayoutAttributeRight
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:framingView
                                    attribute:NSLayoutAttributeRight
                                    multiplier:1.0
                                    constant:-20.0];
  self.purpleBoxRightConstraint.active = YES;
  
  self.purpleBoxBottomConstraint = [NSLayoutConstraint
                                   constraintWithItem:purpleBox
                                   attribute:NSLayoutAttributeBottom
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:framingView
                                   attribute:NSLayoutAttributeBottom
                                   multiplier:1.0
                                   constant:-20.0];
  self.purpleBoxBottomConstraint.active = YES;
  
  self.purpleBoxWidthConstraint = [NSLayoutConstraint
                                    constraintWithItem:purpleBox
                                    attribute:NSLayoutAttributeWidth
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:framingView
                                    attribute:NSLayoutAttributeWidth
                                   multiplier:305.0/500.0
                                   constant:0];
  self.purpleBoxWidthConstraint.active = YES;
  
  self.purpleBoxHeightConstraint = [NSLayoutConstraint
                                    constraintWithItem:purpleBox
                                    attribute:NSLayoutAttributeHeight
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                    attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:1.0
                                    constant:50.0];
  self.purpleBoxHeightConstraint.active = YES;
  
//  -------------------
  //  red box
  
  UIView *redBox = [[UIView alloc] initWithFrame:CGRectZero];
  redBox.translatesAutoresizingMaskIntoConstraints = NO;
  redBox.backgroundColor = [UIColor redColor];
  [self.framingView addSubview:redBox];
  
  self.redBoxRightConstraint = [NSLayoutConstraint
                                        constraintWithItem:redBox
                                        attribute:NSLayoutAttributeRight
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:framingView
                                        attribute:NSLayoutAttributeRight
                                        multiplier:1.0
                                        constant:-20.0];
  self.redBoxRightConstraint.active = YES;
  
  self.redBoxTopConstraint = [NSLayoutConstraint
                                      constraintWithItem:redBox
                                      attribute:NSLayoutAttributeTop
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:framingView
                                      attribute:NSLayoutAttributeTop
                                      multiplier:1.0
                                      constant:20.0];
  self.redBoxTopConstraint.active = YES;
  
  self.redBoxHeightConstraint = [NSLayoutConstraint
                                         constraintWithItem:redBox
                                         attribute:NSLayoutAttributeHeight
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:nil
                                         attribute:NSLayoutAttributeNotAnAttribute
                                         multiplier:1.0
                                         constant:40.0];
  self.redBoxHeightConstraint.active = YES;
  
  self.redBoxWidthConstraint = [NSLayoutConstraint
                                        constraintWithItem:redBox
                                        attribute:NSLayoutAttributeWidth
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                        attribute:NSLayoutAttributeNotAnAttribute
                                        multiplier:1.0
                                        constant:135.0];
  self.redBoxWidthConstraint.active = YES;
  
//  -----------------
//  orange boxes

  UIView *orangeRightBox = [[UIView alloc] initWithFrame:CGRectZero];
  orangeRightBox.translatesAutoresizingMaskIntoConstraints = NO;
  orangeRightBox.backgroundColor = [UIColor orangeColor];
  [self.framingView addSubview:orangeRightBox];
  
  self.orangeRightBoxRightConstraint = [NSLayoutConstraint
                                       constraintWithItem:orangeRightBox
                                       attribute:NSLayoutAttributeRight
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:framingView
                                       attribute:NSLayoutAttributeRight
                                       multiplier:1.0
                                       constant:-25.0];
  self.orangeRightBoxRightConstraint.active = YES;
  
  self.orangeRightBoxTopConstraint = [NSLayoutConstraint
                                     constraintWithItem:orangeRightBox
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:redBox
                                     attribute:NSLayoutAttributeTop
                                     multiplier:1.0
                                     constant:5.0];
  self.orangeRightBoxTopConstraint.active = YES;
  
  self.orangeRightBoxHeightConstraint = [NSLayoutConstraint
                                         constraintWithItem:orangeRightBox
                                         attribute:NSLayoutAttributeHeight
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:nil
                                         attribute:NSLayoutAttributeNotAnAttribute
                                         multiplier:1.0
                                         constant:30.0];
  self.orangeRightBoxHeightConstraint.active = YES;
  
  self.orangeRightBoxWidthConstraint = [NSLayoutConstraint
                                        constraintWithItem:orangeRightBox
                                        attribute:NSLayoutAttributeWidth
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                        attribute:NSLayoutAttributeNotAnAttribute
                                        multiplier:1.0
                                        constant:50.0];
  self.orangeRightBoxWidthConstraint.active = YES;
  
  UIView *orangeLeftBox = [[UIView alloc] initWithFrame:CGRectZero];
  orangeLeftBox.translatesAutoresizingMaskIntoConstraints = NO;
  orangeLeftBox.backgroundColor = [UIColor orangeColor];
  [self.framingView addSubview:orangeLeftBox];
  
  self.orangeLeftBoxRightConstraint = [NSLayoutConstraint
                                       constraintWithItem:orangeLeftBox
                                       attribute:NSLayoutAttributeRight
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:orangeRightBox
                                       attribute:NSLayoutAttributeLeft
                                       multiplier:1.0
                                       constant:-5.0];
  self.orangeLeftBoxRightConstraint.active = YES;
  
  self.orangeLeftBoxTopConstraint = [NSLayoutConstraint
                                    constraintWithItem:orangeLeftBox
                                    attribute:NSLayoutAttributeTop
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:redBox
                                    attribute:NSLayoutAttributeTop
                                    multiplier:1.0
                                    constant:5.0];
  self.orangeLeftBoxTopConstraint.active = YES;
  
  self.orangeLeftBoxHeightConstraint = [NSLayoutConstraint
                                        constraintWithItem:orangeLeftBox
                                        attribute:NSLayoutAttributeHeight
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                        attribute:NSLayoutAttributeNotAnAttribute
                                        multiplier:1.0
                                        constant:30.0];
  self.orangeLeftBoxHeightConstraint.active = YES;
  
  self.orangeLeftBoxWidthConstraint = [NSLayoutConstraint
                                       constraintWithItem:orangeLeftBox
                                       attribute:NSLayoutAttributeWidth
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:nil
                                       attribute:NSLayoutAttributeNotAnAttribute
                                       multiplier:1.0
                                       constant:70.0];
  self.orangeLeftBoxWidthConstraint.active = YES;
  
//------------------
//  blue boxes
  [self.view layoutIfNeeded];
  
  UIView *blueTopBox = [[UIView alloc] initWithFrame:CGRectZero];
  blueTopBox.translatesAutoresizingMaskIntoConstraints = NO;
  blueTopBox.backgroundColor = [UIColor blueColor];
  [self.framingView addSubview:blueTopBox];
  
  self.blueTopBoxCenterXConstraint = [NSLayoutConstraint
                                         constraintWithItem:blueTopBox
                                         attribute:NSLayoutAttributeCenterX
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:framingView
                                         attribute:NSLayoutAttributeCenterX
                                         multiplier:1.0
                                         constant:0.0];
  self.blueTopBoxCenterXConstraint.active = YES;
  
  self.blueTopBoxCenterYConstraint = [NSLayoutConstraint
                                         constraintWithItem:blueTopBox
                                         attribute:NSLayoutAttributeCenterY
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:framingView
                                         attribute:NSLayoutAttributeCenterY
                                         multiplier:0.5
                                         constant:0.0];
  self.blueTopBoxCenterYConstraint.active = YES;
  
//  NSLog(@"%f", self.framingView.frame.size.height);
  
  self.blueTopBoxHeightConstraint = [NSLayoutConstraint
                                         constraintWithItem:blueTopBox
                                         attribute:NSLayoutAttributeHeight
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:nil
                                         attribute:NSLayoutAttributeNotAnAttribute
                                         multiplier:1.0
                                         constant:50.0];
  self.blueTopBoxHeightConstraint.active = YES;
  
  self.blueTopBoxWidthConstraint = [NSLayoutConstraint
                                     constraintWithItem:blueTopBox
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                     multiplier:1.0
                                     constant:50.0];
  self.blueTopBoxWidthConstraint.active = YES;
  
  UIView *blueMiddleBox = [[UIView alloc] initWithFrame:CGRectZero];
  blueMiddleBox.translatesAutoresizingMaskIntoConstraints = NO;
  blueMiddleBox.backgroundColor = [UIColor blueColor];
  [self.framingView addSubview:blueMiddleBox];
  
  self.blueMiddleBoxCenterXConstraint = [NSLayoutConstraint
                                       constraintWithItem:blueMiddleBox
                                       attribute:NSLayoutAttributeCenterX
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:framingView
                                       attribute:NSLayoutAttributeCenterX
                                       multiplier:1.0
                                       constant:0.0];
  self.blueMiddleBoxCenterXConstraint.active = YES;
  
  self.blueMiddleBoxCenterYConstraint = [NSLayoutConstraint
                                         constraintWithItem:blueMiddleBox
                                         attribute:NSLayoutAttributeCenterY
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:framingView
                                         attribute:NSLayoutAttributeCenterY
                                         multiplier:1.0
                                         constant:0.0];
  self.blueMiddleBoxCenterYConstraint.active = YES;
  
  self.blueMiddleBoxHeightConstraint = [NSLayoutConstraint
                                        constraintWithItem:blueMiddleBox
                                        attribute:NSLayoutAttributeHeight
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                        attribute:NSLayoutAttributeNotAnAttribute
                                        multiplier:1.0
                                        constant:50.0];
  self.blueMiddleBoxHeightConstraint.active = YES;
  
  self.blueMiddleBoxHeightConstraint = [NSLayoutConstraint
                                       constraintWithItem:blueMiddleBox
                                       attribute:NSLayoutAttributeWidth
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:nil
                                       attribute:NSLayoutAttributeNotAnAttribute
                                       multiplier:1.0
                                       constant:50.0];
  self.blueMiddleBoxHeightConstraint.active = YES;
  
  UIView *blueBottomBox = [[UIView alloc] initWithFrame:CGRectZero];
  blueBottomBox.translatesAutoresizingMaskIntoConstraints = NO;
  blueBottomBox.backgroundColor = [UIColor blueColor];
  [self.framingView addSubview:blueBottomBox];
  
  self.blueBottomBoxCenterXConstraint = [NSLayoutConstraint
                                      constraintWithItem:blueBottomBox
                                      attribute:NSLayoutAttributeCenterX
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:framingView
                                      attribute:NSLayoutAttributeCenterX
                                      multiplier:1.0
                                      constant:0.0];
  self.blueBottomBoxCenterXConstraint.active = YES;
  
  self.blueBottomBoxCenterYConstraint = [NSLayoutConstraint
                                      constraintWithItem:blueBottomBox
                                      attribute:NSLayoutAttributeCenterY
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:framingView
                                      attribute:NSLayoutAttributeCenterY
                                      multiplier:1.5
                                      constant:0.0];
  self.blueBottomBoxCenterYConstraint.active = YES;
  
  self.blueBottomBoxHeightConstraint = [NSLayoutConstraint
                                        constraintWithItem:blueBottomBox
                                        attribute:NSLayoutAttributeHeight
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                        attribute:NSLayoutAttributeNotAnAttribute
                                        multiplier:1.0
                                        constant:50.0];
  self.blueBottomBoxHeightConstraint.active = YES;
  
  self.blueBottomBoxHeightConstraint = [NSLayoutConstraint
                                        constraintWithItem:blueBottomBox
                                        attribute:NSLayoutAttributeWidth
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                        attribute:NSLayoutAttributeNotAnAttribute
                                        multiplier:1.0
                                        constant:50.0];
  self.blueBottomBoxHeightConstraint.active = YES;
  

  
  
}

/**
 Resize the frame of the framing view depending on which button was pressed.
 */
- (void)resizeFramingView:(id)sender
{
//    CGFloat newWidth = 0.0;
//    CGFloat newHeight = 0.0;
  self.newWidth = 0.0;
  self.newHeight = 0.0;
  
    if (sender == self.squareButton) {
        self.newWidth = 500.0;
        self.newHeight = 500.0;
    } else if (sender == self.portraitButton) {
        self.newWidth = 350.0;
        self.newHeight = 550.0;
    } else if (sender == self.landscapeButton) {
        self.newWidth = 900.0;
        self.newHeight = 300.0;
    }
  
    [UIView animateWithDuration:2.0 animations:^(){
        self.framingViewHeightConstraint.constant = self.newHeight;
        self.framingViewWidthConstraint.constant = self.newWidth;
        [self.view layoutIfNeeded];
    }];
  
//  [self viewDidLoad];
}

@end
