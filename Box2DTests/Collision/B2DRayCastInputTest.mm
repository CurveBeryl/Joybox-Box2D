//
//  B2DRayCastInputTest.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/17/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DRayCastInputTest.h"
#import "B2DRayCastInput.h"

@implementation B2DRayCastInputTest

- (void)testB2DRayCastOutputMake
{
  B2DRayCastInput rayCastInput = B2DRayCastInputMake(CGPointMake(0, 0), CGPointMake(1, 1), 10);
  STAssertTrue(CGPointEqualToPoint(rayCastInput.point1, CGPointMake(0, 0)), nil);
  STAssertTrue(CGPointEqualToPoint(rayCastInput.point2, CGPointMake(1, 1)), nil);
  STAssertEquals(rayCastInput.maxFraction, (CGFloat)10, nil);
}

@end
