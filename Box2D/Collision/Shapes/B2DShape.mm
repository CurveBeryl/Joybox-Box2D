//
//  B2DShape.m
//  Box2D
//
//  Created by Juan Jose Karam on 3/6/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DShape.h"

@implementation B2DShape

@synthesize shape;

- (void)dealloc
{
  delete self.shape;
  self.shape = nil;
  
  [super dealloc];
}

@end
