import QtQuick 2.7
import "../../qmlf/FordControls"
import com.ford.hmicontrols 1.0 as FHC

item {
    id: root
    /**
     * @property columns - the number of columns from the grid
     */
    property int columns

    /**
     * @property rows - the number of rows from the grid
     */
    property int rows

    /**
     * @property model - model and requests provider
     */
    property var model

    property int gridViewHeight: __style.gridViewHeight
    property bool bMovingMapOnly: true

    signal itemSelected(var itemName, var iconName)

    FHC.StyleHelper {
        id: styleHelper
        styleId: "tnOptionsGridViewStyle"
    }

    PaginatedGridView {
        id: paginatedGridView
        rowCount: root.rows
        columnCount: root.columns
        model: root.model
        spacing: styleHelper.style.get("iconSpacing")
        interactive: false

        anchors {
            left: parent.left
            leftMargin: styleHelper.style.get("leftMargin")
            right: parent.right
            rightMargin: styleHelper.style.get("rightMargin")
            top: parent.top
            topMargin: styleHelper.style.get("topMargin")
            bottom: parent.bottom
            bottomMargin: styleHelper.style.get("bottomMargin")
        }

        delegate: OptionsItemDelegate {
            itemName: itemModel.itemName
            iconName: itemModel.iconName
            index: itemModel.index
            model: 9
            bMovingMapOnly: root.bMovingMapOnly

            onPageItemActivated: {
                root.itemSelected(itemModel.itemName, itemModel.iconName);
            }
        }
    }

}
