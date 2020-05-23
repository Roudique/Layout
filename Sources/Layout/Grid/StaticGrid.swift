import UIKit

/**
 A grid whose rows and columns are known at compile time. When this is the case, implementations can use
 an enum conforming to the CaseIterable protocol to describe the rows and columns. This results in a
 more expressive API that's easier to use.
 */
open class StaticGrid<Row, Column>: Grid where Row: CaseIterable, Column: CaseIterable {
    /**
     Removes all current cells from the grid, then rebuilds the grid with a closure that returns
     each cell in the grid.

     - parameter rowSpacing: The vertical distance between rows.
     - parameter columnSpacing: The horizontal distance between columns.
     - parameter edgeInsets: The padding to add around each edge of this grid.
     - parameter cells: A closure that returns the cell for a given row and column in the grid.
     */
    public func make(
        rowSpacing: CGFloat = 0,
        columnSpacing: CGFloat = 0,
        cells: (_ row: Row, _ column: Column) -> UIView
    ) {
        let rows = Array(Row.allCases)
        let columns = Array(Column.allCases)
        super.make(
            rowCount: rows.count,
            columnCount: columns.count,
            rowSpacing: rowSpacing,
            columnSpacing: columnSpacing
        ) { rowIndex, columnIndex in
            cells(rows[rowIndex], columns[columnIndex])
        }
    }
}
