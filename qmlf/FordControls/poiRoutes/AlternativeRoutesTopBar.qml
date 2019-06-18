import QtQuick 2.7
import com.ford.hmicontrols 1.0 as FHC
//import "../shared"
FHC.Layout {
    id: root
    layoutId: "tnAlternativeRoutesTopBarLayout"

    property int avoidOnRouteIconWidth
    property int avoidOnRouteIconHeight
    signal backButtonActivated()
    signal avoidOnRouteButtonActivated()
    property bool isAvoidOnRouteView
    property bool isTripPlanningView

    TitleBar {
        id: titleBar
        objectName: "titleBar"
        anchors.fill: parent
        titleText: "Routes"
        titleBgImageAssetId: root.isAvoidOnRouteView ? "titleBarBackground"
                                                     : "tnTopBarWith2DividersBackground"
        onBackButtonActivated: {
            root.backButtonActivated();
        }
    }

    FHC.IconTextPushButton {
        id: avoidOnRouteButton
        objectName: "avoidOnRouteButton"
        anchors {
            top: parent.top
            right: parent.right
        }
        visible: !root.isAvoidOnRouteView && !root.isTripPlanningView

        onClicked: {
            root.avoidOnRouteButtonActivated();
        }
    }
}
