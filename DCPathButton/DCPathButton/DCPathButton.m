//
//  DCPathButton.m
//  DCPathButton
//
//  Created by Paul on 3/21/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import "DCPathButton.h"

@interface DCPathButton (){
    CGFloat kCurrentButtonsCount;
    CGFloat kCurrentCenterButtonRadius;
    CGFloat kCurrentButtonRadius;
    
    CGFloat kDCPathButtonAllTypeTag_0_startPosition_x;
    CGFloat kDCPathButtonAllTypeTag_0_startPosition_y;
    CGFloat kDCPathButtonAllTypeTag_0_endPosition_x;
    CGFloat kDCPathButtonAllTypeTag_0_endPosition_y;
    
    CGFloat kDCPathButtonAllTypeTag_1_startPosition_x;
    CGFloat kDCPathButtonAllTypeTag_1_startPosition_y;
    CGFloat kDCPathButtonAllTypeTag_1_endPosition_x;
    CGFloat kDCPathButtonAllTypeTag_1_endPosition_y;
    
    CGFloat kDCPathButtonType_1_3_Tag_2_startPosition_x;
    CGFloat kDCPathButtonType_1_3_Tag_2_startPosition_y;
    CGFloat kDCPathButtonType_1_3_Tag_2_endPosition_x;
    CGFloat kDCPathButtonType_1_3_Tag_2_endPosition_y;
    
    CGFloat kDCPathButtonType_2_Tag_2_startPosition_x;
    CGFloat kDCPathButtonType_2_Tag_2_startPosition_y;
    CGFloat kDCPathButtonType_2_Tag_2_endPosition_x;
    CGFloat kDCPathButtonType_2_Tag_2_endPosition_y;
    
    CGFloat kDCPathButtonType_2_Tag_3_startPosition_x;
    CGFloat kDCPathButtonType_2_Tag_3_startPosition_y;
    CGFloat kDCPathButtonType_2_Tag_3_endPosition_x;
    CGFloat kDCPathButtonType_2_Tag_3_endPosition_y;
    
    CGFloat kDCPathButtonType_3_Tag_3_startPosition_x;
    CGFloat kDCPathButtonType_3_Tag_3_startPosition_y;
    CGFloat kDCPathButtonType_3_Tag_3_endPosition_x;
    CGFloat kDCPathButtonType_3_Tag_3_endPosition_y;
    
    CGFloat kDCPathButtonType_3_Tag_4_startPosition_x;
    CGFloat kDCPathButtonType_3_Tag_4_startPosition_y;
    CGFloat kDCPathButtonType_3_Tag_4_endPosition_x;
    CGFloat kDCPathButtonType_3_Tag_4_endPosition_y;
}

@end
@implementation DCPathButton

@synthesize centerButton, button_0, button_1, button_2, button_3, button_4;

static CGFloat const kDCPathButtonDefaultCenterRadius = 40.0f;
static CGFloat const kDCPathButtonDefaultButtonRadius = 30.0f;
static CGFloat const kDCPathButtonDefaultRotation = M_PI*2;
static CGFloat const kDCPathButtonDefaultReverseRotation = -M_PI*2;
static CGFloat const kDCPathButtonDefaultShakeLeft = M_PI*0.1;
static CGFloat const kDCPathButtonDefaultShakeRight = -M_PI*0.1;

- (id)initWithButtonCount:(NSUInteger)count totalRadius:(CGFloat)totalRadius centerRadius:(CGFloat)centerRadius centerImage:(UIImage *)centerImage centerBackgroundImage:(UIImage *)centerBackgroundImage centerButtonHighLightImage:(UIImage *)centerButtonHighLightImage buttonRadius:(CGFloat)buttonRadius buttonBackgroundImage:(UIImage *)buttonBackgroundImage buttonImages:(NSArray *)buttonImages{
    
    centerRadius == 0? (kCurrentCenterButtonRadius = kDCPathButtonDefaultCenterRadius) :(kCurrentCenterButtonRadius = centerRadius);
    buttonRadius == 0? (kCurrentButtonRadius = kDCPathButtonDefaultButtonRadius) :
        (kCurrentButtonRadius = buttonRadius);
    if (count < 3) {kCurrentButtonsCount = 3;}
    if (count > 5) {kCurrentButtonsCount = 5;}
    else{kCurrentButtonsCount = count;}
    
    if (self = [super initWithFrame:kDCPathButtonCurrentScreenRect]) {
        self.backgroundColor = [UIColor clearColor];
        [self getReadyButtonParameterWithCount:kCurrentButtonsCount totalRaius:totalRadius];
        [self setUpCenterButtonRadius:kCurrentCenterButtonRadius buttonImage:centerImage backgroundImage:centerBackgroundImage highLightImage:centerButtonHighLightImage];
        [self setUpButtons:kCurrentButtonsCount withImages:buttonImages backgroundImage:buttonBackgroundImage radius:kCurrentButtonRadius];
    }
    return self;
}

