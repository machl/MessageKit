//
//  MessagesViewController+fixes.swift
//  MessageKit
//
//  Created by machl on 11/01/2020.
//  Copyright © 2020 MessageKit. All rights reserved.
//

import Foundation

public extension MessagesViewController {
    
    func presentWithoutAdjustingInsets(_ vc: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        isMessagesControllerBeingDismissed = true
        (self.tabBarController ?? self.navigationController ?? self)?.present(vc, animated: true, completion: { [weak self] in
            self?.isMessagesControllerBeingDismissed = false
            completion?()
        })
    }
    
}
