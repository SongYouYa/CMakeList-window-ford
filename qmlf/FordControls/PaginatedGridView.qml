import QtQuick 2.6

/**
 * @brief Displays items in a Paginated Grid View
 *
 *        Requires matching model and delegate.
 * @par Example usage
 * @code{.qml}
 * import QtArp.common 1.0
 *
 * // Simple model
 * ListModel {
 *     id: addressModel
 *
 *     ListElement {
 *         address: "Aurel Vlaicu 3"
 *     }
 *     ListElement {
 *         address: "Cuza Voda 1"
 *     }
 * }
 *
 * // PaginatedGridView using adressModel and a Text item as delegate
 * PaginatedGridView {
 *     id: paginatedGridView
 *     width: 400
 *     height: 300
 *     rowCount: 2
 *     columnCount: 3
 *     spacing: 5
 *     model: addressModel
 *     delegate: Text {
 *         width: 50
 *         height: 30
 *         text: itemModel.address
 *     }
 * }
 * @endcode
 */

Item {
    id: root
    
    /**
     * @property rowCount
     * @brief The number of rows displayed per page
     */
    property int rowCount: 3
    
    /**
     * @property columnCount
     * @brief The number of columns displayed per page
     */
    property int columnCount: 4
    
    /**
     * @property spacing
     * @brief Spacing between the items from the Grid View
     */
    property int spacing: 5
    
    /**
     * @property model
     * @brief The model that provides data for the delegate
     */
    property alias model: repeaterItem.model
    
    /**
     * @property delegate
     * @brief The loaded delegate
     */
    property Component delegate
    
    /**
     * @property animationDurationOnX
     * @brief Duration of the animation on x-axis when snapping
     */
    property int animationDurationOnX: 500
    
    /**
     * @property currentPage
     * @brief The current displayed page
     *        This property is modified internally and available for reading
     */
    property int currentPage: 0


    /**
     * @property pageCount
     * @brief The number of pages
     */
    property int pageCount: Math.ceil(repeaterItem.count/gridView.itemsPerPage)

    /**
     * @property hasNextPage
     * @brief Flag indicating if there exists a next page to navigate to
     */
    property bool hasNextPage: root.currentPage + 1 < root.pageCount

    /**
     * @property hasPreviousPage
     * @brief Flag indicating if there exists a previous page to navigate to
     */
    property bool hasPreviousPage: root.currentPage

    /**
     * type:alias It is an alias for the flickable element's flag interactive.
     */
    property alias interactive: gridView.interactive

    Flickable {
        id: gridView
        
        /**
         * @property itemsPerPage
         * @brief The number of items displayed per page
         */
        property int itemsPerPage: rowCount * columnCount
        
        /**
         * @property itemWidth
         * @brief The width of the delegate
         */
        property double itemWidth: (width - (columnCount - 1) * spacing) / columnCount
        
        /**
         * @property itemHeight
         * @brief The height of the delegate
         */
        property double itemHeight: (height  - (rowCount - 1) * spacing) / rowCount

        /**
         * @property resetingModel
         * @brief Flag indicating if the model is currently reseting
         */
        property bool resetingModel: false

        /**
         * @property rowCountChanging
         * @brief Property indicates if rowCount is changing
         */
        property bool rowCountChanging: false

        anchors.fill: parent
        clip: true
        contentWidth: pageCount * (width + spacing)
        contentHeight: height

        Repeater {
            id: repeaterItem

            Loader {
                id: loader
                /**
                 * @property xOffset
                 * @brief The x position of each page
                 */
                property int xOffset: Math.floor(index / (gridView.itemsPerPage)) * (root.width + spacing)
                
                /**
                 * @property currentColumn
                 * @brief The column number in which the item is located
                 */
                property int currentColumn: index % columnCount
                
                /**
                 * @property currentRow
                 * @brief The row number in which the item is located
                 */
                property int currentRow: Math.floor(index / columnCount) % rowCount
                
                /**
                 * @property itemModel
                 * @brief The model that provides the data for the delegate
                 *        Required to inject model in delegate
                 */
                property var itemModel: typeof modelData !== "undefined" ? modelData : model

                /**
                 * type:int The index of the current item.
                 */
                property int itemIndex: index


                x: xOffset + currentColumn * (gridView.itemWidth + (currentColumn === 0 ? 0 : spacing))
                y: currentRow * (gridView.itemHeight + (currentRow === 0 ? 0 : spacing))
                width: gridView.itemWidth
                height: gridView.itemHeight
                sourceComponent: delegate
            }

            onModelChanged: {
                gridView.resetingModel = true;
                currentPage = 0;
                gridView.contentX = 0;
                gridView.resetingModel = false;
            }
        }

        onMovingChanged: {
            if(!gridView.moving) {
                var potentialCurrentPage = Math.round(gridView.contentX / (gridView.width + spacing));
                if (potentialCurrentPage >= pageCount) {
                    currentPage = pageCount - 1;
                } else if (potentialCurrentPage < 0) {
                    currentPage = 0;
                } else {
                    currentPage = potentialCurrentPage;
                }
                gridView.contentX = currentPage * (gridView.width + spacing);
            }
        }

        Behavior on contentX {
            enabled: !gridView.dragging && !gridView.resetingModel && !gridView.rowCountChanging

            NumberAnimation {
                duration: animationDurationOnX
            }
        }
    }

    onRowCountChanged: {
        gridView.rowCountChanging = true;
        currentPage = 0;
        gridView.contentX = currentPage * (gridView.width + spacing);
        gridView.rowCountChanging = false;
    }


    /**
     * @brief Moves the grid to the next page with a step equal to the grid's width and increments currentPage
     */
    function nextPage() {
        if(hasNextPage) {
            gridView.contentX = gridView.contentX + (gridView.width + spacing);
            currentPage ++;
        }
    }

    /**
     * @brief Moves the grid to the previous page with a step equal to the grid's width and decrements currentPage
     */
    function previousPage() {
        if(hasPreviousPage) {
            gridView.contentX = gridView.contentX - (gridView.width + spacing);
            currentPage --;
        }
    }
}
