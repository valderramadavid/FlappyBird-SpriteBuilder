#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    character = (Character*)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    [self addObstacle];
    timeSinceObstacle = 0.0f;
}

-(void)update:(CCTime)delta
{
    //this will be called every frame
    //delta is the time tha thas elapsed since the last time it was run. Usually 1/60
    
    //Increment the time since the last obstacle was added
    timeSinceObstacle += delta;
    
    //Check to see if two seconds have passed
    if(timeSinceObstacle > 2.0f)
    {
        //Add a new obstacle
        [self addObstacle];
        
        //Reset timer
        timeSinceObstacle = 0;
    }
}

// put new methods here
- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    //this will get called every time the player touches the screen
    [character flap];
}

@end
