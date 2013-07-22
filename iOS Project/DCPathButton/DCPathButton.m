//
//  DCPathButoon.m
//  DCPathButton
//
//  Created by Paul on 4/19/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import "DCPathButton.h"

@interface DCPathButton (){
    //Declare some basic parameter
    CGPoint kDCPathButtonSubButtonBirthLocation;
    CGPoint kDCPathButtonSubButtonTag_0_AppearLocation;
    CGPoint kDCPathButtonSubButtonTag_1_AppearLocation;
    CGPoint kDCPathButtonSubButtonTag_2_AppearLocation;
    CGPoint kDCPathButtonSubButtonTag_3_AppearLocation;
    CGPoint kDCPathButtonSubButtonTag_4_AppearLocation;
    CGPoint kDCPathButtonSubButtonTag_5_AppearLocation;
    CGPoint kDCPathButtonSubButtonFinalLocation;
    
}

@end

@implementation DCPathButton

@synthesize delegate = _delegate;
@synthesize expanded = _expanded;
@synthesize buttonCount = _buttonCount;

@synthesize totalRaiuds = _totalRaiuds;
@synthesize centerRadius = _centerRadius;
@synthesize subRadius = _subRadius;
@synthesize centerLocationAxisX = _centerLocationAxisX;
@synthesize centerLocationAxisY = _centerLocationAxisY;
@synthesize viewOffset = _viewOffset;
@synthesize selflastLocation = _selflastLocation;

@synthesize parentView = _parentView;
@synthesize buttons = _buttons;
@synthesize centerButton, subButton;

//  Sub button offset parameter
static CGFloat const kDCPathButtonLeftOffSetX = -20.0f;
static CGFloat const kDCPathButtonRightOffSetX = 20.0f;
static CGFloat const kDCPathButtonVerticalOffSetX = 20.0f;

//  Sub button angel parameter
static CGFloat const kDCPathButtonAngel36C = 36.0f;
static CGFloat const kDCPathButtonAngel45C = 45.0f;
static CGFloat const kDCPathButtonAngel60C = 60.0f;
static CGFloat const kDCPathButtonAngel72C = 72.0f;
static CGFloat const kDCPathButtonDefaultCenterRadius = 15.0f;
static CGFloat const kDCPathButtonDefaultSubRadius = 20.0f;
static CGFloat const kDCPathButtonDefaultTotalRadius = 60.0f;
static CGFloat const kDCPathButtonDefaultRotation = M_PI*2;
static CGFloat const kDCPathButtonDefaultReverseRotation = -M_PI*2;

#pragma mark - Initialization method
- (id)initDCPathButtonWithSubButtons:(NSInteger)buttonCount totalRadius:(CGFloat)totalRadius centerRadius:(NSInteger)centerRadius subRadius:(CGFloat)subRadius centerImage:(NSString *)centerImageName centerBackground:(NSString *)centerBackgroundName subImages:(void (^)(DCPathButton *))imageBlock subImageBackground:(NSString *)subImageBackgroundName inLocationX:(CGFloat)xAxis locationY:(CGFloat)yAxis toParentView:(UIView *)parentView{
    
    _viewOffset = CGPointMake(0, 0);
    parentView == nil? (self.parentView = parentView):(self.parentView = parentView);
    xAxis == 0? (self.centerLocationAxisX = kDCPathButtonCurrentFrameWidth/2) : (self.centerLocationAxisX = xAxis);
    yAxis == 0? (self.centerLocationAxisY = kDCPathButtonCurrentFrameHeight/2) : (self.centerLocationAxisY = yAxis);
    self.buttonCount = buttonCount;
    self.totalRaiuds = totalRadius;
    self.subRadius = subRadius;
    self.centerRadius = centerRadius;
    _expanded = NO;
    kDCPathButtonSubButtonBirthLocation = CGPointMake(-self.totalRaiuds*10, -self.totalRaiuds*10);
    kDCPathButtonSubButtonFinalLocation = CGPointMake(self.centerLocationAxisX, self.centerLocationAxisY);
    
    if (self = [super initWithFrame:CGRectMake(0, 0, self.centerRadius*2, self.centerRadius*2)]) {
        self.center = CGPointMake(self.centerLocationAxisX, self.centerLocationAxisY);
        _selflastLocation = self.center;
        [self configureCenterButton:centerRadius image:centerImageName backgroundImage:centerBackgroundName];
        [self configureTheButtons:buttonCount];
        self.buttons = [NSMutableArray array];
        for (NSInteger i = 0; i < buttonCount; i++) {
            subButton = [[DCSubButton alloc]init];
            subButton.delegate = self;
            subButton.frame = CGRectMake(0, 0, self.subRadius * 2, self.subRadius * 2);
            subButton.center = kDCPathButtonSubButtonBirthLocation;
            subButton.tag = i;
            subButton.hidden = YES;
            
            [self insertSubview:subButton belowSubview:self.centerButton];
            [self.buttons addObject:subButton];
        }
        imageBlock(self);
        [self.parentView addSubview:self];
    }
    return self;
}