- (void)getReadyButtonParameterWithCount:(NSUInteger)count totalRaius:(CGFloat)totalRadius{
    [self configureAllTypeBasicParameters:totalRadius];
     switch (count) {
        case 3:
        {
            [self configureType_1BasicParameters:totalRadius];
        }
            break;
        case 4:
        {
            [self configureType_2BasicParameters:totalRadius];
        }
            break;
        case 5:
        {
            [self configureType_3BasicParameters:totalRadius];
        }
            break;
        default:
            break;
    }
}

- (void)configureAllTypeBasicParameters:(CGFloat)totalRadius{
    isExpand = NO;
    // tag 0 position info.
    kDCPathButtonAllTypeTag_0_startPosition_x = kDCPathButtonCurrentScreenWidth/2 +
    totalRadius * cosf(kDCPathButtonBasicRadian) + kCurrentButtonRadius;
    kDCPathButtonAllTypeTag_0_startPosition_y = kDCPathButtonCurrentScreenHeight +
    kDCPathButtonDefaultButtonRadius - kCurrentButtonRadius;
    kDCPathButtonAllTypeTag_0_endPosition_x = kDCPathButtonCurrentScreenWidth/2 -
    totalRadius * cosf(kDCPathButtonBasicRadian) - kCurrentButtonRadius;
    kDCPathButtonAllTypeTag_0_endPosition_y = kDCPathButtonCurrentScreenHeight/2 -
    totalRadius * sinf(kDCPathButtonBasicRadian) - kCurrentButtonRadius;
    
    // tag 1 position info.
    kDCPathButtonAllTypeTag_1_startPosition_x = kDCPathButtonCurrentScreenWidth/2 -
    totalRadius * cosf(kDCPathButtonBasicRadian) - kCurrentButtonRadius;
    kDCPathButtonAllTypeTag_1_startPosition_y = kDCPathButtonCurrentScreenHeight +
    kDCPathButtonDefaultButtonRadius - kCurrentButtonRadius;
    kDCPathButtonAllTypeTag_1_endPosition_x = kDCPathButtonCurrentScreenWidth/2 +
    totalRadius * cosf(kDCPathButtonBasicRadian) + kCurrentButtonRadius;
    kDCPathButtonAllTypeTag_1_endPosition_y = kDCPathButtonCurrentScreenHeight/2 -
    totalRadius * sinf(kDCPathButtonBasicRadian) - kCurrentButtonRadius;
}

- (void)configureType_1BasicParameters:(CGFloat)totalRadius{
    // tag 2 position info.
    kDCPathButtonType_1_3_Tag_2_startPosition_x = kDCPathButtonCurrentScreenWidth/2 ;
    kDCPathButtonType_1_3_Tag_2_startPosition_y = -kDCPathButtonDefaultButtonRadius - kCurrentButtonRadius;
    kDCPathButtonType_1_3_Tag_2_endPosition_x = kDCPathButtonCurrentScreenWidth/2 ;
    kDCPathButtonType_1_3_Tag_2_endPosition_y = kDCPathButtonCurrentScreenHeight/2 + totalRadius +kCurrentButtonRadius;
}

