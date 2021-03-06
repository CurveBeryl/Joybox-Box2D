//
//  CBBody.h
//  CBBox2D
//
//  Created by Juan Jose Karam on 2/17/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "B2DBodyTypes.h"

@class B2DTransform;
@class B2DMassData;
@class B2DFixtureDef;
@class B2DShape;
@class B2DFixture;

@interface B2DBody : NSObject {
  
  b2Body *body;
}

@property (nonatomic, assign) b2Body *body;
@property (nonatomic, assign) id userData;
@property (nonatomic, assign) B2DBodyTypes type;
@property (nonatomic, assign, readonly) B2DTransform *transform;
@property (nonatomic, assign) CGPoint position;
@property (nonatomic, assign, readonly) CGFloat angle;
@property (nonatomic, assign, readonly) CGPoint worldCenter;
@property (nonatomic, assign, readonly) CGPoint localCenter;
@property (nonatomic, assign) CGPoint linearVelocity;
@property (nonatomic, assign) CGFloat angularVelocity;
@property (nonatomic, assign, readonly) CGFloat mass;
@property (nonatomic, assign, readonly) CGFloat inertia;
@property (nonatomic, assign) B2DMassData *massData;
@property (nonatomic, assign) CGFloat linearDamping;
@property (nonatomic, assign) CGFloat angularDamping;
@property (nonatomic, assign) CGFloat gravityScale;
@property (nonatomic, assign, readonly) bool isBullet;
@property (nonatomic, assign) bool bullet;
@property (nonatomic, assign, readonly) bool isAwake;
@property (nonatomic, assign) bool awake;
@property (nonatomic, assign, readonly) bool isActive;
@property (nonatomic, assign, readonly) bool isFixedRotation;
@property (nonatomic, assign) bool fixedRotation;
@property (nonatomic, assign, readonly) bool isSleepingAllowed;
@property (nonatomic, assign) bool sleepingAllowed;

- (id)initWithBody:(b2Body *)boxBody;

- (bool)isEqualToBody:(B2DBody *)aBody;
- (void)resetMassData;
- (void)setTransformWithPosition:(CGPoint)position andAngle:(CGFloat)angle;
- (CGPoint)worldPoint:(CGPoint)localPoint;
- (CGPoint)worldVector:(CGPoint)localVector;
- (CGPoint)localPoint:(CGPoint)worldPoint;
- (CGPoint)localVector:(CGPoint)worldVector;
- (CGPoint)linearVelocityFromWorldPoint:(CGPoint)worldPoint;
- (CGPoint)linearVelocityFromLocalPoint:(CGPoint)localPoint;
- (NSArray *)fixtureList;
- (B2DBody *)next;
- (void)applyForce:(CGPoint)force atPoint:(CGPoint)point;
- (void)applyForceToCenter:(CGPoint)force;
- (void)applyTorque:(CGFloat)torque;
- (void)applyLinearImpulse:(CGPoint)impulse atPoint:(CGPoint)point;
- (void)applyAngularImpulse:(CGFloat)impulse;
- (void)createFixture:(B2DFixtureDef *)fixtureDefinition;
- (void)createFixtureWithShape:(B2DShape *)shape andDensity:(CGFloat)density;
- (void)destroyFixture:(B2DFixture *)fixture;
- (void)dump;

#pragma mark - Deprecated

@property (nonatomic, readonly) CGPoint center __attribute__ ((deprecated));

- (void)addFixtureForShape:(B2DShape *)shape
                  friction:(CGFloat)friction
               restitution:(CGFloat)restitution
                   density:(CGFloat)density
                  isSensor:(BOOL)isSensor __attribute__ ((deprecated));

- (void)applyForce:(CGPoint)force
        atLocation:(CGPoint)location
         asImpulse:(BOOL)asImpulse __attribute__ ((deprecated));


- (void)applyTorque:(CGFloat)torque
          asImpulse:(BOOL)impulse __attribute__ ((deprecated));

@end
