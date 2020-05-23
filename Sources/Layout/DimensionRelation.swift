import UIKit

public struct DimensionRelation {
    public let fromDimension: Dimension
    public let fromLayoutGuide: LayoutGuide
    public let toDimension: Dimension
    public let toLayoutGuide: LayoutGuide
    public let constant: CGFloat
    public let multiplier: CGFloat
    public let relation: NSLayoutConstraint.Relation
    public let priority: UILayoutPriority
    public let active: Bool

    public init(
        _ fromDimension: Dimension,
        _ fromLayoutGuide: LayoutGuide = .view,
        to toDimension: Dimension,
        _ toLayoutGuide: LayoutGuide = .view,
        _ relation: NSLayoutConstraint.Relation = .equal,
        multiplier: CGFloat = 1,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required,
        active: Bool = true
    ) {
        self.fromDimension = fromDimension
        self.fromLayoutGuide = fromLayoutGuide
        self.toDimension = toDimension
        self.toLayoutGuide = toLayoutGuide
        self.multiplier = multiplier
        self.constant = constant
        self.relation = relation
        self.priority = priority
        self.active = active
    }

    public func constraint(from fromView: UIView, to toView: UIView) -> NSLayoutConstraint {
        fromView.anchor(dimension: fromDimension, layoutGuide: fromLayoutGuide).pin(
            to: toView.anchor(dimension: toDimension, layoutGuide: toLayoutGuide),
            relation,
            ratio: multiplier,
            plus: constant,
            priority: priority,
            activate: active
        )
    }
}
