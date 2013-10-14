//
//  C4WorkSpace.m
//  AOI-1
//
//  Created by daigo3 on 10/12/13.
//

#import "C4Workspace.h"

@implementation C4WorkSpace {
    NSArray *samples;
}

-(void)setup {
    self.canvas.multipleTouchEnabled = YES;
    
    samples = @[
        [C4Sample sampleNamed:@"bird1.mp3"],
        [C4Sample sampleNamed:@"bird3.mp3"],
        [C4Sample sampleNamed:@"bird6.mp3"],
        [C4Sample sampleNamed:@"bird13.mp3"],
        [C4Sample sampleNamed:@"bird27.mp3"],
        [C4Sample sampleNamed:@"dog1.mp3"],
        [C4Sample sampleNamed:@"dog2.mp3"],
    ];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *t in touches) {
        CGPoint touchPoint = [t locationInView:self.canvas];
        [self createObjectAtPoint:touchPoint];
    }
}

-(float)mapColor:(NSInteger)val
{
    return [C4Math map:val fromMin:0 max:255 toMin:0.0f max:1.0f];
}

-(void)playSound
{
    int index = [C4Math randomIntBetweenA:0 andB:[samples count]];
    C4Sample *sample = samples[index];
    [sample play];
}

-(void)createObjectAtPoint:(CGPoint)newPoint {
    C4Shape *s = [C4Shape ellipse:CGRectMake(newPoint.x - 25, newPoint.y - 25, 50, 50)];
    
    s.fillColor = [UIColor colorWithRed:[self mapColor:[C4Math randomInt:255]]
                                  green:[self mapColor:[C4Math randomInt:255]]
                                   blue:[self mapColor:[C4Math randomInt:255]]
                                  alpha:1.0];
    s.strokeColor = NO;
    s.userInteractionEnabled = NO;
    [self.canvas addShape:s];
    [self runMethod:@"fadeAndRemoveShape:" withObject:s afterDelay:0.0f];
    [self playSound];
}

-(void)fadeAndRemoveShape:(C4Shape *)shape {
    shape.animationDuration = 1.0f;
    shape.alpha = 0.0f;
    [shape runMethod:@"removeFromSuperview" afterDelay:shape.animationDuration];
}

@end
