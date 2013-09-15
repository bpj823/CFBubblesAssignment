//
//  BPJBubble.m
//  BPJBubbles
//
//  Created by Brad on 9/13/13.
//  Copyright (c) 2013 Brad. All rights reserved.
//

#import "BPJBubble.h"
@interface BPJBubble ()

@property (strong,nonatomic) UIDynamicAnimator *animator;
@property (strong,nonatomic) NSArray *myViews;
@property (strong,nonatomic) UICollisionBehavior *collision;
@property (strong,nonatomic) UIView *circle1;
@property (strong,nonatomic) UIView *circle2;
@property (strong,nonatomic) UIView *circle3;

@end
@implementation BPJBubble

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        self.layer.cornerRadius = self.frame.size.width/2;
        
        [self fillWithBubbles];
        
        self.myViews = [[NSArray alloc] initWithObjects:self.circle1,self.circle2,self.circle3,nil];
        
        self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
        
        self.gravity = [[UIGravityBehavior alloc] initWithItems:self.myViews];
        
        self.collision = [[UICollisionBehavior alloc] initWithItems:self.myViews];
        
        self.collision.translatesReferenceBoundsIntoBoundary = YES;
        
        self.clipsToBounds = YES;
        
        [self.animator addBehavior:self.collision];
        [self.animator addBehavior:self.gravity];
        

        
    }
    return self;
}

- (void)fillWithBubbles;
{
    self.circle1 = [[UIView alloc] initWithFrame:CGRectMake((self.frame.size.width /2) *.75, (self.frame.size.height /2) *.75, 10, 10)];
    self.circle2 = [[UIView alloc] initWithFrame:CGRectMake((self.frame.size.width /2) *1.25, (self.frame.size.height /2)*1.25, 10, 10)];
    self.circle3 = [[UIView alloc] initWithFrame:CGRectMake((self.frame.size.width /2)* .30, (self.frame.size.height /2) *.30, 10, 10)];
    
    
    self.circle1.backgroundColor = [UIColor greenColor];
    self.circle2.backgroundColor = [UIColor redColor];
    self.circle3.backgroundColor = [UIColor purpleColor];
    
    
    self.circle1.layer.cornerRadius = self.circle1.frame.size.width/2;
    self.circle2.layer.cornerRadius = self.circle2.frame.size.width/2;
    self.circle3.layer.cornerRadius = self.circle3.frame.size.width/2;
    
    [self addSubview:self.circle1];
    [self addSubview:self.circle2];
    [self addSubview:self.circle3];
    
    
    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
