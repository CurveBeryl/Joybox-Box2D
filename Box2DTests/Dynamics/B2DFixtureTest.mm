//
//  B2DFixtureTest.m
//  Box2D
//
//  Created by Juan Jose Karam on 6/18/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DFixtureTest.h"
#import "B2DFixture.h"
#import "B2DWorld.h"
#import "B2DBody.h"
#import "B2DBodyDef.h"
#import "B2DFixtureDef.h"
#import "B2DFilter.h"
#import "B2DBody.h"
#import "B2DRayCastOutput.h"
#import "B2DRayCastInput.h"
#import "B2DMassData.h"
#import "B2DAABB.h"
#import "B2DPolygonShape.h"

@interface B2DFixtureTest ()

@property (nonatomic, retain) B2DWorld *world;
@property (nonatomic, retain) B2DBody *body;

@end

@implementation B2DFixtureTest

@synthesize world;
@synthesize body;

- (void)setUp
{
  self.world = [[B2DWorld alloc] init];
  
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.type = kDynamicBodyType;
  bodyDefinition.position = CGPointMake(1, 1);
  self.body = [self.world createBody:bodyDefinition];
  
  B2DFixtureDef *fixtureDefinition = [[B2DFixtureDef alloc] init];
  fixtureDefinition.shape = [[B2DPolygonShape alloc] initWithHalfWidth:0.5 andHalfHeight:0.5];;
  fixtureDefinition.density = 1;
  fixtureDefinition.friction = 1;
  fixtureDefinition.restitution = 1;
  [self.body createFixture:fixtureDefinition];
  
  [super setUp];
}

- (void)tearDown
{
  [self.world release];
  [self.body release];
  [super tearDown];
}

- (void)testInitWithFixture
{
  NSArray *fixtureList = [self.body fixtureList];
  b2Fixture *boxFixture = [[fixtureList objectAtIndex:0] fixture];
  B2DFixture *fixture = [[B2DFixture alloc] initWithFixture:boxFixture];
  
  STAssertTrue(fixture.fixture != NULL, nil);
}


#pragma mark - Properties

- (void)testType
{
  NSArray *fixtureList = [self.body fixtureList];
  B2DFixture *fixture = [fixtureList objectAtIndex:0];
  
  STAssertEquals(fixture.type, kPolygonShapeType, nil);
}

- (void)testIsSensor
{
  NSArray *fixtureList = [self.body fixtureList];
  B2DFixture *fixture = [fixtureList objectAtIndex:0];
  
  STAssertEquals(fixture.isSensor, false, nil);
}

- (void)testSensor
{
  NSArray *fixtureList = [self.body fixtureList];
  B2DFixture *fixture = [fixtureList objectAtIndex:0];
  
  STAssertEquals(fixture.sensor, false, nil);
}

- (void)testSetSensor
{
  NSArray *fixtureList = [self.body fixtureList];
  B2DFixture *fixture = [fixtureList objectAtIndex:0];
  fixture.sensor = YES;
  
  STAssertEquals(fixture.isSensor, true, nil);
}

- (void)testFilterData
{
  NSArray *fixtureList = [self.body fixtureList];
  B2DFixture *fixture = [fixtureList objectAtIndex:0];
  
  STAssertEquals(fixture.filterData.categoryBits, (NSUInteger)1, nil);
  STAssertEquals(fixture.filterData.maskBits, (NSUInteger)65535, nil);
  STAssertEquals(fixture.filterData.groupIndex, (NSInteger)0, nil);
}

- (void)testSetFilterData
{
  NSArray *fixtureList = [self.body fixtureList];
  B2DFixture *fixture = [fixtureList objectAtIndex:0];
  
  B2DFilter *filter = [[B2DFilter alloc] init];
  fixture.filterData = filter;
  
  STAssertEquals(fixture.filterData.categoryBits, (NSUInteger)0x0001, nil);
  STAssertEquals(fixture.filterData.maskBits, (NSUInteger)0xFFFF, nil);
  STAssertEquals(fixture.filterData.groupIndex, (NSInteger)0, nil);
}

- (void)testBody
{
  NSArray *fixtureList = [self.body fixtureList];
  B2DFixture *fixture = [fixtureList objectAtIndex:0];
  
  STAssertEquals(fixture.body.body, self.body.body, nil);
}

- (void)testUserData
{
  NSArray *fixtureList = [self.body fixtureList];
  B2DFixture *fixture = [fixtureList objectAtIndex:0];
  
  NSString *userData = @"Fixture User Data";
  fixture.userData = userData;
  
  STAssertEquals(fixture.userData, userData, nil);
}

