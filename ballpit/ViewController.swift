//
//  ViewController.swift
//  ballpit
//
//  Created by Morten Just Petersen on 2/5/16.
//  Copyright © 2016 Morten Just Petersen. All rights reserved.
//

import Cocoa
import SpriteKit

class ViewController: NSViewController {

    @IBOutlet weak var sceneView: SKView!
    
    override func viewWillAppear() {
        print("will appear")
        let scene = BallScene()
        scene.size = self.view.bounds.size
        sceneView.presentScene(scene)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

