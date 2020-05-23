import UIKit

open class ScrollGrid: UIView {
    private let grid = Grid()
    private let scrollView = UIScrollView()
    private var rowSpacing: CGFloat = 0
    private var columnSpacing: CGFloat = 0

    public override init(frame: CGRect) {
        super.init(frame: frame)
        didInstantiate()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        didInstantiate()
    }

    func didInstantiate() {
        scrollView.bounces = false
        scrollView.delegate = self
        scrollView.embed(grid, pin: [.top, .left, .right, .bottom])
        embed(scrollView)
    }

    public func make(
        rowCount: Int,
        columnCount: Int,
        rowSpacing: CGFloat = 0,
        columnSpacing: CGFloat = 0,
        cells: (_ rowIndex: Int, _ columnIndex: Int) -> UIView
    ) {
        self.rowSpacing = rowSpacing
        self.columnSpacing = columnSpacing
        grid.make(
            rowCount: rowCount,
            columnCount: columnCount,
            rowSpacing: rowSpacing,
            columnSpacing: columnSpacing,
            cells: cells
        )
        if rowCount > 0, columnCount > 0 {
            let firstCell = grid.rows[0][0]

            let firstRowSeparator = UIView()
            firstRowSeparator.backgroundColor = backgroundColor
            scrollView.embed(firstRowSeparator, pin: [.left, .right])
            firstRowSeparator.top.pin(to: firstCell.bottom)
            firstRowSeparator.constrain(height: rowSpacing)

            let firstColumnSeparator = UIView()
            firstColumnSeparator.backgroundColor = backgroundColor
            scrollView.embed(firstColumnSeparator, pin: [.top, .bottom])
            firstColumnSeparator.constrain(width: columnSpacing)
            firstColumnSeparator.left.pin(to: firstCell.right)
        }
    }
}

extension ScrollGrid: UIScrollViewDelegate {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        grid.firstRowTopConstraints.forEach { constraint in
            constraint.constant = -offset.y
        }
        grid.firstRowBottomConstraints.forEach { constraint in
            constraint.constant = offset.y - rowSpacing
        }
        grid.firstColumnLeftConstraints.forEach { constraint in
            constraint.constant = -offset.x
        }
        grid.firstColumnRightConstraints.forEach { constraint in
            constraint.constant = offset.x - columnSpacing
        }
    }
}
