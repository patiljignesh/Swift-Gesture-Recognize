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
        let fileViewBlueberries = sender.view!
        
    switch sender.state {
    case .began, .changed:
        moveViewWithPan(view: fileViewBlueberries, sender: sender)
    case .ended:
        if fileBlueberriesImageView.frame.intersects(fileBearImageView.frame){
            deleteView(view: fileViewBlueberries)
        } else {
            returnViewWithOrigin(view: fileViewBlueberries)
        }
    default:
        break
    }
   }
    
    func moveViewWithPan(view: UIView, sender: UIPanGestureRecognizer){
        let translation = sender.translation(in: view)
        view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: view)
    }
    
    func returnViewWithOrigin(view: UIView){
        UIView.animate(withDuration: 0.3) {
            self.fileBlueberriesImageView.frame.origin = self.fileViewBlueberriesOrigin
        }
    }
    
    func deleteView(view: UIView){
        UIView.animate(withDuration: 0.3) {
            self.fileBlueberriesImageView.alpha = 0.0
        }
    }
}

