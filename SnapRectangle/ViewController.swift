//
//  ViewController.swift
//  RectangleGradient
//
//  Created by Pavel Parshutkin on 02.07.2023.
//

import UIKit

class ViewController: UIViewController {

    lazy var rectangle: UIView = configureRectangle()
    
    var animation: UIDynamicAnimator = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.view.addSubview(rectangle)
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTap(gestureRecognizer:))))
    }
    
    
    
    private func configureSnap(for position: CGPoint) -> UISnapBehavior {
        let snap = UISnapBehavior(item: rectangle, snapTo: position)
        snap.damping = 0.75
        
        return snap
    }
    
    @objc func onTap(gestureRecognizer: UITapGestureRecognizer) {
    
        let position = gestureRecognizer.location(in: gestureRecognizer.view)
        animation.removeAllBehaviors()
        animation.addBehavior(configureSnap(for: position))
    }
    
    func configureRectangle() -> UIView {
        
        let view = UIView()
        view.frame = .init(x: self.view.frame.width / 2 - 50, y: self.view.frame.height / 2 - 50, width: 100, height: 100)
        view.backgroundColor  = .systemBlue
        view.layer.cornerRadius = 8
        return view
    }

}
