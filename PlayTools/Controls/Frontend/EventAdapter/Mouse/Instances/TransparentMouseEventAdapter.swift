//
//  TransparentMouseEventAdapter.swift
//  PlayTools
//
//  Created by 许沂聪 on 2023/9/16.
//

import Foundation

// Mouse events handler when keymapping is disabled

public class TransparentMouseEventAdapter: MouseEventAdapter {
    public func handleScrollWheel(deltaX: CGFloat, deltaY: CGFloat) -> Bool {
        // When editing text, scroll should effect on text input box
        false
    }

    public func handleMove(id: Int, loc: CGPoint, deltaX: CGFloat, deltaY: CGFloat) -> Bool {
        false
    }

    public func handleLeftButton(id: Int, loc: CGPoint, pressed: Bool) -> Bool {
        false
    }

    public func handleOtherButton(id: Int, pressed: Bool) -> Bool {
        false
    }

    public func cursorHidden() -> Bool {
        false
    }

}