#pragma mark - configure the center button and the sub button

- (void)configureCenterButton:(CGFloat)centerRadius image:(NSString *)imageName backgroundImage:(NSString *)backgroundImageName{
    self.centerButton = [[DCCenterButton alloc]init];
    self.centerButton.frame = CGRectMake(0, 0, centerRadius * 2, centerRadius * 2);
    self.centerButton.tag = 6;
    self.centerButton.center = CGPointMake(kDCPathButtonCurrentFrameWidth/2, kDCPathButtonCurrentFrameHeight/2);
    if (imageName == nil) {
        imageName = @"dc-center";
    }
    if (backgroundImageName == nil) {
        backgroundImageName = @"dc-background";
    }
    [self.centerButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [self.centerButton setBackgroundImage:[UIImage imageNamed:backgroundImageName] forState:UIControlStateNormal];
    self.centerButton.delegate = self;
    //[self.centerButton addTarget:self action:@selector(centerButtonPress) forControlEvents:UIControlEventTouchUpOutside];
    self.centerButton.layer.zPosition = 1;
    [self addSubview:self.centerButton];
}

- (void)configureTheButtons:(NSInteger)buttonCount{
    //  Limit the button amount
    if (buttonCount < 3) {
        buttonCount = 3;
        self.buttonCount = buttonCount;
    }
    else if (buttonCount > 6) {
        buttonCount = 6;
    }
    //  Configure out the sub button's location parameter
    switch (buttonCount) {
        case 3:
        {
            kDCPathButtonSubButtonTag_0_AppearLocation = CGPointMake(
                                                                     self.totalRaiuds - self.totalRaiuds * sinf(kDCCovertAngelToRadian(kDCPathButtonAngel60C)),
                                                                     self.totalRaiuds - self.totalRaiuds * cosf(kDCCovertAngelToRadian(kDCPathButtonAngel60C)));
            kDCPathButtonSubButtonTag_1_AppearLocation = CGPointMake(
                                                                     self.totalRaiuds + self.totalRaiuds * sinf(kDCCovertAngelToRadian(kDCPathButtonAngel60C)),
                                                                     self.totalRaiuds - self.totalRaiuds * cosf(kDCCovertAngelToRadian(kDCPathButtonAngel60C)));
            kDCPathButtonSubButtonTag_2_AppearLocation = CGPointMake(
                                                                     self.totalRaiuds ,
                                                                     self.totalRaiuds +self.totalRaiuds);
        }
            break;
        case 4:
        {
            kDCPathButtonSubButtonTag_0_AppearLocation = CGPointMake(
                                                                     self.totalRaiuds - self.totalRaiuds * sinf(kDCCovertAngelToRadian(kDCPathButtonAngel45C)),
                                                                     self.totalRaiuds - self.totalRaiuds * cosf(kDCCovertAngelToRadian(kDCPathButtonAngel45C)));
            kDCPathButtonSubButtonTag_1_AppearLocation = CGPointMake(
                                                                     self.totalRaiuds + self.totalRaiuds * sinf(kDCCovertAngelToRadian(kDCPathButtonAngel45C)),
                                                                     self.totalRaiuds - self.totalRaiuds * cosf(kDCCovertAngelToRadian(kDCPathButtonAngel45C)));
            kDCPathButtonSubButtonTag_2_AppearLocation = CGPointMake(
                                                                     self.totalRaiuds - self.totalRaiuds * sinf(kDCCovertAngelToRadian(kDCPathButtonAngel45C)),
                                                                     self.totalRaiuds + self.totalRaiuds * cosf(kDCCovertAngelToRadian(kDCPathButtonAngel45C)));
            kDCPathButtonSubButtonTag_3_AppearLocation = CGPointMake(
                                                                     self.totalRaiuds + self.totalRaiuds * sinf(kDCCovertAngelToRadian(kDCPathButtonAngel45C)),
                                                                     self.totalRaiuds + self.totalRaiuds * cosf(kDCCovertAngelToRadian(kDCPathButtonAngel45C)));
        }
            break;
        case 5:
        {
            kDCPathButtonSubButtonTag_0_AppearLocation = CGPointMake(
                                                                     self.totalRaiuds - self.totalRaiuds * sinf(kDCCovertAngelToRadian(kDCPathButtonAngel36C)),
                                                                     self.totalRaiuds - self.totalRaiuds * cosf(kDCCovertAngelToRadian(kDCPathButtonAngel36C)));
            kDCPathButtonSubButtonTag_1_AppearLocation = CGPointMake(
                                                                     self.totalRaiuds + self.totalRaiuds * sinf(kDCCovertAngelToRadian(kDCPathButtonAngel36C)),
                                                                     self.totalRaiuds - self.totalRaiuds * cosf(kDCCovertAngelToRadian(kDCPathButtonAngel36C)));
            kDCPathButtonSubButtonTag_2_AppearLocation = CGPointMake(
                                                                     self.totalRaiuds - self.totalRaiuds * sinf(kDCCovertAngelToRadian(kDCPathButtonAngel72C)),
                                                                     self.totalRaiuds + self.totalRaiuds * cosf(kDCCovertAngelToRadian(kDCPathButtonAngel72C)));
            kDCPathButtonSubButtonTag_3_AppearLocation = CGPointMake(
                                                                     self.totalRaiuds,
                                                                     self.totalRaiuds*2);
            kDCPathButtonSubButtonTag_4_AppearLocation = CGPointMake(
                                                                     self.totalRaiuds + self.totalRaiuds * sinf(kDCCovertAngelToRadian(kDCPathButtonAngel72C)),
                                                                     self.totalRaiuds + self.totalRaiuds * cosf(kDCCovertAngelToRadian(kDCPathButtonAngel72C)));
        }
            break;
        case 6:
        {
            kDCPathButtonSubButtonTag_0_AppearLocation = CGPointMake(
                                                                     self.totalRaiuds - self.totalRaiuds * sinf(kDCCovertAngelToRadian(kDCPathButtonAngel60C)),
                                                                     self.totalRaiuds - self.totalRaiuds * cosf(kDCCovertAngelToRadian(kDCPathButtonAngel60C)));
            kDCPathButtonSubButtonTag_1_AppearLocation = CGPointMake(
                                                                     self.totalRaiuds,
                                                                     0);
            kDCPathButtonSubButtonTag_2_AppearLocation = CGPointMake(
                                                                     self.totalRaiuds + self.totalRaiuds * sinf(kDCCovertAngelToRadian(kDCPathButtonAngel60C)),
                                                                     self.totalRaiuds - self.totalRaiuds * cosf(kDCCovertAngelToRadian(kDCPathButtonAngel60C)));
            kDCPathButtonSubButtonTag_3_AppearLocation = CGPointMake(
                                                                     self.totalRaiuds - self.totalRaiuds * sinf(kDCCovertAngelToRadian(kDCPathButtonAngel60C)),
                                                                     self.totalRaiuds + self.totalRaiuds * cosf(kDCCovertAngelToRadian(kDCPathButtonAngel60C)));
            kDCPathButtonSubButtonTag_4_AppearLocation = CGPointMake(
                                                                     self.totalRaiuds,
                                                                     self.totalRaiuds*2);
            kDCPathButtonSubButtonTag_5_AppearLocation = CGPointMake(
                                                                     self.totalRaiuds + self.totalRaiuds * sinf(kDCCovertAngelToRadian(kDCPathButtonAngel60C)),
                                                                     self.totalRaiuds + self.totalRaiuds * cosf(kDCCovertAngelToRadian(kDCPathButtonAngel60C)));
        }
            break;
        default:
            break;
    }
}

#pragma mark - Add image to sub button, only use in the block

- (void)subButtonImage:(NSString *)imageName withTag:(NSInteger)tag{
    if (tag > self.buttonCount) {
        tag = self.buttonCount;
    }
    DCSubButton *currentButton = [self.buttons objectAtIndex:tag];
    [currentButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

#pragma mark - Set a sign to judge the animation state

- (BOOL)isExpanded{
    return _expanded;
}

#pragma mark - The center button and the sub button's animations

- (void)button:(DCSubButton *)button appearAt:(CGPoint)location withDalay:(CGFloat)delay duration:(CGFloat)duration{
    button.center = location;
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    scaleAnimation.duration = duration;
    scaleAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1)],[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.3, 1.3, 1)],[NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)]];
    scaleAnimation.calculationMode = kCAAnimationLinear;
    scaleAnimation.keyTimes = @[[NSNumber numberWithFloat:0.0f],[NSNumber numberWithFloat:delay],[NSNumber numberWithFloat:1.0f]];
    button.layer.anchorPoint = CGPointMake(0.5f, 0.5f);
    [button.layer addAnimation:scaleAnimation forKey:@"buttonAppear"];
}

