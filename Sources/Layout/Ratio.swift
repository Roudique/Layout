import UIKit

/**
 A relation between two integers
 */
public typealias Ratio = CGFloat

extension Ratio {
    public static let equal = Ratio(1, to: 1)
    public static let half = Ratio(1, to: 2)
    public static let golden = Ratio(1_618, to: 1_000)

    public var inverse: Ratio {
        1 / self
    }

    public init(_ first: Int, to second: Int) {
        self = CGFloat(first) / CGFloat(second)
    }

    public init(_ width: CGFloat, to height: CGFloat) {
        self = width / height
    }
}
