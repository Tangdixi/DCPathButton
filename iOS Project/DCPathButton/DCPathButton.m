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
    
    parentView == nil? (self.parentView = parentView):(self.parentView = parentView);
    xAxis == 0? (self.centerLocationAxisX = kDCPathButtonCurrentFrameWidth/2) : (self.centerLocationAxisX = xAxis);
    yAxis == 0? (self.centerLocationAxisY = kDCPathButtonCurrentFrameHeight/2) : (self.centerLocationAxisY = yAxis);
    self.buttonCount = buttonCount;
    self.totalRaiuds = totalRadius;
    self.subRadius = subRadius;
    _expanded = NO;
    kDCPathButtonSubButtonBirthLocation = CGPointMake(-kDCPathButtonCurrentFrameWidth/2, -kDCPathButtonCurrentFrameHeight/2);
    kDCPathButtonSubButtonFinalLocation = CGPointMake(self.centerLocationAxisX, self.centerLocationAxisY);
    
    if (self = [super initWithFrame:self.parentView.bounds]) {
        [self configureCenterButton:centerRadius image:centerImageName backgroundImage:centerBackgroundName];
        [self configureTheButtons:buttonCount];
        imageBlock(self);
        [self.parentView addSubview:self];
    }
    return self;
}

#pragma mark - configure the center button and the sub button

