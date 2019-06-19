import QtQuick 2.9
import QtQuick.Controls 2.2


Page {
    width: 1200
    height: 1920

    title: qsTr("NavigationTool")
    MessageLabel {
           width: parent.width - 2
           message: "A critical warning!"
           msgType: "critical"
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
