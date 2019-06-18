
import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick 2.0
//import "../shared"
Component {
    id: root


    property int avoidOnRouteIconWidth
    property int avoidOnRouteIconHeight
    signal backButtonActivated()
    signal avoidOnRouteButtonActivated()
    property bool isAvoidOnRouteView
    property bool isTripPlanningView

    Button {
        id: titleBar
        objectName: "titleBar"
        anchors.fill: parent
        text:"Routes"
        }


    Button {
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
