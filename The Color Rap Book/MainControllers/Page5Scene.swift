//
//  Page5Scene.swift
//  The Color Rap Book
//
//  Created by 7744 on 6/8/20.
//  Copyright © 2020 7744. All rights reserved.
//

import Foundation
import GameplayKit
import CoreMotion
import UIKit

protocol page5SceneProtocol: class {
    func dismissPage5Scene()
}

class Motion {
    static let instance = Motion()
    
    let motionManager = CMMotionManager()
}

class Page5Scene: SKScene {

    let worldNode = SKNode()
//    var shouldUpdate = Bool()
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    let cherryTexture = SKTexture(imageNamed: "page5CherrySmall")
    let appearAnimation = SKAction.fadeIn(withDuration: 1.2)
    var cherry = SKSpriteNode(texture: SKTexture(imageNamed: "page5CherrySmall"))
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    var isLandscapeLeft = true
    

    private var lastUpdateTime : TimeInterval = 0


    deinit {
        print("deinitialized")
    }

        override func sceneDidLoad() {
//
//            NotificationCenter.default.addObserver(self, selector: Selector("orientationChanged:"), name: UIDevice.orientationDidChangeNotification, object: UIDevice.current)
//            print("Debice orientation, ", UIDevice.current.orientation)
           
            Motion.instance.motionManager.deviceMotionUpdateInterval = 0.5
            cherry.alpha = 0
    //        self.scaleMode = .aspectFill
            self.lastUpdateTime = 0
//            self.backgroundColor = .clear
            scene?.backgroundColor = .clear
            view?.allowsTransparency = true


            // Get label node from scene and store it for use later

        }


        override func didMove(to view: SKView) {
            
            if myVariable.orientation == 3 {
                isLandscapeLeft = false
                
            }
            if myVariable.orientation == 4 {
                isLandscapeLeft = true
                
            }
            print("Device orientation, ", UIDevice.current.orientation.rawValue)
            
            let treeHeight = screenHeight * 0.9
            let cherryHeight = treeHeight * 0.25
            let cherryScale = cherryHeight / 534
            cherry.physicsBody = SKPhysicsBody(texture: cherryTexture, size: cherryTexture.size())
            cherry.physicsBody?.affectedByGravity = false


            cherry.position = CGPoint(x: screenWidth * 0.17, y: screenHeight * 0.05
            )


            addChild(cherry)
              addChild(worldNode)


            physicsBody = SKPhysicsBody(edgeLoopFrom: frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)))
            cherry.setScale(cherryScale)


            afterCherryAppeared(completion: {(success) in

                if success == true {
                    cherry.physicsBody?.affectedByGravity = true
                }

            })

            Motion.instance.motionManager.startAccelerometerUpdates()




    }



        override func update(_ currentTime: TimeInterval) {
            // Called before each frame is rendered

//            guard !worldNode.isPaused else { return }
            guard !worldNode.isPaused else { return }
//            return
            // Initialize _lastUpdateTime if it has not already been
//            if (self.lastUpdateTime == 0) {
//                self.lastUpdateTime = currentTime
//            }
          
//            // Calculate time since last update
//            let dt = currentTime - self.lastUpdateTime
//
            
//            print("isLeft?, ", isLandscapeLeft)
//            // Update entities
//            for entity in self.entities {
//                entity.update(deltaTime: dt)
//            }
//
//            self.lastUpdateTime = currentTime
//            print("worldNode is, ", worldNode.isPaused)
//            print("it is still updating")
//            print("Device orientation, ", UIDevice.current.orientation.rawValue)
           if let accelerometerData = Motion.instance.motionManager.accelerometerData {
            if !isLandscapeLeft {
                 physicsWorld.gravity = CGVector(dx: accelerometerData.acceleration.y * 10, dy: accelerometerData.acceleration.x * -10)
            }
            if isLandscapeLeft {
                physicsWorld.gravity = CGVector(dx: accelerometerData.acceleration.y * -10, dy: accelerometerData.acceleration.x * 10)
            }

            }

        }



    

    func afterCherryAppeared (completion: (_ success: Bool) -> Void){
        cherry.run(appearAnimation)
        completion(true)

    }

    func dismissPage5Scene() {
//        print("dismiss page 5 scene")
        Motion.instance.motionManager.stopAccelerometerUpdates()
        Motion.instance.motionManager.stopDeviceMotionUpdates()
        pauseMethod()


        self.removeAllActions()
        self.removeFromParent()


    }


    func pauseMethod() {
        print("paused")
        worldNode.isHidden = false
//        worldNode.isPaused = true
        physicsWorld.speed = 0
    }

    func resumeMethod() {
        worldNode.isPaused = false
        physicsWorld.speed = 1
    }

   
//    func orientationChanged(notification: NSNotification) {
//           if let device = notification.object as? UIDevice {
//               switch device.orientation {
//               case .landscapeRight:
//                   isLandscapeLeft = false
//               case .landscapeLeft:
//                    isLandscapeLeft = true
//               default:
//                   return
//               }
//           }
//       }
    
}
