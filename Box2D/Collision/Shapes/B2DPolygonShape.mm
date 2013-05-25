//
//  B2DPolygonShape.m
//  Box2D
//
//  Created by Juan Jose Karam on 2/18/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DPolygonShape.h"

@implementation B2DPolygonShape

- (id)initWithBoxSize:(CGSize)boxSize
{
  self = [super init];
  
  if (self)
  {
    b2PolygonShape *polygonShape = new b2PolygonShape();
    
    polygonShape->SetAsBox(boxSize.width, boxSize.height);
    
    self.shape = polygonShape;
  }
  
  return self;
}


- (void)dealloc
{
  [super dealloc];
}

@end