- (void)button:(DCSubButton *)button shrinkAt:(CGPoint)location offsetAxisX:(CGFloat)axisX offSEtAxisY:(CGFloat)axisY withDelay:(CGFloat)delay rotateDirection:(DCPathButtonRotationOrientation)orientation animationDuration:(CGFloat)duration{
    CAKeyframeAnimation *rotation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotation.duration = duration * delay;
    rotation.values = @[[NSNumber numberWithFloat:0.0f],[NSNumber numberWithFloat:[self matchRotationOrientation:orientation]],[NSNumber numberWithFloat:0.0f]];
    rotation.keyTimes = @[[NSNumber numberWithFloat:0.0f],[NSNumber numberWithFloat:delay],[NSNumber numberWithFloat:1.0f]];
    
    CAKeyframeAnimation *shrink = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    shrink.duration = duration * (1 - delay);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, location.x, location.y);
    CGPathAddLineToPoint(path, NULL, location.x + axisX, location.y + axisY);
    CGPathAddLineToPoint(path, NULL, self.centerRadius, self.centerRadius);
    shrink.path = path;
    
    CGPathRelease(path);
    
    CAAnimationGroup *totalAnimation = [CAAnimationGroup animation];
    totalAnimation.duration = 1.0f;
    totalAnimation.animations = @[rotation,shrink];
    totalAnimation.fillMode = kCAFillModeForwards;
    totalAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    totalAnimation.delegate = self;
    
    button.layer.anchorPoint = CGPointMake(0.5f, 0.5f);
    button.center = kDCPathButtonSubButtonBirthLocation;
    
    [button.layer addAnimation:totalAnimation forKey:@"buttonDismiss"];
}

