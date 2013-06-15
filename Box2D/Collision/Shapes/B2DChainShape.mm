//
//  B2DChainShape.m
//  Box2D
//
//  Created by Juan José Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DChainShape.h"
#import "B2DEdgeShape.h"

@implementation B2DChainShape

@dynamic vertexCount;
@dynamic vertices;
@dynamic hasPreviousVertex;
@dynamic previousVertex;
@dynamic hasNextVertex;
@dynamic nextVertex;

- (id)initWithRadius:(CGFloat)radius
{
  self = [super init];
  
  if (self)
  {
    b2ChainShape *chainShape = new b2ChainShape();
    self.shape = chainShape;
  }
  
  return self;
}


#pragma mark - Properties

- (NSInteger)vertexCount
{
  return ((b2ChainShape *)self.shape)->m_count;
}

- (CGPoint *)vertices
{
  CGPoint *vertices = new CGPoint[[self vertexCount]];
  
  for(int i = 0; i < [self vertexCount]; i ++)
  {
    vertices[i] = CGPointFromVector(((b2PolygonShape *)self.shape)->m_vertices[i]);
  }
  
  return vertices;
}

- (BOOL)hasPreviousVertex
{
  return ((b2ChainShape *)self.shape)->m_hasPrevVertex;
}

- (CGPoint)previousVertex
{
  return CGPointFromVector(((b2ChainShape *)self.shape)->m_prevVertex);
}

- (BOOL)hasNextVertex
{
  return ((b2ChainShape *)self.shape)->m_hasNextVertex;
}

- (CGPoint)nextVertex
{
  return CGPointFromVector(((b2ChainShape *)self.shape)->m_nextVertex);
}


#pragma mark - Methods

- (void)createLoopWithVertices:(CGPoint *)vertices andVertexCount:(NSInteger)vertexCount
{  
  b2Vec2 *boxVertices = new b2Vec2[vertexCount];
  
  for(int i = 0; i < vertexCount; i++)
  {
    CGPoint point = vertices[i];
    boxVertices[i] = b2Vec2FromPoint(point);
  }
  
  ((b2ChainShape *)self.shape)->CreateLoop(boxVertices, (int32)vertexCount);
}

- (void)createChainWithVertices:(CGPoint *)vertices andVertexCount:(NSInteger)vertexCount
{
  b2Vec2 *boxVertices = new b2Vec2[vertexCount];
  
  for(int i = 0; i < vertexCount; i++)
  {
    CGPoint point = vertices[i];
    boxVertices[i] = b2Vec2FromPoint(point);
  }
  
  ((b2ChainShape *)self.shape)->CreateChain(boxVertices, (int32)vertexCount);
}

- (void)setPreviousVertex:(CGPoint)vertex
{
  ((b2ChainShape *)self.shape)->SetPrevVertex(b2Vec2FromPoint(vertex));
}

- (void)setNextVertex:(CGPoint)vertex
{
  ((b2ChainShape *)self.shape)->SetNextVertex(b2Vec2FromPoint(vertex));
}

- (void)getChildEdge:(B2DEdgeShape *)edgeShape withIndex:(NSInteger)index
{
  ((b2ChainShape *)self.shape)->GetChildEdge((b2EdgeShape *)edgeShape.shape, (int32)index);
}

@end