- (void)testSetUserData
{
  NSArray *fixtureList = [self.body fixtureList];
  B2DFixture *fixture = [fixtureList objectAtIndex:0];
  
  NSString *userData = @"Fixture User Data";
  fixture.userData = userData;
  
  STAssertEquals(fixture.userData, userData, nil);
}

- (void)testDensity
{
  NSArray *fixtureList = [self.body fixtureList];
  B2DFixture *fixture = [fixtureList objectAtIndex:0];
  
  STAssertEquals(fixture.density, (CGFloat)1, nil);
}

- (void)testSetDensity
{
  NSArray *fixtureList = [self.body fixtureList];
  B2DFixture *fixture = [fixtureList objectAtIndex:0];
  fixture.density = 2;
  
  STAssertEquals(fixture.density, (CGFloat)2, nil);
}

- (void)testFriction
{
  NSArray *fixtureList = [self.body fixtureList];
  B2DFixture *fixture = [fixtureList objectAtIndex:0];
  
  STAssertEquals(fixture.friction, (CGFloat)1, nil);
}

- (void)testSetFriction
{
  NSArray *fixtureList = [self.body fixtureList];
  B2DFixture *fixture = [fixtureList objectAtIndex:0];
  fixture.friction = 2;
  
  STAssertEquals(fixture.friction, (CGFloat)2, nil);
}

- (void)testRestitution
{
  NSArray *fixtureList = [self.body fixtureList];
  B2DFixture *fixture = [fixtureList objectAtIndex:0];
  
  STAssertEquals(fixture.restitution, (CGFloat)1, nil);
}

- (void)testSetRestitution
{
  NSArray *fixtureList = [self.body fixtureList];
  B2DFixture *fixture = [fixtureList objectAtIndex:0];
  fixture.restitution = 2;
  
  STAssertEquals(fixture.restitution, (CGFloat)2, nil);
}


#pragma mark -

- (void)testRefilter
{
  NSArray *fixtureList = [self.body fixtureList];
  B2DFixture *fixture = [fixtureList objectAtIndex:0];
  
  STAssertNoThrow([fixture refilter], nil);
}

- (void)testNext
{
  NSArray *fixtureList = [self.body fixtureList];
  B2DFixture *fixture = [fixtureList objectAtIndex:0];
  
  STAssertEquals([fixture next], (B2DFixture *)nil, nil);
}

- (void)testPoint
{
  NSArray *fixtureList = [self.body fixtureList];
  B2DFixture *fixture = [fixtureList objectAtIndex:0];
  
  STAssertFalse([fixture testPoint:CGPointMake(0, 0)], nil);
  STAssertTrue([fixture testPoint:CGPointMake(1, 1)], nil);
}

- (void)testRayCastWithOutputInputAndChildrenIndex
{
  NSArray *fixtureList = [self.body fixtureList];
  B2DFixture *fixture = [fixtureList objectAtIndex:0];
  
  B2DRayCastOutput *rayCastOutput = [[B2DRayCastOutput alloc] init];
  rayCastOutput.normal = CGPointMake(0, 0);
  rayCastOutput.fraction = 0;

  B2DRayCastInput *rayCastInput = [[B2DRayCastInput alloc] init];
  rayCastInput.point1 = CGPointMake(10, 10);
  rayCastInput.point2 = CGPointMake(1, 1);
  rayCastInput.maxFraction = 20;
  
  bool rayCast = [fixture rayCastWithOutput:rayCastOutput input:rayCastInput andChildIndex:0];
  STAssertTrue(rayCast, nil);
  STAssertFalse(CGPointEqualToPoint(rayCastOutput.normal, CGPointMake(0, 0)), nil);
  STAssertTrue(rayCastOutput.fraction != 0, nil);
}

- (void)testMassData
{
  NSArray *fixtureList = [self.body fixtureList];
  B2DFixture *fixture = [fixtureList objectAtIndex:0];
  
  B2DMassData *massData = [fixture massData];
  
  STAssertEquals(massData.mass, (Float32)1, nil);
  STAssertTrue(CGPointEqualToPoint(massData.centre, CGPointMake(0, 0)), nil);
  STAssertTrue(massData.I != 0, nil);
}

- (void)testAABB
{
  NSArray *fixtureList = [self.body fixtureList];
  B2DFixture *fixture = [fixtureList objectAtIndex:0];
  
  B2DAABB *aabb = [fixture aabb:0];
  
  STAssertFalse(CGPointEqualToPoint(aabb.lowerBound, CGPointMake(0, 0)), nil);
  STAssertFalse(CGPointEqualToPoint(aabb.upperBound, CGPointMake(0, 0)), nil);
}

- (void)testDump
{
  NSArray *fixtureList = [self.body fixtureList];
  B2DFixture *fixture = [fixtureList objectAtIndex:0];
  
  STAssertNoThrow([fixture dump:0], nil);
}


@end
