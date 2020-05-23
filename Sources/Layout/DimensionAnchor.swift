import UIKit

/**
 DimensionAnchor is used for setting up
 constraints relating specifically to a view's size.
 */
public struct DimensionAnchor {
    let anchor: NSLayoutDimension
    let dimension: Dimension

    public static func width(_ anchor: NSLayoutDimension) -> DimensionAnchor {
        DimensionAnchor(anchor: anchor, dimension: .width)
    }

    public static func height(_ anchor: NSLayoutDimension) -> DimensionAnchor {
        DimensionAnchor(anchor: anchor, dimension: .height)
    }

    @discardableResult
    public func pin(
        to toAnchor: DimensionAnchor,
        _ relation: NSLayoutConstraint.Relation = .equal,
        ratio: Ratio = .equal,
        plus: CGFloat = 0,
        priority: UILayoutPriority = .required,
        activate: Bool = true
    ) -> NSLayoutConstraint {
        anchor.pin(
            to: toAnchor.anchor,
            relation,
            ratio: ratio,
            plus: plus,
            priority: priority,
            activate: activate
        )
    }
}