- (void)centerButtonAnimation{
    CAKeyframeAnimation *centerZoom = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    centerZoom.duration = 1.0f;
    centerZoom.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)],[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.5, 1.5, 1)],[NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)],[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1)],[NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)]];
    centerZoom.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [centerButton.layer addAnimation:centerZoom forKey:@"buttonScale"];
}

#pragma mark - Some math method

- (CGFloat)matchRotationOrientation:(DCPathButtonRotationOrientation)orientation{
    if (orientation == kDCPathButtonRotationNormal) {
        return kDCPathButtonDefaultRotation;
    }
    return kDCPathButtonDefaultReverseRotation;
}

- (CGFloat)offsetAxisY:(CGFloat)axisX withAngel:(CGFloat)angel{
    return (axisX / tanf(kDCCovertAngelToRadian(angel)));
}

- (CGPoint)offSet:(CGPoint)original withSubOffSetX:(CGFloat)x subOffSetY:(CGFloat)y{
    return CGPointMake(original.x - self.totalRaiuds + self.centerRadius, original.y - self.totalRaiuds + self.centerRadius);
}

#pragma DCCenterButton Delegate

- (void)buttonAppear:(DCCenterButton *)centerButton{
    if (!self.isExpanded) {
        for (int i = 0; i<self.buttonCount; i++) {
            DCSubButton *sButton = (DCSubButton *)[self.buttons objectAtIndex:i];
            sButton.hidden = NO;
        }
        switch (self.buttonCount) {
            case 3:
            {
                [self button:[self.buttons objectAtIndex:0] appearAt:kDCPathButtonSubButtonTag_0_AppearLocation withDalay:0.4 duration:0.25];
                [self button:[self.buttons objectAtIndex:1] appearAt:kDCPathButtonSubButtonTag_1_AppearLocation withDalay:0.45 duration:0.3];
                [self button:[self.buttons objectAtIndex:2] appearAt:kDCPathButtonSubButtonTag_2_AppearLocation withDalay:0.5 duration:0.35];
            }
                break;
            case 4:
            {
                [self button:[self.buttons objectAtIndex:0] appearAt:kDCPathButtonSubButtonTag_0_AppearLocation withDalay:0.4 duration:0.25];
                [self button:[self.buttons objectAtIndex:1] appearAt:kDCPathButtonSubButtonTag_1_AppearLocation withDalay:0.45 duration:0.3];
                [self button:[self.buttons objectAtIndex:2] appearAt:kDCPathButtonSubButtonTag_2_AppearLocation withDalay:0.5 duration:0.35];
                [self button:[self.buttons objectAtIndex:3] appearAt:kDCPathButtonSubButtonTag_3_AppearLocation withDalay:0.55 duration:0.4];
            }
                break;
            case 5:
            {
                [self button:[self.buttons objectAtIndex:0] appearAt:kDCPathButtonSubButtonTag_0_AppearLocation withDalay:0.4 duration:0.25];
                [self button:[self.buttons objectAtIndex:1] appearAt:kDCPathButtonSubButtonTag_1_AppearLocation withDalay:0.45 duration:0.3];
                [self button:[self.buttons objectAtIndex:2] appearAt:kDCPathButtonSubButtonTag_2_AppearLocation withDalay:0.5 duration:0.35];
                [self button:[self.buttons objectAtIndex:3] appearAt:kDCPathButtonSubButtonTag_3_AppearLocation withDalay:0.55 duration:0.4];
                [self button:[self.buttons objectAtIndex:4] appearAt:kDCPathButtonSubButtonTag_4_AppearLocation withDalay:0.6 duration:0.45];
            }
                break;
            case 6:
            {
                [self button:[self.buttons objectAtIndex:0] appearAt:kDCPathButtonSubButtonTag_0_AppearLocation withDalay:0.4 duration:0.25];
                [self button:[self.buttons objectAtIndex:1] appearAt:kDCPathButtonSubButtonTag_1_AppearLocation withDalay:0.45 duration:0.3];
                [self button:[self.buttons objectAtIndex:2] appearAt:kDCPathButtonSubButtonTag_2_AppearLocation withDalay:0.5 duration:0.35];
                [self button:[self.buttons objectAtIndex:3] appearAt:kDCPathButtonSubButtonTag_3_AppearLocation withDalay:0.55 duration:0.4];
                [self button:[self.buttons objectAtIndex:4] appearAt:kDCPathButtonSubButtonTag_4_AppearLocation withDalay:0.6 duration:0.45];
                [self button:[self.buttons objectAtIndex:5] appearAt:kDCPathButtonSubButtonTag_5_AppearLocation withDalay:0.65 duration:0.5];
            }
                break;
            default:
                break;
        }
    }
}

