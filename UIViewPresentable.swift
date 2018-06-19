//
//  ViewControllable+ShowHide.swift
//  D2R
//
//  Created by Ihor Azarov on 6/13/18.
//  Copyright © 2018 IhorAzarov. All rights reserved.
//

/*
 default implementation of presenting and dismissing
 view controllers in RIBs
 
 usage example:
 protocol RootViewControllable: ViewControllable, UIViewPresentable
 
 (just add this protocol as parrent to MyViewComtrollable protocol)
 */

import RIBs

enum PresentStyle {
    case none
    case animated
    case fading (Float)
}

protocol UIViewPresentable {
    func presentRIB(viewControllable: ViewControllable, presentStyle: PresentStyle)
    
    func dismissPresented(animated: Bool)
}

extension UIViewPresentable where Self: ViewControllable  {
    
    func presentRIB(viewControllable: ViewControllable, presentStyle: PresentStyle) {
        var presentWithAnimation = false
        var completion: (()-> Void)? = nil
        
        switch presentStyle {
        case .fading(let val) :
            presentWithAnimation = false
            completion = {
                UIView.animate(withDuration: TimeInterval(val)
                    , animations: {
                        viewControllable.uiviewController.view.alpha = 1.0
                })
            }
        default:
            presentWithAnimation = true
        }
        
        uiviewController.present(viewControllable.uiviewController, animated: presentWithAnimation, completion: completion)
    }
    
    func dismissPresented(animated: Bool) {
        uiviewController.dismiss(animated: animated) { }
    }
}