- (void)configureType_2BasicParameters:(CGFloat)totalRadius{
    kDCPathButtonType_2_Tag_2_startPosition_x = kDCPathButtonCurrentScreenWidth/2 +
    totalRadius * cosf(kDCPathButtonBasicRadian) + kCurrentButtonRadius;
    NSLog(@"%.0f",kDCPathButtonType_2_Tag_2_startPosition_x);
    kDCPathButtonType_2_Tag_2_startPosition_y = -kCurrentButtonRadius*2;
    kDCPathButtonType_2_Tag_2_endPosition_x = kDCPathButtonCurrentScreenWidth/2 -
    totalRadius * cosf(kDCPathButtonBasicRadian) - kCurrentButtonRadius;
    kDCPathButtonType_2_Tag_2_endPosition_y = kDCPathButtonCurrentScreenHeight/2 +
    totalRadius * sinf(kDCPathButtonBasicRadian) + kCurrentButtonRadius;
    
    kDCPathButtonType_2_Tag_3_startPosition_x = kDCPathButtonCurrentScreenWidth/2 -
    totalRadius * cosf(kDCPathButtonBasicRadian) - kCurrentButtonRadius;
    kDCPathButtonType_2_Tag_3_startPosition_y = -kCurrentButtonRadius*2;
    kDCPathButtonType_2_Tag_3_endPosition_x = kDCPathButtonCurrentScreenWidth/2 +
    totalRadius * cosf(kDCPathButtonBasicRadian) + kCurrentButtonRadius;
    kDCPathButtonType_2_Tag_3_endPosition_y = kDCPathButtonCurrentScreenHeight/2 +
    totalRadius * sinf(kDCPathButtonBasicRadian) + kCurrentButtonRadius;
}

- (void)configureType_3BasicParameters:(CGFloat)totalRadius{
    kDCPathButtonType_1_3_Tag_2_startPosition_x = kDCPathButtonCurrentScreenWidth/2 ;
    kDCPathButtonType_1_3_Tag_2_startPosition_y = -kDCPathButtonDefaultButtonRadius - kCurrentButtonRadius;
    kDCPathButtonType_1_3_Tag_2_endPosition_x = kDCPathButtonCurrentScreenWidth/2 ;
    kDCPathButtonType_1_3_Tag_2_endPosition_y = kDCPathButtonCurrentScreenHeight/2 + totalRadius +kCurrentButtonRadius;
    
    kDCPathButtonType_3_Tag_3_startPosition_x = kDCPathButtonCurrentScreenWidth/2 +
    totalRadius*sinf(kDCPathButtonBasicRadian_2) + kCurrentButtonRadius;
    kDCPathButtonType_3_Tag_3_startPosition_y = -kCurrentButtonRadius*2;
    kDCPathButtonType_3_Tag_3_endPosition_x = kDCPathButtonCurrentScreenWidth/2 -
    totalRadius*sinf(kDCPathButtonBasicRadian_2) - kCurrentButtonRadius;
    kDCPathButtonType_3_Tag_3_endPosition_y = kDCPathButtonCurrentScreenHeight/2 +
    totalRadius*cosf(kDCPathButtonBasicRadian_2) + kCurrentButtonRadius;
    
    kDCPathButtonType_3_Tag_4_startPosition_x = kDCPathButtonCurrentScreenWidth/2 -
    totalRadius*sinf(kDCPathButtonBasicRadian_2) - kCurrentButtonRadius;
    kDCPathButtonType_3_Tag_4_startPosition_y = -kCurrentButtonRadius*2;
    kDCPathButtonType_3_Tag_4_endPosition_x = kDCPathButtonCurrentScreenWidth/2 +
    totalRadius*sinf(kDCPathButtonBasicRadian_2) + kCurrentButtonRadius;
    kDCPathButtonType_3_Tag_4_endPosition_y = kDCPathButtonCurrentScreenHeight/2 +
    totalRadius*cosf(kDCPathButtonBasicRadian_2) + kCurrentButtonRadius;
}

//  Animation type 1 delegate

