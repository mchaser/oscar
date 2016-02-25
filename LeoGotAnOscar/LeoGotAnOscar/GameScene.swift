//
//  GameScene.swift
//  LeoGotAnOscar
//
//  Created by Liu's MBA on 2/24/16.
//  Copyright (c) 2016 dancite. All rights reserved.
//

import SpriteKit

struct PhysicsCategory {
    static let LeoOnTheRun : UInt32 = 0x1 << 1
    static let Ground : UInt32 = 0x1 << 2
    static let Wall : UInt32 = 0x1 << 3
}

class GameScene: SKScene {
    
    var Ground = SKSpriteNode()
    var LeoOnTheRun = SKSpriteNode()
    var OscarCup = SKSpriteNode()
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        OscarCup = SKSpriteNode(imageNamed: "OscarCup")
        OscarCup.setScale(0.5)
        OscarCup.position = CGPoint(x: self.frame.width / 2 + 100, y: self.frame.height / 2)
        OscarCup.zPosition = 3
        self.addChild(OscarCup)
    
        
        Ground = SKSpriteNode(imageNamed: "Ground")
        Ground.setScale(0.5)
        Ground.position = CGPoint(x: self.frame.width / 2, y: 0 + Ground.frame.height / 2)
        Ground.zPosition = 3
        
        Ground.physicsBody = SKPhysicsBody(rectangleOfSize: Ground.size)
        Ground.physicsBody?.categoryBitMask = PhysicsCategory.Ground
        Ground.physicsBody?.collisionBitMask = PhysicsCategory.LeoOnTheRun
        Ground.physicsBody?.contactTestBitMask = PhysicsCategory.LeoOnTheRun
        Ground.physicsBody?.affectedByGravity = false
        Ground.physicsBody?.dynamic = false
        
        
    
        self.addChild(Ground)
        
        
        LeoOnTheRun = SKSpriteNode(imageNamed: "LeoOnTheRun")
        LeoOnTheRun.size = CGSize(width: 60, height: 70)
        LeoOnTheRun.position = CGPoint(x: self.frame.width / 2 - LeoOnTheRun.frame.width, y: self.frame.height / 2)
        LeoOnTheRun.zPosition = 2
        
        LeoOnTheRun.physicsBody = SKPhysicsBody(circleOfRadius: LeoOnTheRun.frame.height / 2)
        LeoOnTheRun.physicsBody?.categoryBitMask = PhysicsCategory.LeoOnTheRun
        LeoOnTheRun.physicsBody?.collisionBitMask = PhysicsCategory.Wall | PhysicsCategory.Ground
        LeoOnTheRun.physicsBody?.contactTestBitMask = PhysicsCategory.Wall | PhysicsCategory.Ground
        LeoOnTheRun.physicsBody?.affectedByGravity = true
        LeoOnTheRun.physicsBody?.dynamic = true
        
        self.addChild(LeoOnTheRun)
       
        
        
        createWalls()
        
        
    
    }
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        LeoOnTheRun.physicsBody?.velocity = CGVectorMake(0, 0)
        LeoOnTheRun.physicsBody?.applyImpulse(CGVectorMake(0, 90))
    
    }
    
    
    
    
    func createWalls(){
        let wallPair = SKNode()
        
        let topWall = SKSpriteNode(imageNamed: "Wall")
        let btmWall = SKSpriteNode(imageNamed: "Wall")
        
        topWall.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 400)
        btmWall.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 - 400)
        
        topWall.setScale(0.5)
        btmWall.setScale(0.5)
        
        wallPair.zPosition = 1
        
        topWall.physicsBody = SKPhysicsBody(rectangleOfSize: topWall.size)
        topWall.physicsBody?.categoryBitMask = PhysicsCategory.Wall
        topWall.physicsBody?.collisionBitMask = PhysicsCategory.LeoOnTheRun
        topWall.physicsBody?.contactTestBitMask = PhysicsCategory.LeoOnTheRun
        topWall.physicsBody?.dynamic = false
        topWall.physicsBody?.affectedByGravity = false
        
        btmWall.physicsBody = SKPhysicsBody(rectangleOfSize: btmWall.size)
        btmWall.physicsBody?.categoryBitMask = PhysicsCategory.Wall
        btmWall.physicsBody?.collisionBitMask = PhysicsCategory.LeoOnTheRun
        btmWall.physicsBody?.contactTestBitMask = PhysicsCategory.LeoOnTheRun
        btmWall.physicsBody?.dynamic = false
        btmWall.physicsBody?.affectedByGravity = false
        
        
        wallPair.addChild(topWall)
        wallPair.addChild(btmWall)
        
        self.addChild(wallPair)
        
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        
    }
}
