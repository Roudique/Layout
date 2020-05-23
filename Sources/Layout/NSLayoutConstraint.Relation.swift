import UIKit

extension NSLayoutConstraint.Relation {
    var inverse: NSLayoutConstraint.Relation {
        switch self {
        case .equal: return .equal
        case .greaterThanOrEqual: return .lessThanOrEqual
        case .lessThanOrEqual: return .greaterThanOrEqual
        @unknown default: fatalError("NSLayoutConstraint.Relation type <\(self)> unsupported")
        }
    }
}
