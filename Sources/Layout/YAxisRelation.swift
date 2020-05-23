import UIKit

public struct YAxisRelation {
    public let fromAxis: YAxis
    public let fromLayoutGuide: LayoutGuide
    public let toAxis: YAxis
    public let toLayoutGuide: LayoutGuide
    public let constant: CGFloat
    public let relation: NSLayoutConstraint.Relation
    public let priority: UILayoutPriority
    public let active: Bool

    public init(
        _ fromAxis: YAxis,
        _ fromLayoutGuide: LayoutGuide = .view,
        to toAxis: YAxis,
        _ toLayoutGuide: LayoutGuide = .view,
        _ relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required,
        active: Bool = true
    ) {
        self.fromAxis = fromAxis
        self.fromLayoutGuide = fromLayoutGuide
        self.toAxis = toAxis
        self.toLayoutGuide = toLayoutGuide
        self.constant = constant
        self.relation = relation
        self.priority = priority
        self.active = active
    }

    public func constraint(from fromView: UIView, to toView: UIView) -> NSLayoutConstraint {
        fromView.anchor(axis: fromAxis, layoutGuide: fromLayoutGuide).pin(
            to: toView.anchor(axis: toAxis, layoutGuide: toLayoutGuide),
            relation,
            constant: constant,
            priority: priority,
            activate: active
        )
    }
}