- (void)configureCenterButton:(CGFloat)centerRadius image:(NSString *)imageName backgroundImage:(NSString *)backgroundImageName{
    self.centerButton = [[UIButton alloc]init];
    self.centerButton.frame = CGRectMake(0, 0, centerRadius * 2, centerRadius * 2);
    self.centerButton.center = CGPointMake(self.centerLocationAxisX, self.centerLocationAxisY);
    if (imageName == nil) {
        imageName = @"dc-center";
    }
    if (backgroundImageName == nil) {
        backgroundImageName = @"dc-background";
    }
    [self.centerButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [self.centerButton setBackgroundImage:[UIImage imageNamed:backgroundImageName] forState:UIControlStateNormal];
    [self.centerButton addTarget:self action:@selector(centerButtonPress) forControlEvents:UIControlEventTouchUpInside];
    self.centerButton.layer.zPosition = 1;
    [self addSubview:self.centerButton];
}

- (void)centerButtonPress{
    if (![self isExpanded]) {
        switch (self.buttonCount) {
            case 3:
            {
                [self button:[self.buttons objectAtIndex:0] appearAt:kDCPathButtonSubButtonTag_0_AppearLocation withDalay:0.5 duration:0.35];
                [self button:[self.buttons objectAtIndex:1] appearAt:kDCPathButtonSubButtonTag_1_AppearLocation withDalay:0.55 duration:0.4];
                [self button:[self.buttons objectAtIndex:2] appearAt:kDCPathButtonSubButtonTag_2_AppearLocation withDalay:0.6 duration:0.45];
            }
                break;
            case 4:
            {
                [self button:[self.buttons objectAtIndex:0] appearAt:kDCPathButtonSubButtonTag_0_AppearLocation withDalay:0.5 duration:0.35];
                [self button:[self.buttons objectAtIndex:1] appearAt:kDCPathButtonSubButtonTag_1_AppearLocation withDalay:0.55 duration:0.4];
                [self button:[self.buttons objectAtIndex:2] appearAt:kDCPathButtonSubButtonTag_2_AppearLocation withDalay:0.6 duration:0.45];
                [self button:[self.buttons objectAtIndex:3] appearAt:kDCPathButtonSubButtonTag_3_AppearLocation withDalay:0.65 duration:0.5];
            }
                break;
            case 5:
            {
                [self button:[self.buttons objectAtIndex:0] appearAt:kDCPathButtonSubButtonTag_0_AppearLocation withDalay:0.5 duration:0.35];
                [self button:[self.buttons objectAtIndex:1] appearAt:kDCPathButtonSubButtonTag_1_AppearLocation withDalay:0.55 duration:0.4];
                [self button:[self.buttons objectAtIndex:2] appearAt:kDCPathButtonSubButtonTag_2_AppearLocation withDalay:0.6 duration:0.45];
                [self button:[self.buttons objectAtIndex:3] appearAt:kDCPathButtonSubButtonTag_3_AppearLocation withDalay:0.65 duration:0.5];
                [self button:[self.buttons objectAtIndex:4] appearAt:kDCPathButtonSubButtonTag_4_AppearLocation withDalay:0.7 duration:0.55];
            }
                break;
            case 6:
            {
                [self button:[self.buttons objectAtIndex:0] appearAt:kDCPathButtonSubButtonTag_0_AppearLocation withDalay:0.5 duration:0.35];
                [self button:[self.buttons objectAtIndex:1] appearAt:kDCPathButtonSubButtonTag_1_AppearLocation withDalay:0.55 duration:0.4];
                [self button:[self.buttons objectAtIndex:2] appearAt:kDCPathButtonSubButtonTag_2_AppearLocation withDalay:0.6 duration:0.45];
                [self button:[self.buttons objectAtIndex:3] appearAt:kDCPathButtonSubButtonTag_3_AppearLocation withDalay:0.65 duration:0.5];
                [self button:[self.buttons objectAtIndex:4] appearAt:kDCPathButtonSubButtonTag_4_AppearLocation withDalay:0.7 duration:0.55];
                [self button:[self.buttons objectAtIndex:5] appearAt:kDCPathButtonSubButtonTag_5_AppearLocation withDalay:0.75 duration:0.6];
            }
                break;
            default:
                break;
        }
        self.expanded = YES;
    }
    else{
        switch (self.buttonCount) {
            case 3:
            {
                [self button:[self.buttons objectAtIndex:0]
                    shrinkAt:kDCPathButtonSubButtonTag_0_AppearLocation
                 offsetAxisX:kDCPathButtonLeftOffSetX
                 offSEtAxisY:[self offsetAxisY:kDCPathButtonLeftOffSetX withAngel:kDCPathButtonAngel60C]
                   withDelay:0.4
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1];
                [self button:[self.buttons objectAtIndex:1]
                    shrinkAt:kDCPathButtonSubButtonTag_1_AppearLocation
                 offsetAxisX:kDCPathButtonRightOffSetX
                 offSEtAxisY:-[self offsetAxisY:kDCPathButtonRightOffSetX withAngel:kDCPathButtonAngel60C] withDelay:0.5
             rotateDirection:kDCPathButtonRotationReverse animationDuration:1.2];
                [self button:[self.buttons objectAtIndex:2]
                    shrinkAt:kDCPathButtonSubButtonTag_2_AppearLocation
                 offsetAxisX:0 offSEtAxisY:kDCPathButtonVerticalOffSetX
                   withDelay:0.6
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1.4];
            }
                break;
            case 4:
            {
                [self button:[self.buttons objectAtIndex:0]
                    shrinkAt:kDCPathButtonSubButtonTag_0_AppearLocation
                 offsetAxisX:kDCPathButtonLeftOffSetX
                 offSEtAxisY:[self offsetAxisY:kDCPathButtonLeftOffSetX withAngel:kDCPathButtonAngel45C]
                   withDelay:0.4
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1];
                [self button:[self.buttons objectAtIndex:1]
                    shrinkAt:kDCPathButtonSubButtonTag_1_AppearLocation
                 offsetAxisX:kDCPathButtonRightOffSetX
                 offSEtAxisY:[self offsetAxisY:-kDCPathButtonRightOffSetX withAngel:kDCPathButtonAngel45C]
                   withDelay:0.45
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1.1];
                [self button:[self.buttons objectAtIndex:2]
                    shrinkAt:kDCPathButtonSubButtonTag_2_AppearLocation
                 offsetAxisX:kDCPathButtonLeftOffSetX
                 offSEtAxisY:[self offsetAxisY:-kDCPathButtonLeftOffSetX withAngel:kDCPathButtonAngel45C]
                   withDelay:0.5
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1.2];
                [self button:[self.buttons objectAtIndex:3]
                    shrinkAt:kDCPathButtonSubButtonTag_3_AppearLocation
                 offsetAxisX:kDCPathButtonRightOffSetX
                 offSEtAxisY:[self offsetAxisY:kDCPathButtonRightOffSetX withAngel:kDCPathButtonAngel45C]
                   withDelay:0.55
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1.3];
            }
                break;
            case 5:
            {
                [self button:[self.buttons objectAtIndex:0]
                    shrinkAt:kDCPathButtonSubButtonTag_0_AppearLocation
                 offsetAxisX:kDCPathButtonLeftOffSetX
                 offSEtAxisY:[self offsetAxisY:kDCPathButtonLeftOffSetX withAngel:kDCPathButtonAngel36C]
                   withDelay:0.4
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1];
                [self button:[self.buttons objectAtIndex:1]
                    shrinkAt:kDCPathButtonSubButtonTag_1_AppearLocation
                 offsetAxisX:kDCPathButtonRightOffSetX
                 offSEtAxisY:[self offsetAxisY:-kDCPathButtonRightOffSetX withAngel:kDCPathButtonAngel36C]
                   withDelay:0.44
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1.2];
                [self button:[self.buttons objectAtIndex:2]
                    shrinkAt:kDCPathButtonSubButtonTag_2_AppearLocation
                 offsetAxisX:kDCPathButtonLeftOffSetX
                 offSEtAxisY:[self offsetAxisY:-kDCPathButtonLeftOffSetX withAngel:kDCPathButtonAngel72C]
                   withDelay:0.48
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1.3];
                [self button:[self.buttons objectAtIndex:3]
                    shrinkAt:kDCPathButtonSubButtonTag_3_AppearLocation
                 offsetAxisX:0 offSEtAxisY:kDCPathButtonVerticalOffSetX
                   withDelay:0.52
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1.1];
                [self button:[self.buttons objectAtIndex:4]
                    shrinkAt:kDCPathButtonSubButtonTag_4_AppearLocation
                 offsetAxisX:kDCPathButtonRightOffSetX
                 offSEtAxisY:[self offsetAxisY:kDCPathButtonRightOffSetX withAngel:kDCPathButtonAngel72C]
                   withDelay:0.55
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1.4];
            }
                break;
            case 6:
            {
                [self button:[self.buttons objectAtIndex:0]
                    shrinkAt:kDCPathButtonSubButtonTag_0_AppearLocation
                 offsetAxisX:kDCPathButtonLeftOffSetX
                 offSEtAxisY:[self offsetAxisY:kDCPathButtonLeftOffSetX withAngel:kDCPathButtonAngel60C]
                   withDelay:0.4
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1];
                [self button:[self.buttons objectAtIndex:1]
                    shrinkAt:kDCPathButtonSubButtonTag_1_AppearLocation
                 offsetAxisX:0 offSEtAxisY:-kDCPathButtonVerticalOffSetX
                   withDelay:0.43
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1.1];
                [self button:[self.buttons objectAtIndex:2]
                    shrinkAt:kDCPathButtonSubButtonTag_2_AppearLocation
                 offsetAxisX:kDCPathButtonRightOffSetX
                 offSEtAxisY:[self offsetAxisY:-kDCPathButtonRightOffSetX withAngel:kDCPathButtonAngel60C]
                   withDelay:0.46
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1.2];
                [self button:[self.buttons objectAtIndex:3]
                    shrinkAt:kDCPathButtonSubButtonTag_3_AppearLocation
                 offsetAxisX:kDCPathButtonLeftOffSetX
                 offSEtAxisY:[self offsetAxisY:-kDCPathButtonLeftOffSetX withAngel:kDCPathButtonAngel60C]
                   withDelay:0.49
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1.3];
                [self button:[self.buttons objectAtIndex:4]
                    shrinkAt:kDCPathButtonSubButtonTag_4_AppearLocation
                 offsetAxisX:0 offSEtAxisY:kDCPathButtonVerticalOffSetX
                   withDelay:0.52
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1.3];
                [self button:[self.buttons objectAtIndex:5]
                    shrinkAt:kDCPathButtonSubButtonTag_5_AppearLocation
                 offsetAxisX:kDCPathButtonRightOffSetX
                 offSEtAxisY:[self offsetAxisY:kDCPathButtonRightOffSetX withAngel:kDCPathButtonAngel60C]
                   withDelay:0.55
             rotateDirection:kDCPathButtonRotationNormal animationDuration:1.4];
            }
            default:
                break;
        }
        [self centerButtonAnimation];
        self.expanded = NO;
    }
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
                                                                     self.centerLocationAxisX - self.totalRaiuds * sinf(kDCCovertAngelToRadian(kDCPathButtonAngel60C)),
                                                                     self.centerLocationAxisY - self.totalRaiuds * cosf(kDCCovertAngelToRadian(kDCPathButtonAngel60C)));
            kDCPathButtonSubButtonTag_1_AppearLocation = CGPointMake(
                                                                     self.centerLocationAxisX + self.totalRaiuds * sinf(kDCCovertAngelToRadian(kDCPathButtonAngel60C)),
                                                                     self.centerLocationAxisY - self.totalRaiuds * cosf(kDCCovertAngelToRadian(kDCPathButtonAngel60C)));
            kDCPathButtonSubButtonTag_2_AppearLocation = CGPointMake(
                                                                     self.centerLocationAxisX ,
                                                                     self.centerLocationAxisY +self.totalRaiuds);
        }
            break;
        case 4:
        {
            kDCPathButtonSubButtonTag_0_AppearLocation = CGPointMake(
                                                                     self.centerLocationAxisX - self.totalRaiuds * sinf(kDCCovertAngelToRadian(kDCPathButtonAngel45C)),
                                                                     self.centerLocationAxisY - self.totalRaiuds * cosf(kDCCovertAngelToRadian(kDCPathButtonAngel45C)));
            kDCPathButtonSubButtonTag_1_AppearLocation = CGPointMake(
                                                                     self.centerLocationAxisX + self.totalRaiuds * sinf(kDCCovertAngelToRadian(kDCPathButtonAngel45C)),
                                                                     self.centerLocationAxisY - self.totalRaiuds * cosf(kDCCovertAngelToRadian(kDCPathButtonAngel45C)));
            kDCPathButtonSubButtonTag_2_AppearLocation = CGPointMake(
                                                                     self.centerLocationAxisX - self.totalRaiuds * sinf(kDCCovertAngelToRadian(kDCPathButtonAngel45C)),
                                                                     self.centerLocationAxisY + self.totalRaiuds * cosf(kDCCovertAngelToRadian(kDCPathButtonAngel45C)));
            kDCPathButtonSubButtonTag_3_AppearLocation = CGPointMake(
                                                                     self.centerLocationAxisX + self.totalRaiuds * sinf(kDCCovertAngelToRadian(kDCPathButtonAngel45C)),
                                                                     self.centerLocationAxisY + self.totalRaiuds * cosf(kDCCovertAngelToRadian(kDCPathButtonAngel45C)));
        }
            break;
        case 5:
        {
            kDCPathButtonSubButtonTag_0_AppearLocation = CGPointMake(
                                                                     self.centerLocationAxisX - self.totalRaiuds * sinf(kDCCovertAngelToRadian(kDCPathButtonAngel36C)),
                                                                     self.centerLocationAxisY - self.totalRaiuds * cosf(kDCCovertAngelToRadian(kDCPathButtonAngel36C)));
            kDCPathButtonSubButtonTag_1_AppearLocation = CGPointMake(
                                                                     self.centerLocationAxisX + self.totalRaiuds * sinf(kDCCovertAngelToRadian(kDCPathButtonAngel36C)),
                                                                     self.centerLocationAxisY - self.totalRaiuds * cosf(kDCCovertAngelToRadian(kDCPathButtonAngel36C)));
            kDCPathButtonSubButtonTag_2_AppearLocation = CGPointMake(
                                                                     self.centerLocationAxisX - self.totalRaiuds * sinf(kDCCovertAngelToRadian(kDCPathButtonAngel72C)),
                                                                     self.centerLocationAxisY + self.totalRaiuds * cosf(kDCCovertAngelToRadian(kDCPathButtonAngel72C)));
            kDCPathButtonSubButtonTag_3_AppearLocation = CGPointMake(
                                                                     self.centerLocationAxisX,
                                                                     self.centerLocationAxisY + self.totalRaiuds);
            kDCPathButtonSubButtonTag_4_AppearLocation = CGPointMake(
                                                                     self.centerLocationAxisX + self.totalRaiuds * sinf(kDCCovertAngelToRadian(kDCPathButtonAngel72C)),
                                                                     self.centerLocationAxisY + self.totalRaiuds * cosf(kDCCovertAngelToRadian(kDCPathButtonAngel72C)));
        }
            break;
        case 6:
        {
            kDCPathButtonSubButtonTag_0_AppearLocation = CGPointMake(
                                                                     self.centerLocationAxisX - self.totalRaiuds * sinf(kDCCovertAngelToRadian(kDCPathButtonAngel60C)),
                                                                     self.centerLocationAxisY - self.totalRaiuds * cosf(kDCCovertAngelToRadian(kDCPathButtonAngel60C)));
            kDCPathButtonSubButtonTag_1_AppearLocation = CGPointMake(
                                                                     self.centerLocationAxisX,
                                                                     self.centerLocationAxisY - self.totalRaiuds);
            kDCPathButtonSubButtonTag_2_AppearLocation = CGPointMake(
                                                                     self.centerLocationAxisX + self.totalRaiuds * sinf(kDCCovertAngelToRadian(kDCPathButtonAngel60C)),
                                                                     self.centerLocationAxisY - self.totalRaiuds * cosf(kDCCovertAngelToRadian(kDCPathButtonAngel60C)));
            kDCPathButtonSubButtonTag_3_AppearLocation = CGPointMake(
                                                                     self.centerLocationAxisX - self.totalRaiuds * sinf(kDCCovertAngelToRadian(kDCPathButtonAngel60C)),
                                                                     self.centerLocationAxisY + self.totalRaiuds * cosf(kDCCovertAngelToRadian(kDCPathButtonAngel60C)));
            kDCPathButtonSubButtonTag_4_AppearLocation = CGPointMake(
                                                                     self.centerLocationAxisX,
                                                                     self.centerLocationAxisY + self.totalRaiuds);
            kDCPathButtonSubButtonTag_5_AppearLocation = CGPointMake(
                                                                     self.centerLocationAxisX + self.totalRaiuds * sinf(kDCCovertAngelToRadian(kDCPathButtonAngel60C)),
                                                                     self.centerLocationAxisY + self.totalRaiuds * cosf(kDCCovertAngelToRadian(kDCPathButtonAngel60C)));
        }
            break;
        default:
            break;
    }
    self.buttons = [NSMutableArray array];
    for (NSInteger i = 0; i<buttonCount; i++) {
        subButton = [[DCSubButton alloc]init];
        subButton.delegate = self;
        subButton.frame = CGRectMake(0, 0, self.subRadius * 2, self.subRadius * 2);
        subButton.center = kDCPathButtonSubButtonBirthLocation;
        NSString *imageFormat = [NSString stringWithFormat:@"dc-button_%d",i];
        [subButton setImage:[UIImage imageNamed:imageFormat] forState:UIControlStateNormal];
        
        [self addSubview:subButton];
        [self.buttons addObject:subButton];
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
    CGPathAddLineToPoint(path, NULL, kDCPathButtonSubButtonFinalLocation.x, kDCPathButtonSubButtonFinalLocation.y);
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


#pragma DCSubButton Delegate

- (void)subButtonPress:(DCSubButton *)button{
    if ([_delegate respondsToSelector:@selector(button_0_action)] &&
        button == [self.buttons objectAtIndex:0]) {
        [_delegate button_0_action];
    }
    else if ([_delegate respondsToSelector:@selector(button_1_action)] &&
             button == [self.buttons objectAtIndex:1]){
        [_delegate button_1_action];
    }
    else if ([_delegate respondsToSelector:@selector(button_2_action)] &&
             button == [self.buttons objectAtIndex:2]){
        [_delegate button_2_action];
    }
    else if ([_delegate respondsToSelector:@selector(button_3_action)] &&
             button == [self.buttons objectAtIndex:3]){
        [_delegate button_3_action];
    }
    else if ([_delegate respondsToSelector:@selector(button_4_action)] &&
             button == [self.buttons objectAtIndex:4]){
        [_delegate button_4_action];
    }
    else if ([_delegate respondsToSelector:@selector(button_5_action)] &&
             button == [self.buttons objectAtIndex:5]){
        [_delegate button_5_action];
    }
}

@end
