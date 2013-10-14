//
//  C4WorkSpace.h
//  AOI-1
//
//  Created by daigo3 on 10/12/13.
//

#import "C4CanvasController.h"

@interface C4WorkSpace : C4CanvasController

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

-(float)mapColor:(int)val;

-(void)createObjectAtPoint:(CGPoint)newPoint;
-(void)fadeAndRemoveShape:(C4Shape *)shape;

@end