- (void)setUpCenterButtonRadius:(CGFloat)cRadius buttonImage:(UIImage *)cbImage backgroundImage:(UIImage *)cbbImage highLightImage:(UIImage *)highLightImage{
    centerButton = [[UIButton alloc] init];
    
    centerButton.frame = CGRectMake(kDCPathButtonCurrentScreenWidth/2.0f - cRadius,
                                        kDCPathButtonCurrentScreenHeight/2.0f - cRadius,
                                        cRadius*2,
                                        cRadius*2);
    if (cbImage == 0) {
        cbImage = [UIImage imageNamed:kDCPathCenterButtonDefaultImage];
        if (cbbImage > nil) {
            cbbImage = [UIImage imageNamed:kDCPathCenterButtonDefaultBackgroundImage];
            if (highLightImage == nil) {
                highLightImage = [UIImage imageNamed:kDCPathCenterButtonDefaultHighLightImage];
            }
        }
    }
    [centerButton setBackgroundImage:cbbImage forState:UIControlStateNormal];
    [centerButton setImage:cbImage forState:UIControlStateNormal];
    [centerButton setImage:highLightImage forState:UIControlStateHighlighted];
    
    [centerButton addTarget:self action:@selector(centerButtonPress) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:centerButton];
}

- (void)setUpButtonBasicParameter{
    button_0 = [[UIButton alloc] init];
    button_1 = [[UIButton alloc] init];
    button_2 = [[UIButton alloc] init];
    button_3 = [[UIButton alloc] init];
    button_4 = [[UIButton alloc] init];
    
    button_0.tag = 0;
    button_1.tag = 1;
    button_2.tag = 2;
    button_3.tag = 3;
    button_4.tag = 4;
    
    button_0.frame = CGRectMake(kDCPathButtonAllTypeTag_0_startPosition_x, kDCPathButtonAllTypeTag_0_startPosition_y, kCurrentButtonRadius*2, kCurrentButtonRadius*2);
    button_1.frame = CGRectMake(kDCPathButtonAllTypeTag_1_startPosition_x, kDCPathButtonAllTypeTag_1_startPosition_y, kCurrentButtonRadius*2, kCurrentButtonRadius*2);
}

- (void)setUpButtons:(NSUInteger)count withImages:(NSArray *)images backgroundImage:(UIImage *)bImage radius:(CGFloat)buttonRadius{
    [self setUpButtonBasicParameter];
    switch (count) {
        case 3:
        {
            button_2.frame = CGRectMake(kDCPathButtonType_1_3_Tag_2_startPosition_x, kDCPathButtonType_1_3_Tag_2_startPosition_y, buttonRadius*2, buttonRadius*2);
            
            [button_0 setImage:[images objectAtIndex:0] forState:UIControlStateNormal];
            [button_1 setImage:[images objectAtIndex:1] forState:UIControlStateNormal];
            [button_2 setImage:[images objectAtIndex:2] forState:UIControlStateNormal];
            
            [self addSubview:button_0];
            [self addSubview:button_1];
            [self addSubview:button_2];
        }
            break;
        case 4:
        {
            button_2.frame = CGRectMake(kDCPathButtonType_2_Tag_2_startPosition_x, kDCPathButtonType_2_Tag_2_startPosition_y, buttonRadius*2, buttonRadius*2);
            button_3.frame = CGRectMake(kDCPathButtonType_2_Tag_3_startPosition_x, kDCPathButtonType_2_Tag_3_startPosition_y, buttonRadius*2, buttonRadius*2);
            
            [button_0 setImage:[images objectAtIndex:0] forState:UIControlStateNormal];
            [button_1 setImage:[images objectAtIndex:1] forState:UIControlStateNormal];
            [button_2 setImage:[images objectAtIndex:2] forState:UIControlStateNormal];
            [button_3 setImage:[images objectAtIndex:3] forState:UIControlStateNormal];
            
            [button_0 setBackgroundImage:bImage forState:UIControlStateNormal];
            [button_1 setBackgroundImage:bImage forState:UIControlStateNormal];
            [button_2 setBackgroundImage:bImage forState:UIControlStateNormal];
            [button_3 setBackgroundImage:bImage forState:UIControlStateNormal];
            
            [self addSubview:button_0];
            [self addSubview:button_1];
            [self addSubview:button_2];
            [self addSubview:button_3];
        }
            break;
        case 5:
        {
            button_2.frame = CGRectMake(kDCPathButtonType_1_3_Tag_2_startPosition_x, kDCPathButtonType_1_3_Tag_2_startPosition_y, buttonRadius*2, buttonRadius*2);
            button_3.frame = CGRectMake(kDCPathButtonType_3_Tag_3_startPosition_x, kDCPathButtonType_3_Tag_3_startPosition_y, buttonRadius*2, buttonRadius*2);
            button_4.frame = CGRectMake(kDCPathButtonType_3_Tag_4_startPosition_x, kDCPathButtonType_3_Tag_4_startPosition_y, buttonRadius*2, buttonRadius*2);

            [button_0 setImage:[images objectAtIndex:0] forState:UIControlStateNormal];
            [button_1 setImage:[images objectAtIndex:1] forState:UIControlStateNormal];
            [button_2 setImage:[images objectAtIndex:2] forState:UIControlStateNormal];
            [button_3 setImage:[images objectAtIndex:3] forState:UIControlStateNormal];
            [button_4 setImage:[images objectAtIndex:4] forState:UIControlStateNormal];
            
            [button_0 setBackgroundImage:bImage forState:UIControlStateNormal];
            [button_1 setBackgroundImage:bImage forState:UIControlStateNormal];
            [button_2 setBackgroundImage:bImage forState:UIControlStateNormal];
            [button_3 setBackgroundImage:bImage forState:UIControlStateNormal];
            [button_4 setBackgroundImage:bImage forState:UIControlStateNormal];
            
            [self addSubview:button_0];
            [self addSubview:button_1];
            [self addSubview:button_2];
            [self addSubview:button_3];
            [self addSubview:button_4];
        }
            break;
        default:
            break;
    }
}

