//
//  B2DProfile.h
//  Box2D
//
//  Created by Juan José Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#ifndef Box2D_B2DProfile_h
#define Box2D_B2DProfile_h

struct B2DProfile
{  
  CGFloat step;
  CGFloat collide;
  CGFloat solve;
  CGFloat solveInit;
  CGFloat solveVelocity;
  CGFloat solvePosition;
  CGFloat broadphase;
  CGFloat solveTOI;
};
typedef struct B2DProfile B2DProfile;

#endif
