//
//  ViewController.swift
//  CALayerPlayground
//
//  Created by shendong on 16/9/7.
//  Copyright © 2016年 shendong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewForLayer: UIView!
    
    var l: CALayer{
        return viewForLayer.layer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayer()
    }
    func setUpLayer(){
        l.backgroundColor = UIColor.blueColor().CGColor
        l.borderWidth     = 100.0
        l.borderColor     = UIColor.redColor().CGColor
        l.shadowOpacity   = 0.7
        l.shadowRadius    = 10.0
        l.contents = UIImage(named: "star")?.CGImage
        l.contentsGravity = kCAGravityCenter
    }
    @IBAction func pinchGestureRecognized(sender: UIPinchGestureRecognizer) {
        print(sender.scale)
        let offset: CGFloat =  sender.scale < 1 ? 5.0 : -5.0
        
        let oldFrame = l.frame
        let oldOrigin = oldFrame.origin
        let newOrigin = CGPoint(x: oldOrigin.x + offset, y: oldOrigin.y + offset)
        let newSize = CGSizeMake(oldFrame.width + (offset * -2.0), oldFrame.height + (offset * -2.0))
        let newFrame = CGRect(origin: newOrigin, size: newSize)
        if newFrame.width >= 100.0 && newFrame.width <= 300.0 {
            l.borderWidth -= offset
            l.cornerRadius += (offset / 2.0)
            l.frame = newFrame
        }
        
        
    }
    
    @IBAction func tapGestureRecognized(sender: UITapGestureRecognizer) {
        l.shadowOpacity = l.shadowOpacity==0.7 ? 0.0 : 0.7
    }
}