- (IBAction)centerButtonPress{
    if (!isExpand) {
        [self expandButtonAnimation_1:button_0
                       fromStart_x:kDCPathButtonAllTypeTag_1_startPosition_x
                        andStart_y:kDCPathButtonAllTypeTag_1_startPosition_y
                           toEnd_x:kDCPathButtonAllTypeTag_0_endPosition_x
                          andEnd_y:kDCPathButtonAllTypeTag_0_endPosition_y
                        withRadius:kCurrentButtonRadius
                             delay:0.3];
        [self expandButtonAnimation_1:button_1
                       fromStart_x:kDCPathButtonAllTypeTag_0_startPosition_x
                        andStart_y:kDCPathButtonAllTypeTag_0_startPosition_y
                           toEnd_x:kDCPathButtonAllTypeTag_1_endPosition_x
                          andEnd_y:kDCPathButtonAllTypeTag_1_endPosition_y
                        withRadius:kCurrentButtonRadius
                             delay:0.4];
        switch ((int)kCurrentButtonsCount) {
            case 3:
            {
                [self expandButtonAnimation_1:button_2
                               fromStart_x:kDCPathButtonType_1_3_Tag_2_startPosition_x
                                andStart_y:kDCPathButtonType_1_3_Tag_2_startPosition_y
                                   toEnd_x:kDCPathButtonType_1_3_Tag_2_endPosition_x
                                  andEnd_y:kDCPathButtonType_1_3_Tag_2_endPosition_y
                                withRadius:kCurrentButtonRadius
                                     delay:0.45];
            }
                break;
            case 4:
            {
                [self expandButtonAnimation_1:button_2
                               fromStart_x:kDCPathButtonType_2_Tag_3_startPosition_x
                                andStart_y:kDCPathButtonType_2_Tag_3_startPosition_y
                                   toEnd_x:kDCPathButtonType_2_Tag_2_endPosition_x
                                  andEnd_y:kDCPathButtonType_2_Tag_2_endPosition_y
                                withRadius:kCurrentButtonRadius
                                     delay:0.6];
                [self expandButtonAnimation_1:button_3
                               fromStart_x:kDCPathButtonType_2_Tag_2_startPosition_x
                                andStart_y:kDCPathButtonType_2_Tag_2_startPosition_y
                                   toEnd_x:kDCPathButtonType_2_Tag_3_endPosition_x
                                  andEnd_y:kDCPathButtonType_2_Tag_3_endPosition_y
                                withRadius:kCurrentButtonRadius
                                     delay:0.55];
            }
                break;
            case 5:
            {
                [self expandButtonAnimation_1:button_2
                               fromStart_x:kDCPathButtonType_1_3_Tag_2_startPosition_x
                                andStart_y:kDCPathButtonType_1_3_Tag_2_startPosition_y
                                   toEnd_x:kDCPathButtonType_1_3_Tag_2_endPosition_x
                                  andEnd_y:kDCPathButtonType_1_3_Tag_2_endPosition_y
                                withRadius:kCurrentButtonRadius
                                     delay:0.5];
                [self expandButtonAnimation_1:button_3
                               fromStart_x:kDCPathButtonType_3_Tag_4_startPosition_x
                                andStart_y:kDCPathButtonType_3_Tag_4_startPosition_y
                                   toEnd_x:kDCPathButtonType_3_Tag_3_endPosition_x
                                  andEnd_y:kDCPathButtonType_3_Tag_3_endPosition_y
                                withRadius:kCurrentButtonRadius
                                     delay:0.6];
                [self expandButtonAnimation_1:button_4
                               fromStart_x:kDCPathButtonType_3_Tag_3_startPosition_x
                                andStart_y:kDCPathButtonType_3_Tag_3_startPosition_y
                                   toEnd_x:kDCPathButtonType_3_Tag_4_endPosition_x
                                  andEnd_y:kDCPathButtonType_3_Tag_4_endPosition_y
                                withRadius:kCurrentButtonRadius
                                     delay:0.7];
            }
                break;
            default:
                break;
        }
        isExpand = YES;
    }   
    else{
        [self closeButton:button_0
           fromEndPoint_x:kDCPathButtonAllTypeTag_0_endPosition_x
            andEndPoint_y:kDCPathButtonAllTypeTag_0_endPosition_y
      resetToStartPoint_x:kDCPathButtonAllTypeTag_0_startPosition_x
      resetToStartPoint_y:kDCPathButtonAllTypeTag_0_startPosition_y
                 duration:0.1];
        [self closeButton:button_1
           fromEndPoint_x:kDCPathButtonAllTypeTag_1_endPosition_x
            andEndPoint_y:kDCPathButtonAllTypeTag_1_endPosition_y
      resetToStartPoint_x:kDCPathButtonAllTypeTag_1_startPosition_x
      resetToStartPoint_y:kDCPathButtonAllTypeTag_1_startPosition_y
                 duration:0.3];
        switch ((int)kCurrentButtonsCount) {
            case 3:
            {
                [self closeButton:button_2
                   fromEndPoint_x:kDCPathButtonType_1_3_Tag_2_endPosition_x
                    andEndPoint_y:kDCPathButtonType_1_3_Tag_2_endPosition_y
              resetToStartPoint_x:kDCPathButtonType_1_3_Tag_2_startPosition_x
              resetToStartPoint_y:kDCPathButtonType_1_3_Tag_2_startPosition_y
                         duration:0.5];
            }
                break;
            case 4:
            {
                [self closeButton:button_2
                   fromEndPoint_x:kDCPathButtonType_2_Tag_2_endPosition_x
                    andEndPoint_y:kDCPathButtonType_2_Tag_2_endPosition_y
              resetToStartPoint_x:kDCPathButtonType_2_Tag_2_startPosition_x
              resetToStartPoint_y:kDCPathButtonType_2_Tag_2_startPosition_y
                         duration:0.7];
                [self closeButton:button_3
                   fromEndPoint_x:kDCPathButtonType_2_Tag_3_endPosition_x
                    andEndPoint_y:kDCPathButtonType_2_Tag_3_endPosition_y
              resetToStartPoint_x:kDCPathButtonType_2_Tag_3_startPosition_x
              resetToStartPoint_y:kDCPathButtonType_2_Tag_3_startPosition_y
                         duration:0.5];
            }
                break;
            case 5:
            {
                [self closeButton:button_2
                   fromEndPoint_x:kDCPathButtonType_1_3_Tag_2_endPosition_x
                    andEndPoint_y:kDCPathButtonType_1_3_Tag_2_endPosition_y
              resetToStartPoint_x:kDCPathButtonType_1_3_Tag_2_startPosition_x
              resetToStartPoint_y:kDCPathButtonType_1_3_Tag_2_startPosition_y
                         duration:0.7];
                [self closeButton:button_3
                   fromEndPoint_x:kDCPathButtonType_3_Tag_3_endPosition_x
                    andEndPoint_y:kDCPathButtonType_3_Tag_3_endPosition_y
              resetToStartPoint_x:kDCPathButtonType_3_Tag_3_startPosition_x
              resetToStartPoint_y:kDCPathButtonType_3_Tag_3_startPosition_y
                         duration:0.5];
                [self closeButton:button_4
                   fromEndPoint_x:kDCPathButtonType_3_Tag_4_endPosition_x
                    andEndPoint_y:kDCPathButtonType_3_Tag_4_endPosition_y
              resetToStartPoint_x:kDCPathButtonType_3_Tag_4_startPosition_x
              resetToStartPoint_y:kDCPathButtonType_3_Tag_4_startPosition_y
                         duration:0.9];
            }
                break;
            default:
                break;
        }
        isExpand = NO;
    }
}