- (void)buttonShrink:(DCCenterButton *)centerButton{
    if (self.isExpanded) {
        switch (self.buttonCount) {
            case 3:
            {
                [self button:[self.buttons objectAtIndex:0]
                    shrinkAt:[self offSet:kDCPathButtonSubButtonTag_0_AppearLocation withSubOffSetX:0 subOffSetY:0]
                 offsetAxisX:kDCPathButtonLeftOffSetX
                 offSEtAxisY:[self offsetAxisY:kDCPathButtonLeftOffSetX withAngel:kDCPathButtonAngel60C]
                   withDelay:0.3
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1];
                [self button:[self.buttons objectAtIndex:1]
                    shrinkAt:[self offSet:kDCPathButtonSubButtonTag_1_AppearLocation withSubOffSetX:self.centerRadius subOffSetY:0]
                 offsetAxisX:kDCPathButtonRightOffSetX
                 offSEtAxisY:-[self offsetAxisY:kDCPathButtonRightOffSetX withAngel:kDCPathButtonAngel60C]
                   withDelay:0.35
             rotateDirection:kDCPathButtonRotationReverse animationDuration:1.2];
                [self button:[self.buttons objectAtIndex:2]
                    shrinkAt:[self offSet:kDCPathButtonSubButtonTag_2_AppearLocation withSubOffSetX:self.centerRadius subOffSetY:0]
                 offsetAxisX:0 offSEtAxisY:kDCPathButtonVerticalOffSetX
                   withDelay:0.4
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1.4];
            }
                break;
            case 4:
            {
                [self button:[self.buttons objectAtIndex:0]
                    shrinkAt:[self offSet:kDCPathButtonSubButtonTag_0_AppearLocation withSubOffSetX:0 subOffSetY:0]
                 offsetAxisX:kDCPathButtonLeftOffSetX
                 offSEtAxisY:[self offsetAxisY:kDCPathButtonLeftOffSetX withAngel:kDCPathButtonAngel45C]
                   withDelay:0.3
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1];
                [self button:[self.buttons objectAtIndex:1]
                    shrinkAt:[self offSet:kDCPathButtonSubButtonTag_1_AppearLocation withSubOffSetX:self.centerRadius subOffSetY:0]
                 offsetAxisX:kDCPathButtonRightOffSetX
                 offSEtAxisY:[self offsetAxisY:-kDCPathButtonRightOffSetX withAngel:kDCPathButtonAngel45C]
                   withDelay:0.35
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1.1];
                [self button:[self.buttons objectAtIndex:2]
                    shrinkAt:[self offSet:kDCPathButtonSubButtonTag_2_AppearLocation withSubOffSetX:-self.centerRadius subOffSetY:self.centerRadius]
                 offsetAxisX:kDCPathButtonLeftOffSetX
                 offSEtAxisY:[self offsetAxisY:-kDCPathButtonLeftOffSetX withAngel:kDCPathButtonAngel45C]
                   withDelay:0.4
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1.2];
                [self button:[self.buttons objectAtIndex:3]
                    shrinkAt:[self offSet:kDCPathButtonSubButtonTag_3_AppearLocation withSubOffSetX:self.centerRadius subOffSetY:self.centerRadius]
                 offsetAxisX:kDCPathButtonRightOffSetX
                 offSEtAxisY:[self offsetAxisY:kDCPathButtonRightOffSetX withAngel:kDCPathButtonAngel45C]
                   withDelay:0.45
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1.3];
            }
                break;
            case 5:
            {
                [self button:[self.buttons objectAtIndex:0]
                    shrinkAt:[self offSet:kDCPathButtonSubButtonTag_0_AppearLocation withSubOffSetX:0 subOffSetY:0]
                 offsetAxisX:kDCPathButtonLeftOffSetX
                 offSEtAxisY:[self offsetAxisY:kDCPathButtonLeftOffSetX withAngel:kDCPathButtonAngel36C]
                   withDelay:0.3
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1];
                [self button:[self.buttons objectAtIndex:1]
                    shrinkAt:[self offSet:kDCPathButtonSubButtonTag_1_AppearLocation withSubOffSetX:self.centerRadius subOffSetY:0]
                 offsetAxisX:kDCPathButtonRightOffSetX
                 offSEtAxisY:[self offsetAxisY:-kDCPathButtonRightOffSetX withAngel:kDCPathButtonAngel36C]
                   withDelay:0.34
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1.2];
                [self button:[self.buttons objectAtIndex:2]
                    shrinkAt:[self offSet:kDCPathButtonSubButtonTag_2_AppearLocation withSubOffSetX:-self.centerRadius subOffSetY:self.centerRadius]
                 offsetAxisX:kDCPathButtonLeftOffSetX
                 offSEtAxisY:[self offsetAxisY:-kDCPathButtonLeftOffSetX withAngel:kDCPathButtonAngel72C]
                   withDelay:0.38
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1.3];
                [self button:[self.buttons objectAtIndex:3]
                    shrinkAt:[self offSet:kDCPathButtonSubButtonTag_3_AppearLocation withSubOffSetX:self.centerRadius subOffSetY:0]
                 offsetAxisX:0 offSEtAxisY:kDCPathButtonVerticalOffSetX
                   withDelay:0.42
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1.1];
                [self button:[self.buttons objectAtIndex:4]
                    shrinkAt:[self offSet:kDCPathButtonSubButtonTag_4_AppearLocation withSubOffSetX:self.centerRadius subOffSetY:self.centerRadius]
                 offsetAxisX:kDCPathButtonRightOffSetX
                 offSEtAxisY:[self offsetAxisY:kDCPathButtonRightOffSetX withAngel:kDCPathButtonAngel72C]
                   withDelay:0.45
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1.4];
            }
                break;
            case 6:
            {
                [self button:[self.buttons objectAtIndex:0]
                    shrinkAt:[self offSet:kDCPathButtonSubButtonTag_0_AppearLocation withSubOffSetX:0 subOffSetY:0]
                 offsetAxisX:kDCPathButtonLeftOffSetX
                 offSEtAxisY:[self offsetAxisY:kDCPathButtonLeftOffSetX withAngel:kDCPathButtonAngel60C]
                   withDelay:0.3
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1];
                [self button:[self.buttons objectAtIndex:1]
                    shrinkAt:[self offSet:kDCPathButtonSubButtonTag_1_AppearLocation withSubOffSetX:self.centerRadius subOffSetY:0]
                 offsetAxisX:0 offSEtAxisY:-kDCPathButtonVerticalOffSetX
                   withDelay:0.33
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1.1];
                [self button:[self.buttons objectAtIndex:2]
                    shrinkAt:[self offSet:kDCPathButtonSubButtonTag_2_AppearLocation withSubOffSetX:self.centerRadius subOffSetY:self.centerRadius]
                 offsetAxisX:kDCPathButtonRightOffSetX
                 offSEtAxisY:[self offsetAxisY:-kDCPathButtonRightOffSetX withAngel:kDCPathButtonAngel60C]
                   withDelay:0.36
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1.2];
                [self button:[self.buttons objectAtIndex:3]
                    shrinkAt:[self offSet:kDCPathButtonSubButtonTag_3_AppearLocation withSubOffSetX:-self.centerRadius subOffSetY:-self.centerRadius]
                 offsetAxisX:kDCPathButtonLeftOffSetX
                 offSEtAxisY:[self offsetAxisY:-kDCPathButtonLeftOffSetX withAngel:kDCPathButtonAngel60C]
                   withDelay:0.39
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1.3];
                [self button:[self.buttons objectAtIndex:4]
                    shrinkAt:[self offSet:kDCPathButtonSubButtonTag_4_AppearLocation withSubOffSetX:self.centerRadius subOffSetY:0]
                 offsetAxisX:0 offSEtAxisY:kDCPathButtonVerticalOffSetX
                   withDelay:0.42
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1.3];
                [self button:[self.buttons objectAtIndex:5]
                    shrinkAt:[self offSet:kDCPathButtonSubButtonTag_5_AppearLocation withSubOffSetX:self.centerRadius subOffSetY:self.centerRadius]
                 offsetAxisX:kDCPathButtonRightOffSetX
                 offSEtAxisY:[self offsetAxisY:kDCPathButtonRightOffSetX withAngel:kDCPathButtonAngel60C]
                   withDelay:0.45
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1.4];
            }
            default:
                break;
        }
        [self centerButtonAnimation];
    }
}

