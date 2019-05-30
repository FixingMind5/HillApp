//
//  ViewController.swift
//  CifradoHill
//
//  Created by Manuel Alejandro Aguilar Tellez Giron on 5/7/19.
//  Copyright © 2019 Manuel Alejandro Aguilar Tellez Giron. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    //@IBOutlet weak var animationView: LOTAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*let setAnimation = Animation.named("data")
        
        animationView.animation = setAnimation
        animationView.play()*/
        
        let starAnimationView = AnimationView(name: "data")
        
        starAnimationView.play()

    }
    
    
}
