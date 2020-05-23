import UIKit

extension NSLayoutXAxisAnchor {
    /**
     Pins two x-axis anchors to each other.
     */
    @discardableResult
    public func pin(
        to toAnchor: NSLayoutXAxisAnchor,
        _ relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required,
        activate: Bool = true
    ) -> NSLayoutConstraint {
        let constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = self.constraint(
                equalTo: toAnchor, constant: constant
            )
        case .lessThanOrEqual:
            constraint = self.constraint(
                lessThanOrEqualTo: toAnchor,
                constant: constant
            )
        case .greaterThanOrEqual:
            constraint = self.constraint(
                greaterThanOrEqualTo: toAnchor,
                constant: constant
            )
        @unknown default:
            fatalError("NSLayoutConstraint.Relation type <\(relation)> unsupported")
        }
        constraint.isActive = activate
        constraint.priority = priority
        return constraint
    }
}

extension NSLayoutYAxisAnchor {
    /**
     Pins two y-axis anchors to each other.
     */
    @discardableResult
    public func pin(
        to toAnchor: NSLayoutYAxisAnchor,
        _ relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required,
        activate: Bool = true
    ) -> NSLayoutConstraint {
        let constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = self.constraint(
                equalTo: toAnchor,
                constant: constant
            )
        case .lessThanOrEqual:
            constraint = self.constraint(
                lessThanOrEqualTo: toAnchor,
                constant: constant
            )
        case .greaterThanOrEqual:
            constraint = self.constraint(
                greaterThanOrEqualTo: toAnchor,
                constant: constant
            )
        @unknown default:
            fatalError("NSLayoutConstraint.Relation type <\(relation)> unsupported")
        }
        constraint.isActive = activate
        constraint.priority = priority
        return constraint
    }
}

extension NSLayoutDimension {
    /**
     Pins two dimension anchors to each other.
     */
    @discardableResult
    public func pin(
        to toDimension: NSLayoutDimension,
        _ relation: NSLayoutConstraint.Relation = .equal,
        ratio: Ratio = .equal,
        plus constant: CGFloat = 0,
        priority: UILayoutPriority = .required,
        activate: Bool = true
    ) -> NSLayoutConstraint {
        let constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = self.constraint(
                equalTo: toDimension,
                multiplier: ratio,
                constant: constant
            )
        case .lessThanOrEqual:
            constraint = self.constraint(
                lessThanOrEqualTo: toDimension,
                multiplier: ratio,
                constant: constant
            )
        case .greaterThanOrEqual:
            constraint = self.constraint(
                greaterThanOrEqualTo: toDimension,
                multiplier: ratio,
                constant: constant
            )
        @unknown default:
            fatalError("NSLayoutConstraint.Relation type <\(relation)> unsupported")
        }
        constraint.isActive = activate
        constraint.priority = priority
        return constraint
    }
}
