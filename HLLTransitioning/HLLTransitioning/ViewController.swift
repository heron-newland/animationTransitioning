//
//  ViewController.swift
//  HLLTransitioning
//
//  Created by  bochb on 2017/12/8.
//  Copyright © 2017年 com.heron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let transDelegate = HLLViewControllerTransitioningDelegate()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         //let appDelegate = UIApplication.shared.delegate as! AppDelegate
        HLLAnimationManager.manager.animateTransitionController = HLLPanAnimateTransitionController()
         HLLAnimationManager.manager.InteractionAnimateTransitionController = HLLInterationHorizental()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "present" {
            let des = segue.destination
            des.modalPresentationStyle = .custom
            des.transitioningDelegate = transDelegate
        }
        super.prepare(for: segue, sender: sender)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

