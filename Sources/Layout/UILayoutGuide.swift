import UIKit

extension UILayoutGuide {
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

extension UILayoutGuide {
    func anchor(axis: XAxis) -> NSLayoutXAxisAnchor {
        switch axis {
        case .centerX: return centerXAnchor
        case .leading: return leadingAnchor
        case .left: return leftAnchor
        case .right: return rightAnchor
        case .trailing: return trailingAnchor
        }
    }

    func anchor(axis: YAxis) -> NSLayoutYAxisAnchor {
        switch axis {
        case .bottom: return bottomAnchor
        case .centerY: return centerYAnchor
        case .top: return topAnchor
        }
    }

    func anchor(dimension: Dimension) -> NSLayoutDimension {
        switch dimension {
        case .width: return widthAnchor
        case .height: return heightAnchor
        }
    }
}
