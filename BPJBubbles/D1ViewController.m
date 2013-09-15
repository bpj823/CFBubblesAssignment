//
//  D1ViewController.m
//  BPJBubbles
//
//  Created by Brad on 9/12/13.
//  Copyright (c) 2013 Brad. All rights reserved.
//

#import "D1ViewController.h"
#import "CMMotionManager+Shared.h"
#import "BPJBubble.h"


@interface D1ViewController ()

@property (strong,nonatomic) UIDynamicAnimator *animator;
@property (strong,nonatomic) NSArray *myViews;
@property (strong,nonatomic) UIGravityBehavior *gravity;
@property (strong,nonatomic) UICollisionBehavior *collision;
@property (strong,nonatomic) AVAudioPlayer *yayPlayer;
@property (strong,nonatomic) NSURL *soundURL;







@end

@implementation D1ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    BPJBubble *circle1 = [[BPJBubble alloc] initWithFrame:CGRectMake(30, 50, 100, 100)];
    BPJBubble *circle2 = [[BPJBubble alloc] initWithFrame:CGRectMake(150, 50, 100, 100)];
    
 
    
    [self.view addSubview:circle1];
    [self.view addSubview:circle2];

    
    self.myViews = [[NSArray alloc] initWithObjects:circle1,circle2, nil];
    
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    self.gravity = [[UIGravityBehavior alloc] initWithItems:self.myViews];
    
    self.collision = [[UICollisionBehavior alloc] initWithItems:self.myViews];
    
    self.collision.translatesReferenceBoundsIntoBoundary = YES;
    
  

    [self.animator addBehavior:self.collision];
    [self.animator addBehavior:self.gravity];
    
    UITapGestureRecognizer *singleFingerTap1 =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap)];
    UITapGestureRecognizer *singleFingerTap2 =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap)];
    
       [circle1 addGestureRecognizer:singleFingerTap1];
        [circle2 addGestureRecognizer:singleFingerTap2];
    
    self.soundURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]                                                                                                                  pathForResource:@"yay" ofType:@"mp3"]];
    
    self.yayPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:self.soundURL error:nil];
    
    

    
    
   
}

-(void)handleSingleTap
{
    for (BPJBubble *bubble in self.myViews)
    {
        bubble.backgroundColor = [UIColor randomColor];
    }
    
    [self.yayPlayer play];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self startDrift];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[CMMotionManager sharedMotionManager] stopAccelerometerUpdates];
    
    
    
}

-(void)startDrift
{
    CMMotionManager *motionManager = [CMMotionManager sharedMotionManager];
    if ([motionManager isAccelerometerAvailable])
    {
        [motionManager setAccelerometerUpdateInterval:1/5];
        [motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData *data, NSError *error) {
            
            
            self.gravity.gravityDirection = CGVectorMake(data.acceleration.x, data.acceleration.y *-1);
           
            
            for (BPJBubble *view in self.myViews)
            {
                
                
                view.gravity.gravityDirection = CGVectorMake(data.acceleration.x, data.acceleration.y *-1);
                
            }
            
        }];
    }
}


- (IBAction)stopDrift:(id)sender {
    
    [[CMMotionManager sharedMotionManager] stopAccelerometerUpdates];
    
}



@end
