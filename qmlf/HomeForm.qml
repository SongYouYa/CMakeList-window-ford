import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    width: 1200
    height: 1920

    title: qsTr("Testing FORD AND QT CONTROL WINDOW")

    Label {   
        Text {
               font.pointSize: 20
               text: "Testing FORD AND QT CONTROL WINDOW!"
           }
     anchors{
      left: parent.left
      leftMargin: 230
      top: parent.top
      topMargin: 300
     }

    }
}
