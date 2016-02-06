//
//  BallScene.swift
//  ballpit
//
//  Created by Morten Just Petersen on 2/5/16.
//  Copyright © 2016 Morten Just Petersen. All rights reserved.
//

import Cocoa
import SpriteKit

class BallScene: SKScene {
    var contentCreated = false
    var screen : CGSize!
    var currentBall : Int = 1
    
    override func didMoveToView(view: SKView) {
        print("did move to view")
        if self.contentCreated == false {
            self.createSceneContents()
            self.contentCreated = true
        }
    }
    
    func createSceneContents(){
        print("create scene")
        screen = self.view?.bounds.size
        self.backgroundColor = SKColor.whiteColor()
        self.scaleMode = .AspectFit
        self.physicsWorld.gravity = CGVectorMake(0.0, -0.1)
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: scene!.frame)
        self.speed = 0.0001
    }

    func addBallWithName(name:String, p:CGPoint){
        let sprite = SKSpriteNode(imageNamed: name)
        sprite.runAction(SKAction.scaleBy(0.2, duration: 0))
        sprite.position = p
        sprite.physicsBody = SKPhysicsBody(circleOfRadius: (sprite.size.width * 0.5))
        addChild(sprite)
    }
    
    func dropNextBall(){}
    
    override func mouseDown(theEvent: NSEvent) {
        let p = theEvent.locationInNode(self)
        for(var i = 1;i<50;i++){
        dropABall(p)}
    }
    
    func dropABall(p:CGPoint){
        let a = currentBall++ % 32
        let b = NSString(format: "%03d", a)
        addBallWithName(b as String, p:p)
        print("mousedowned \(b)")
    }
    
    func rand(low:UInt32, high:UInt32) -> Int {
        return Int(arc4random_uniform(high) + low)
    }
    
}