- (void)expandButtonAnimation_1:(UIButton *)button fromStart_x:(CGFloat)startPoint_x andStart_y:(CGFloat)startPoint_y toEnd_x:(CGFloat)endPoint_x andEnd_y:(CGFloat)endPoint_y withRadius:(CGFloat)currentButtonRadius delay:(CGFloat)time{
    CAKeyframeAnimation *button_rotation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    button_rotation.values = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0f], [NSNumber numberWithFloat:(button.tag%2) == 0? kDCPathButtonDefaultRotation:kDCPathButtonDefaultReverseRotation], [NSNumber numberWithFloat:(button.tag%2) == 0? kDCPathButtonDefaultRotation:kDCPathButtonDefaultReverseRotation], nil];
    button_rotation.duration = 1.0f;
    
    CAKeyframeAnimation *button_flyIn = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    button_flyIn.duration = 1.0f;
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, startPoint_x, startPoint_y);
    CGPathAddLineToPoint(path, NULL, endPoint_x, button.tag > 1? (endPoint_y + currentButtonRadius):(endPoint_y - currentButtonRadius));
    CGPathAddLineToPoint(path, NULL, endPoint_x, endPoint_y);
    button_flyIn.path = path;
    button_flyIn.calculationMode = kCAAnimationLinear;
    button_flyIn.keyTimes = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0f], [NSNumber numberWithFloat:time], [NSNumber numberWithFloat:1.0], nil];
    CGPathRelease(path);
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = [NSArray arrayWithObjects:button_flyIn, button_rotation, nil];
    animationGroup.duration = 1.0f;
    animationGroup.delegate = self;
    [button.layer addAnimation:animationGroup forKey:@"ButtonExpandAnimation_1"];
    button.center = CGPointMake(endPoint_x, endPoint_y);
}

