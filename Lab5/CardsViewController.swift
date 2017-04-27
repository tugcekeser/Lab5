//
//  ViewController.swift
//  Lab5
//
//  Created by Tuze on 4/26/17.
//  Copyright © 2017 Tugce Keser. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    @IBOutlet weak var imageView: DraggableImageView!
    var originalCenter:CGPoint!
   
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view, typically from a nib.
//        originalCenter = imageView.center
        imageView.image = UIImage(named: "ryan")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onGesture(_ sender: UIPanGestureRecognizer) {
       
        let location = sender.location(in: imageView)
        let translation = sender.translation(in: view)
        //let velocity = sender.velocity(in: superview)
        if sender.state == .began {
            originalCenter = imageView.center
        } else if sender.state == .changed {
            if location.y < imageView.frame.height / 2 {
                //imageView.center = CGPoint(x: imageCenter!.x + translation.x, y: imageCenter!.y)
                let degrees = translation.x * 45 / imageView.frame.width
                let transform = CGAffineTransform(rotationAngle: degrees * .pi / 180)
                imageView.transform = transform
            } else {
                let tranX = -translation.x
                let degrees = (tranX * 135 / imageView.frame.width)
                let transform = CGAffineTransform(rotationAngle: degrees * .pi / 180)
                imageView.transform = transform
            }
            
            if translation.x > 50 {
                imageView.removeFromSuperview()
            }
            
            if translation.x < -50 {
                imageView.removeFromSuperview()
            }
            
            imageView.center = CGPoint(x: originalCenter.x + translation.x, y: originalCenter.y)

        }
        
        if sender.state == .ended{
            print(translation.x)
            imageView.center = originalCenter
            imageView.transform = CGAffineTransform.identity
            
        }
    }
}

//extension Int {
//    var degreesToRadians: Double { return Double(self) * .pi / 180 }
//}
//extension FloatingPoint {
//    var degreesToRadians: Self { return self * .pi / 180 }
//    var radiansToDegrees: Self { return self * 180 / .pi }
//}
