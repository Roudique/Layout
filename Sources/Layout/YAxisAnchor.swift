import UIKit

/**
 YAxisAnchor is used for setting up
 vertical constraints.
 */
public struct YAxisAnchor {
    let anchor: NSLayoutYAxisAnchor
    let axis: YAxis

    public static func top(_ anchor: NSLayoutYAxisAnchor) -> YAxisAnchor {
        YAxisAnchor(anchor: anchor, axis: .top)
    }

    public static func bottom(_ anchor: NSLayoutYAxisAnchor) -> YAxisAnchor {
        YAxisAnchor(anchor: anchor, axis: .bottom)
    }

    public static func centerY(_ anchor: NSLayoutYAxisAnchor) -> YAxisAnchor {
        YAxisAnchor(anchor: anchor, axis: .centerY)
    }

    @discardableResult
    public func pin(
        to toAnchor: YAxisAnchor,
        _ relation: NSLayoutConstraint.Relation = .equal,
        spacing: CGFloat = 0,
        priority: UILayoutPriority = .required,
        activate: Bool = true
    ) -> NSLayoutConstraint {
        let invert = axis == .bottom && toAnchor.axis == .top
        if invert {
            return anchor.pin(
                to: toAnchor.anchor,
                relation.inverse,
                constant: -spacing,
                priority: priority,
                activate: activate
            )
        } else {
            return anchor.pin(
                to: toAnchor.anchor,
                relation,
                constant: spacing,
                priority: priority,
                activate: activate
            )
        }
    }
}
