//
//  Presenter.swift
//  AWS-Ring
//
//  Created by Pham Hoa on 8/23/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import UIKit
import SwiftEntryKit

class Presenter: NSObject {
    static let shared = Presenter()

    private override init() {
        //
    }

    func present(view: UIView, dismissHandler: @escaping (() -> Void)) {
        // Attributes struct that describes the display, style, user interaction and animations of customView.
        var attributes = EKAttributes()
        /*
         Adjust preferable attributes
         */
        attributes.position = .center
        attributes.displayDuration = .infinity
        attributes.windowLevel = .alerts

        attributes.shadow = .active(with: .init(opacity: 0.7, radius: 5))
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true

        // Size
        let widthConstraint = EKAttributes.PositionConstraints.Edge.ratio(value: 0.9)
        let heightConstraint = EKAttributes.PositionConstraints.Edge.intrinsic
        attributes.positionConstraints.size = .init(width: widthConstraint, height: heightConstraint)

        // User interaction
        attributes.entryInteraction = .absorbTouches
        attributes.screenInteraction = .absorbTouches
        
        let entryTapAction: EKAttributes.UserInteraction.Action = {
            view.endEditing(true)
        }
        attributes.entryInteraction.customTapActions.append(entryTapAction)

        let screenInteractionAction: EKAttributes.UserInteraction.Action = {
            Presenter.shared.dismiss {
                DispatchQueue.main.async {
                    dismissHandler()
                }
            }
        }
        attributes.screenInteraction.customTapActions.append(screenInteractionAction)

        attributes.lifecycleEvents.didDisappear = {
            // Executed after the entry animates outside
            DispatchQueue.main.async {
                dismissHandler()
            }
        }

        // Keyboard releation
        let offset = EKAttributes.PositionConstraints.KeyboardRelation.Offset(bottom: 10, screenEdgeResistance: 20)
        let keyboardRelation = EKAttributes.PositionConstraints.KeyboardRelation.bind(offset: offset)
        attributes.positionConstraints.keyboardRelation = keyboardRelation

        SwiftEntryKit.display(entry: view, using: attributes)
    }

    func dismiss(_ complete: @escaping (() -> Void)) {
        SwiftEntryKit.dismiss(SwiftEntryKit.EntryDismissalDescriptor.displayed) {
            complete()
        }
    }
}
