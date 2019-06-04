import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

SliderStyle {
    id: root
    property color color
    property int size: 5
    property real width

    groove: Rectangle {
        implicitWidth: width
        implicitHeight: size
        color: "#cccccc"
        radius: size

        Rectangle {
            height: parent.height
            width: styleData.handlePosition
            implicitHeight: size
            implicitWidth: parent.implicitWidth
            radius: size
            //color: root.color

            LinearGradient {
                anchors.fill: parent
                start: Qt.point(0, 0)
                end: Qt.point(parent.width, 0)
                gradient: Gradient {
                    GradientStop { position: 0.0; color: root.color }
                    GradientStop { position: 1.0; color: "white" }
                }
            }
        }
    }
}
