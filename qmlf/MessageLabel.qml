// MessageLabel.qml
import QtQuick 2.12

Rectangle {
    height: 50
    property string message: "debug message"
    property var msgType: ["debug", "warning" , "critical"]
    color: "white"

    Column {
        anchors.fill: parent
        padding: 5.0
        spacing: 2
        anchors.top: parent.top
       // anchors.topMargin: 160
        anchors.left: parent.left
       // anchors.leftMargin: 120
        Text {
            text: "Machine is status of Running....."
            font.pointSize: 20
            font.bold: msgType == "critical"
            font.family: "Terminal Regular"
            color: msgType === "warning" || msgType === "critical" ? "red" : "yellow"
            ColorAnimation on color {
                running: msgType == "critical"
                from: "red"
                to: "black"
                duration: 1000
                loops: msgType == "critical" ? Animation.Infinite : 1
            }
        }
    }

}