- (void)closeButton:(UIButton *)button fromEndPoint_x:(CGFloat)endPoint_x andEndPoint_y:(CGFloat)endPoint_y
resetToStartPoint_x:(CGFloat)startPoint_x resetToStartPoint_y:(CGFloat)startPoint_y duration:(CGFloat)time{
    CAKeyframeAnimation *button_shake = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    button_shake.values = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0f], [NSNumber numberWithFloat:button.tag == 0? kDCPathButtonDefaultRotation:kDCPathButtonDefaultReverseRotation], [NSNumber numberWithFloat:0.0f], nil];
    button_shake.duration = 0.5f;
    
    CAKeyframeAnimation *button_shrink = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, endPoint_x, endPoint_y);
    CGPathAddLineToPoint(path, NULL, kDCPathButtonCurrentScreenWidth/2, kDCPathButtonCurrentScreenHeight/2);
    button_shrink.path = path;
    button_shrink.duration = 0.5f;
    button_shrink.calculationMode = kCAAnimationLinear;
    button_shrink.keyTimes = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0f], [NSNumber numberWithFloat:time], [NSNumber numberWithFloat:1.0], nil];
    CGPathRelease(path);
    
    CAAnimationGroup *animation = [CAAnimationGroup animation];
    animation.animations = [NSArray arrayWithObjects:button_shake,button_shrink, nil];
    animation.duration = 1.0f;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.delegate = self;
    centerButton.layer.zPosition = 1;
    [button.layer addAnimation:animation forKey:@"ButtonCloseAnimation_1"];
    button.center = CGPointMake(startPoint_x, startPoint_y );
}

@end
