import UIKit

/**
 A Grid is a n x m collection of views. All cells in a row will have the same height, based
 on the intrinsic content height of the tallest cell in the row. All cells in a column will have
 the same width, based on the intrinsic content width of the widest cell in the column.
 */
open class Grid: UIView {
    private(set) var rows: [[UIView]] = []
    private(set) var firstRowTopConstraints: [NSLayoutConstraint] = []
    private(set) var firstRowBottomConstraints: [NSLayoutConstraint] = []
    private(set) var firstColumnLeftConstraints: [NSLayoutConstraint] = []
    private(set) var firstColumnRightConstraints: [NSLayoutConstraint] = []

    /**
     Removes all cells from the grid.
     */
    public func clearCells() {
        for row in rows {
            for cell in row {
                cell.removeFromSuperview()
            }
        }
        rows.removeAll(keepingCapacity: true)
        firstRowTopConstraints.removeAll()
        firstRowBottomConstraints.removeAll()
        firstColumnLeftConstraints.removeAll()
        firstColumnRightConstraints.removeAll()
    }

    /**
     Removes all current cells from the grid, then rebuilds the grid with a closure that returns
     each cell in the grid.

     - parameter rowCount: The number of rows to have in this grid.
     - parameter columnCount: The number of columns to have in this grid.
     - parameter rowSpacing: The vertical distance between rows.
     - parameter columnSpacing: The horizontal distance between columns.
     - parameter edgeInsets: The padding to add around each edge of this grid.
     - parameter cells: A closure that returns the cell for a given row and column index in the grid.
     */
    public func make(
        rowCount: Int,
        columnCount: Int,
        rowSpacing: CGFloat = 0,
        columnSpacing: CGFloat = 0,
        cells: (_ rowIndex: Int, _ columnIndex: Int) -> UIView
    ) {
        clearCells()
        for rowIndex in 0 ..< rowCount {
            var row: [UIView] = []
            for columnIndex in 0 ..< columnCount {
                row.append(cells(rowIndex, columnIndex))
            }
            rows.append(row)
        }
        rows.reversed().forEach { row in
            row.reversed().forEach { cell in
                cell.translatesAutoresizingMaskIntoConstraints = false
                addSubview(cell)
            }
        }
        if rowCount > 0 {
            for columnIndex in 0 ..< columnCount {
                let topCell = rows[0][columnIndex]
                firstRowTopConstraints.append(top.pin(to: topCell.top))
                let bottomCell = rows[rowCount - 1][columnIndex]
                bottom.pin(to: bottomCell.bottom, .greaterThanOrEqual)
            }
        }
        if columnCount > 0 {
            for rowIndex in 0 ..< rowCount {
                let leftCell = rows[rowIndex][0]
                firstColumnLeftConstraints.append(left.pin(to: leftCell.left))
                let rightCell = rows[rowIndex][columnCount - 1]
                right.pin(to: rightCell.right, .greaterThanOrEqual)
            }
        }
        for rowIndex in 0 ..< rowCount {
            for columnIndex in 0 ..< columnCount {
                let cell = rows[rowIndex][columnIndex]
                let nextColumnIndex = columnIndex + 1
                if nextColumnIndex < columnCount {
                    let cellInNextColumn = rows[rowIndex][nextColumnIndex]
                    let constraint = cell.right.pin(to: cellInNextColumn.left, spacing: columnSpacing)
                    if columnIndex == 0 {
                        firstColumnRightConstraints.append(constraint)
                    }
                    cell.height.pin(to: cellInNextColumn.height)
                }
                let nextRowIndex = rowIndex + 1
                if nextRowIndex < rowCount {
                    let cellInNextRow = rows[nextRowIndex][columnIndex]
                    let constraint = cell.bottom.pin(to: cellInNextRow.top, spacing: rowSpacing)
                    if rowIndex == 0 {
                        firstRowBottomConstraints.append(constraint)
                    }
                    cell.width.pin(to: cellInNextRow.width)
                }
            }
        }
    }

    /**
     Returns the cell at a given row and column index.

     - parameter row: The cell's row index.
     - parameter column: The cell's column index.
     - parameter T: The type to cast this cell as. Callers can use `UIView` if the cell type is unknown.
     - returns: The cell at the given column and row index.
     */
    public func cellAt<T>(row rowIndex: Int, column columnIndex: Int) -> T? where T: UIView {
        guard rowIndex < rows.count else { return nil }
        let row = rows[rowIndex]
        guard columnIndex < row.count else { return nil }
        return row[columnIndex] as? T
    }
}
