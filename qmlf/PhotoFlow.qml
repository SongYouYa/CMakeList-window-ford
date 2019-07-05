import QtQuick.Window 2.2
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.0
import QtQuick 2.9
import QtQuick.Controls.Styles 1.4
Item {
    id: name
   visible:true
   width:800;
   height:480
   ListModel{
       id:model
       ListElement{url:"qrc:qmlf/8inch/photoflow/images.jpg"}
       ListElement{url:"qrc:qmlf/8inch/photoflow/mountain.jpg"}
       ListElement{url:"qrc:qmlf/8inch/photoflow/ocean.jpg"}
       ListElement{url:"qrc:qmlf/8inch/photoflow/river.jpg"}
       ListElement{url:"qrc:qmlf/8inch/photoflow/tree.jpg"}
       ListElement{url:"qrc:qmlf/8inch/photoflow/images.jpg"}
       ListElement{url:"qrc:qmlf/8inch/photoflow/mountain.jpg"}
       ListElement{url:"qrc:qmlf/8inch/photoflow/ocean.jpg"}
       ListElement{url:"qrc:qmlf/8inch/photoflow/river.jpg"}
       ListElement{url:"qrc:qmlf/8inch/photoflow/tree.jpg"}
       }
   CoverFlow{
       anchors.left: parent.left
       anchors.top:parent.top
       anchors.right: parent.right
       anchors.bottom: parent.bottom
       model:model

   }

}
