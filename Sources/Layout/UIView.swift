import UIKit

extension UIView {
    public var left: XAxisAnchor {
        .left(leftAnchor)
    }

    public var leading: XAxisAnchor {
        .leading(leadingAnchor)
    }

    public var right: XAxisAnchor {
        .right(rightAnchor)
    }

    public var trailing: XAxisAnchor {
        .trailing(trailingAnchor)
    }

    public var centerX: XAxisAnchor {
        .centerX(centerXAnchor)
    }

    public var bottom: YAxisAnchor {
        .bottom(bottomAnchor)
    }

    public var top: YAxisAnchor {
        .top(topAnchor)
    }

    public var centerY: YAxisAnchor {
        .centerY(centerYAnchor)
    }

    public var width: DimensionAnchor {
        .width(widthAnchor)
    }

    public var height: DimensionAnchor {
        .height(heightAnchor)
    }
}

/**
 Use these functions to add a subview to a parent view and simultaneously
 pin the subview's anchors to anchors of the parent view.
 */
extension UIView {
    /**
     This struct is returned from all embed functions. It can be used to reference the embedded view as
     well as the constraints that were created.
     */
    public struct Embedded<View> where View: UIView {
        public let view: View
        public let constraints: [(convertable: ConstraintConvertable, constraint: NSLayoutConstraint)]
    }

    /**
     Adds a subview and pins all four edges to a layout guide of the receiver with a given inset.
     */
    @discardableResult
    public func embed<View>(
        _ child: View,
        inset: CGFloat
    ) -> Embedded<View> {
        embed(child, pin: .allEdges(inset: inset))
    }

    /**
     Adds a subview and pins a given set of anchors to a layout guide of the receiver.
     */
    @discardableResult
    public func embed<View>(
        _ child: View,
        pin constraintConvertables: [ConstraintConvertable] = .allEdges
    ) -> Embedded<View> {
        child.translatesAutoresizingMaskIntoConstraints = false
        addSubview(child)
        let constraints = constraintConvertables.map { c -> (ConstraintConvertable, NSLayoutConstraint) in
            (c, c.constraint(from: child, to: self))
        }
        return Embedded(view: child, constraints: constraints)
    }
}

/**
 Use these functions to constrain dimensions of a view.
 */
extension UIView {
    /**
     Constrains the view to a constant aspect ratio of "width to height".
     */
    @discardableResult
    public func constrain(
        aspectRatio: Ratio,
        plus: CGFloat = 0,
        priority: UILayoutPriority = .required,
        activate: Bool = true
    ) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(
            equalTo: heightAnchor,
            multiplier: aspectRatio,
            constant: plus
        )
        constraint.priority = priority
        constraint.isActive = activate
        return constraint
    }

    /**
     Constrains the view to a constant height.
     */
    @discardableResult
    public func constrain(
        _ relation: NSLayoutConstraint.Relation = .equal,
        height: CGFloat,
        priority: UILayoutPriority = .required,
        activate: Bool = true
    ) -> NSLayoutConstraint {
        let constraint: NSLayoutConstraint
        switch relation {
        case .equal: constraint = heightAnchor.constraint(equalToConstant: height)
        case .greaterThanOrEqual: constraint = heightAnchor.constraint(greaterThanOrEqualToConstant: height)
        case .lessThanOrEqual: constraint = heightAnchor.constraint(lessThanOrEqualToConstant: height)
        @unknown default: fatalError("NSLayoutConstraint.Relation type <\(relation)> unsupported")
        }
        constraint.priority = priority
        constraint.isActive = activate
        return constraint
    }

    /**
     Constrains the view to a constant width.
     */
    @discardableResult
    public func constrain(
        _ relation: NSLayoutConstraint.Relation = .equal,
        width: CGFloat,
        priority: UILayoutPriority = .required,
        activate: Bool = true
    ) -> NSLayoutConstraint {
        let constraint: NSLayoutConstraint
        switch relation {
        case .equal: constraint = widthAnchor.constraint(equalToConstant: width)
        case .greaterThanOrEqual: constraint = widthAnchor.constraint(greaterThanOrEqualToConstant: width)
        case .lessThanOrEqual: constraint = widthAnchor.constraint(lessThanOrEqualToConstant: width)
        @unknown default: fatalError("NSLayoutConstraint.Relation type <\(relation)> unsupported")
        }
        constraint.priority = priority
        constraint.isActive = activate
        return constraint
    }
}

extension UIView {
    func anchor(axis: XAxis, layoutGuide: LayoutGuide) -> NSLayoutXAxisAnchor {
        switch layoutGuide {
        case .view: return anchor(axis: axis)
        case .readableContent: return readableContentGuide.anchor(axis: axis)
        case .margins: return layoutMarginsGuide.anchor(axis: axis)
        case .safeArea: return safeAreaLayoutGuide.anchor(axis: axis)
        }
    }

    func anchor(axis: YAxis, layoutGuide: LayoutGuide) -> NSLayoutYAxisAnchor {
        switch layoutGuide {
        case .view: return anchor(axis: axis)
        case .readableContent: return readableContentGuide.anchor(axis: axis)
        case .margins: return layoutMarginsGuide.anchor(axis: axis)
        case .safeArea: return safeAreaLayoutGuide.anchor(axis: axis)
        }
    }

    func anchor(dimension: Dimension, layoutGuide: LayoutGuide) -> NSLayoutDimension {
        switch layoutGuide {
        case .view: return anchor(dimension: dimension)
        case .readableContent: return readableContentGuide.anchor(dimension: dimension)
        case .margins: return layoutMarginsGuide.anchor(dimension: dimension)
        case .safeArea: return safeAreaLayoutGuide.anchor(dimension: dimension)
        }
    }

    private func anchor(axis: XAxis) -> NSLayoutXAxisAnchor {
        switch axis {
        case .centerX: return centerXAnchor
        case .leading: return leadingAnchor
        case .left: return leftAnchor
        case .right: return rightAnchor
        case .trailing: return trailingAnchor
        }
    }

    private func anchor(axis: YAxis) -> NSLayoutYAxisAnchor {
        switch axis {
        case .bottom: return bottomAnchor
        case .centerY: return centerYAnchor
        case .top: return topAnchor
        }
    }

    private func anchor(dimension: Dimension) -> NSLayoutDimension {
        switch dimension {
        case .width: return widthAnchor
        case .height: return heightAnchor
        }
    }
}