- (void)cinfigureExpandStatus{
    if (!self.isExpanded) {
        self.frame = CGRectMake(0, 0, self.totalRaiuds*2, self.totalRaiuds*2);
        self.center = CGPointMake(self.selflastLocation.x, self.selflastLocation.y);
    }
    else{
        self.frame = CGRectMake(0, 0, self.centerRadius*2, self.centerRadius*2);
        self.center = CGPointMake(self.selflastLocation.x, self.selflastLocation.y);
    }
    !_expanded? (_expanded = YES):(_expanded = NO);
}

- (void)centerButtonMoved{
    _expanded = NO;
    for (int i = 0; i < self.buttonCount; i++) {
        DCSubButton *currentButton = [self.buttons objectAtIndex:i];
        currentButton.center = kDCPathButtonSubButtonBirthLocation;
    }
}

- (void)centerButtonEnded{
    for (int i = 0; i < self.buttonCount; i++) {
        DCSubButton *currentButton = [self.buttons objectAtIndex:i];
        currentButton.hidden = NO;
    }
}

- (void)bottomFinalLocation:(CGPoint)offSet{
    self.viewOffset = offSet;
    self.center = CGPointMake(self.selflastLocation.x + self.viewOffset.x, self.selflastLocation.y + self.viewOffset.y);
    self.selflastLocation = self.center;
    self.centerButton.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    
}

