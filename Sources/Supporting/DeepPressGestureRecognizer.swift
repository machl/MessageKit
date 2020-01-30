//
//  DeepPressGestureRecognizer.swift
//  MessageKit
//
//  Created by machl on 30/01/2020.
//  Copyright © 2020 MessageKit. All rights reserved.
//

import UIKit.UIGestureRecognizerSubclass

@available(iOS 9.0, *)
public class DeepPressGestureRecognizer: UIGestureRecognizer {
    
    public var forceThreshold: CGFloat = 0.75
    
    private var deepPressed: Bool = false
    
    public override func touchesBegan(_  touches: Set<UITouch>, with event: UIEvent) {
        if let touch = touches.first {
            handleTouch(touch: touch)
        }
    }
    
    public override func  touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        if let touch = touches.first {
            handleTouch(touch: touch)
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesEnded(touches, with: event)
        
        state = deepPressed ? UIGestureRecognizer.State.ended : UIGestureRecognizer.State.failed
        
        deepPressed = false
    }
    
    private func handleTouch(touch: UITouch) {
        guard touch.force != 0 && touch.maximumPossibleForce != 0 else {
            return
        }
        
        if !deepPressed && (touch.force / touch.maximumPossibleForce) >= forceThreshold {
            state = UIGestureRecognizer.State.began
            
            deepPressed = true
        } else if deepPressed && (touch.force / touch.maximumPossibleForce) < forceThreshold {
            state = UIGestureRecognizer.State.ended
            
            deepPressed = false
        }
    }
}
