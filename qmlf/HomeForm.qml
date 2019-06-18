import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    width: 1200
    height: 1920

    title: qsTr("NavigationTool")
    Label {   
        Text {
              text: "Testing FORD AND QT CONTROL WINDOW!"
              font.family: "Helvetica"
              font.pointSize: 24
              color: "blue"
           }
     anchors{
      left: parent.left
      leftMargin: 100
      top: parent.top
      topMargin: 120
     }
    }
     Image {
         id: topbarbackground
         source: "qrc:qmlf/8inch/telenavphoto.PNG"
         anchors.fill: parent
         fillMode:Image.PreserveAspectFit
         width: 1200
         height: 1920

     }


}
