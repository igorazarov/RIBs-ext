//
//  LaunchBranchRouting.swift
//  D2R
//
//  Created by Ihor Azarov on 6/6/18.
//  Copyright © 2018 IhorAzarov. All rights reserved.
//

import RIBs


/*
 HOW TO USE
 1) RootRouting must inherit from this:
 protocol RootRouting: LaunchBranchRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
 }
 
 2) In basement view controller:
 override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
 
    self.launchRouter = RootBuilder(dependency: AppComponent()).build()
    launchRouter?.launchBranch(from: self)
 }
 
 3) RootRouter must be declared as:
 final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
    ...
 }
*/

public protocol LaunchBranchRouting: LaunchRouting {
    
    /// Launches the router tree from controller of usual (non-RIBs) application.
    ///
    /// - parameter controller: The controller to launch from.
    func launchBranch(from prnController: UIViewController)
}

extension LaunchBranchRouting {
    
    func launchBranch(from prnController: UIViewController) {
        prnController.present(viewControllable.uiviewController, animated: false) {
            self.interactable.activate()
            self.load()
        }
    }

}