#pragma mark DCSubButton Delegate

- (void)subButtonPress:(DCSubButton *)button{
    if ([_delegate respondsToSelector:@selector(button_0_action)] &&
        button == [self.buttons objectAtIndex:0]) {
        [_delegate button_0_action];
        NSLog(@"%d",button.tag);
    }
    else if ([_delegate respondsToSelector:@selector(button_1_action)] &&
             button == [self.buttons objectAtIndex:1]){
        [_delegate button_1_action];
        NSLog(@"%d",button.tag);
    }
    else if ([_delegate respondsToSelector:@selector(button_2_action)] &&
             button == [self.buttons objectAtIndex:2]){
        [_delegate button_2_action];
        NSLog(@"%d",button.tag);
    }
    else if ([_delegate respondsToSelector:@selector(button_3_action)] &&
             button == [self.buttons objectAtIndex:3]){
        [_delegate button_3_action];
        NSLog(@"%d",button.tag);
    }
    else if ([_delegate respondsToSelector:@selector(button_4_action)] &&
             button == [self.buttons objectAtIndex:4]){
        [_delegate button_4_action];
        NSLog(@"%d",button.tag);
    }
    else if ([_delegate respondsToSelector:@selector(button_5_action)] &&
             button == [self.buttons objectAtIndex:5]){
        [_delegate button_5_action];
        NSLog(@"%d",button.tag);
    }
}

@end
