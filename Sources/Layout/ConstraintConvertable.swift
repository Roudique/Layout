import UIKit

public enum ConstraintConvertable {
    case xAxis(XAxisRelation)
    case yAxis(YAxisRelation)
    case dimension(DimensionRelation)

    func constraint(from fromView: UIView, to toView: UIView) -> NSLayoutConstraint {
        switch self {
        case let .xAxis(relation): return relation.constraint(from: fromView, to: toView)
        case let .yAxis(relation): return relation.constraint(from: fromView, to: toView)
        case let .dimension(relation): return relation.constraint(from: fromView, to: toView)
        }
    }
}

extension ConstraintConvertable {
    public static let left: ConstraintConvertable = .left()
    public static let right: ConstraintConvertable = .right()
    public static let leading: ConstraintConvertable = .leading()
    public static let trailing: ConstraintConvertable = .trailing()
    public static let centerX: ConstraintConvertable = .centerX()
    public static let top: ConstraintConvertable = .top()
    public static let bottom: ConstraintConvertable = .bottom()
    public static let centerY: ConstraintConvertable = .centerY()
    public static let width: ConstraintConvertable = .width()
    public static let height: ConstraintConvertable = .height()

    public static func left(
        of layoutGuide: LayoutGuide = .view,
        _ relation: NSLayoutConstraint.Relation = .equal,
        to toAxis: XAxis = .left,
        toLayoutGuide: LayoutGuide = .view,
        offset: CGFloat = 0,
        priority: UILayoutPriority = .required,
        active: Bool = true
    ) -> ConstraintConvertable {
        .xAxis(XAxisRelation(
            .left,
            layoutGuide,
            to: toAxis,
            toLayoutGuide,
            relation,
            constant: offset,
            priority: priority,
            active: active
        ))
    }

    public static func leading(
        of layoutGuide: LayoutGuide = .view,
        _ relation: NSLayoutConstraint.Relation = .equal,
        to toAxis: XAxis = .leading,
        toLayoutGuide: LayoutGuide = .view,
        offset: CGFloat = 0,
        priority: UILayoutPriority = .required,
        active: Bool = true
    ) -> ConstraintConvertable {
        .xAxis(XAxisRelation(
            .leading,
            layoutGuide,
            to: toAxis,
            toLayoutGuide,
            relation,
            constant: offset,
            priority: priority,
            active: active
        ))
    }

    public static func right(
        of layoutGuide: LayoutGuide = .view,
        _ relation: NSLayoutConstraint.Relation = .equal,
        to toAxis: XAxis = .right,
        toLayoutGuide: LayoutGuide = .view,
        offset: CGFloat = 0,
        priority: UILayoutPriority = .required,
        active: Bool = true
    ) -> ConstraintConvertable {
        .xAxis(XAxisRelation(
            .right,
            layoutGuide,
            to: toAxis,
            toLayoutGuide,
            relation,
            constant: offset,
            priority: priority,
            active: active
        ))
    }

    public static func trailing(
        of layoutGuide: LayoutGuide = .view,
        _ relation: NSLayoutConstraint.Relation = .equal,
        to toAxis: XAxis = .trailing,
        toLayoutGuide: LayoutGuide = .view,
        offset: CGFloat = 0,
        priority: UILayoutPriority = .required,
        active: Bool = true
    ) -> ConstraintConvertable {
        .xAxis(XAxisRelation(
            .trailing,
            layoutGuide,
            to: toAxis,
            toLayoutGuide,
            relation,
            constant: offset,
            priority: priority,
            active: active
        ))
    }

    public static func centerX(
        of layoutGuide: LayoutGuide = .view,
        _ relation: NSLayoutConstraint.Relation = .equal,
        to toAxis: XAxis = .centerX,
        toLayoutGuide: LayoutGuide = .view,
        offset: CGFloat = 0,
        priority: UILayoutPriority = .required,
        active: Bool = true
    ) -> ConstraintConvertable {
        .xAxis(XAxisRelation(
            .centerX,
            layoutGuide,
            to: toAxis,
            toLayoutGuide,
            relation,
            constant: offset,
            priority: priority,
            active: active
        ))
    }

    public static func top(
        of layoutGuide: LayoutGuide = .view,
        _ relation: NSLayoutConstraint.Relation = .equal,
        to toAxis: YAxis = .top,
        toLayoutGuide: LayoutGuide = .view,
        offset: CGFloat = 0,
        priority: UILayoutPriority = .required,
        active: Bool = true
    ) -> ConstraintConvertable {
        .yAxis(YAxisRelation(
            .top,
            layoutGuide,
            to: toAxis,
            toLayoutGuide,
            relation,
            constant: offset,
            priority: priority,
            active: active
        ))
    }

    public static func bottom(
        of layoutGuide: LayoutGuide = .view,
        _ relation: NSLayoutConstraint.Relation = .equal,
        to toAxis: YAxis = .bottom,
        toLayoutGuide: LayoutGuide = .view,
        offset: CGFloat = 0,
        priority: UILayoutPriority = .required,
        active: Bool = true
    ) -> ConstraintConvertable {
        .yAxis(YAxisRelation(
            .bottom,
            layoutGuide,
            to: toAxis,
            toLayoutGuide,
            relation,
            constant: offset,
            priority: priority,
            active: active
        ))
    }

    public static func centerY(
        of layoutGuide: LayoutGuide = .view,
        _ relation: NSLayoutConstraint.Relation = .equal,
        to toAxis: YAxis = .centerY,
        toLayoutGuide: LayoutGuide = .view,
        offset: CGFloat = 0,
        priority: UILayoutPriority = .required,
        active: Bool = true
    ) -> ConstraintConvertable {
        .yAxis(YAxisRelation(
            .centerY,
            layoutGuide,
            to: toAxis,
            toLayoutGuide,
            relation,
            constant: offset,
            priority: priority,
            active: active
        ))
    }

    public static func width(
        of layoutGuide: LayoutGuide = .view,
        _ relation: NSLayoutConstraint.Relation = .equal,
        to toDimension: Dimension = .width,
        toLayoutGuide: LayoutGuide = .view,
        ratio: Ratio = .equal,
        plus: CGFloat = 0,
        priority: UILayoutPriority = .required,
        active: Bool = true
    ) -> ConstraintConvertable {
        .dimension(DimensionRelation(
            .width,
            layoutGuide,
            to: toDimension,
            toLayoutGuide,
            relation,
            multiplier: ratio,
            constant: plus,
            priority: priority,
            active: active
        ))
    }

    public static func height(
        of layoutGuide: LayoutGuide = .view,
        _ relation: NSLayoutConstraint.Relation = .equal,
        to toDimension: Dimension = .height,
        toLayoutGuide: LayoutGuide = .view,
        ratio: Ratio = .equal,
        plus: CGFloat = 0,
        priority: UILayoutPriority = .required,
        active: Bool = true
    ) -> ConstraintConvertable {
        .dimension(DimensionRelation(
            .height,
            layoutGuide,
            to: toDimension,
            toLayoutGuide,
            relation,
            multiplier: ratio,
            constant: plus,
            priority: priority,
            active: active
        ))
    }
}

extension Array where Element == ConstraintConvertable {
    public static let allEdges: [ConstraintConvertable] = .allEdges(inset: 0)

    public static func allEdges(inset: CGFloat) -> [ConstraintConvertable] {
        [.top(offset: inset), .bottom(offset: -inset), .leading(offset: inset), .trailing(offset: -inset)]
    }
}
