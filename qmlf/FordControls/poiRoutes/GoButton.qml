import QtQuick 2.7
//import theme 1.0
//import QtArp.common 1.0
//import arpQt 1.0
import com.ford.hmicontrols 1.0 as FHC

FHC.Layout {
    id: root

    /**
     * @property - button label
     */
    property string goButtonText : "KIPPOIDetailsStartButton"

    /**
     * @property - duration until user arrives at destination
     */
    property string durationText

    /**
     * @property isEnabled - flag indicating whether the button is enabled or not
     */
    property bool isEnabled: true

    /**
     * @property routeCalculating - flag indicating whether the route calculating is in progress or not
     */
    property bool routeCalculating: false

    /**
     * @property textHorizontalAlignment - the horizontal alignment of goButtonTextId
     */
    property alias textHorizontalAlignment: goButtonTextId.horizontalAlignment

    /**
     * @signal - emitted when the goButton is activated
     */
    signal buttonActivated

    layoutId: "tnGoButtonLayout"

    FHC.IconTextPushButton {
        id: button

        anchors.fill: parent

        enabled: root.isEnabled
        styleId: "tnTextPushButtonStyle"
        backgroundAssetId: root.isEnabled ? "tnBlueButtonIcon" : "tnBtnDisable"

        onClicked: {
            if (!routeCalculating)
            root.buttonActivated();
        }

        MouseArea {
            anchors.fill: parent
            propagateComposedEvents: true
            onPressed: {
                mouse.accepted = root.isEnabled && root.routeCalculating;
            }
        }
    }

    FHC.Text {
        id: goButtonTextId
        objectName: "goButtonText"

        anchors {
            top: parent.top
            left: parent.left
            right: timeText.left
        }
        styleId: root.isEnabled ? "tnGoButtonTextStyle" : "tnGoButtonDisabledTextStyle"
        text: "Start"
    }

    FHC.Text {
        objectName: "durationText"
        id: timeText

        anchors {
            top: parent.top
            right: parent.right
        }
        styleId: "tnGoButtonDurationTextStyle"
        text: "2 min"
        width: text.width
        visible: root.isEnabled && !root.routeCalculating
    }

    FHC.BusyIndicator {
        id: loadingIndicator
        objectName: "loadingIndicator"

        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
        }

        visible: root.isEnabled && root.routeCalculating
    }
}
