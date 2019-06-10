import QtQuick 2.7
import "../../qmlf/FordControls"
import com.ford.hmicontrols 1.0 as FHC

FHC.Layout{
    id: pageItem

    /**
     * @property itemName - the item name to display
     */
    property string itemName

    /**
     * @property iconName - the correspond icon to display
     */
    property string iconName

    /**
     * @property index - index of the delegate
     */
    property int index

    /**
     * @property model - model and requests provider
     */
    property var model

    property bool bMovingMapOnly: true

    property bool inactivity: itemName && itemName !== "MapOrientation" && bMovingMapOnly

    signal pageItemActivated()

    layoutId: "tnOptionsEntryDelegateLayout"

    FHC.IconTextPushButton {
        id: optionButton
        objectName: "optionButton"
        isActive: true
        iconAssetId: "settingsBluetooth"
        text: ""

        onClicked: {
            pageItemActivated();
        }
    }

    FHC.Text {
        id: optionText
        objectName: "optionText"
        text: "Call me"
        styleId: "tnDestinationCategoryIconTextDisableStyle"

        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }
    }
}
