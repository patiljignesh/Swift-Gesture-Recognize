//
//  ViewController.swift
//  Swift Gesture Recognize
//
//  Created by Jigneshkumar Patil on 2021/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fileStrawberriesImageView: UIImageView!
    @IBOutlet weak var fileBlueberriesImageView: UIImageView!
    @IBOutlet weak var fileBearImageView: UIImageView!
    
    var fileViewBlueberriesOrigin: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addPanGesture(view: fileBlueberriesImageView)
        fileViewBlueberriesOrigin = fileBlueberriesImageView.frame.origin
        view.bringSubviewToFront(fileBlueberriesImageView)
    }


    func addPanGesture(view: UIView) {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(sender:)))
        view.addGestureRecognizer(pan)
    }
    
   @objc func handlePan(sender: UIPanGestureRecognizer){
        let fileViewStraberries = sender.view!
        let translation = sender.translation(in: view)
        
    switch sender.state {
    case .began, .changed:
        fileViewStraberries.center = CGPoint(x: fileViewStraberries.center.x + translation.x, y: fileViewStraberries.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: view)
    case .ended:
        if fileBlueberriesImageView.frame.intersects(fileBearImageView.frame){
            UIView.animate(withDuration: 0.3) {
                self.fileBlueberriesImageView.alpha = 0.0
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.fileBlueberriesImageView.frame.origin = self.fileViewBlueberriesOrigin
            }
        }
    default:
        break
    }
   }
}

