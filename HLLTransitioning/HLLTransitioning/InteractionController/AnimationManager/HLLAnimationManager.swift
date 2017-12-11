//
//  HLLAnimationManager.swift
//  HLLTransitioning
//
//  Created by long he on 2017/12/9.
//  Copyright © 2017年 com.heron. All rights reserved.
//

import UIKit

/// 管理动画的管理者
class HLLAnimationManager: NSObject {
    static let manager = HLLAnimationManager()
    
    /// nav交互动画
    var InteractionAnimateTransitionController:HLLInteractionAnimateTransitionController?
    
    /// nav非交互动画
    var animateTransitionController: HLLAnimateTransitionController?
    
}
