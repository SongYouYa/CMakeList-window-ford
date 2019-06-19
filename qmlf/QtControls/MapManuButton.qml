import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.3

Item {

    id: root

    anchors.centerIn: parent
    //the background of the window
    Image {
        id: background
        fillMode: Image.TileHorizontally
        smooth: true
        anchors.fill: parent
        source: 'qrc:qmlf/8inch/bg-pop-up-no-headline.png'
    }

    Text {
        id: qtControls
        color: "#e73d3d"
        text: qsTr("FordControls")
        anchors.left:unloaderTextButton.right
        anchors.leftMargin: 83
    }
    Text {
        id: fordControls
        color: "#e73d3d"
        anchors.left:qtControls.right
        anchors.leftMargin: 143
        text: qsTr("qtControls")

    }
    Button{
        id:loaderTextButton
        text: "load"
        width:100
        height:30
        onClicked: {
            //load the ford control TextPushButton
           console.time("FDGroupText#################################################");
            fordTextButtonLoader.source= "qrc:qmlf/FordControls/FordIconTextPushButton.qml"
           console.timeEnd("FDGroupText#################################################");


               //load the qt control TextPushButton
            console.time("QtGroupText#############################################");
            qtTextButtonLoader.source= "qrc:qmlf/QtControls/QtIconTextPushButton.qml"
            console.timeEnd("QtGroupText############################################");

        }
    }
    Button{
        id: unloaderTextButton
        text: "unload"
        anchors{
         topMargin: 50
        }
        anchors.left: loaderTextButton.right
        anchors.leftMargin: 3
        width:100
        height:30
        onClicked: {
            fordTextButtonLoader.source= ""
            console.info("destroy load the  fordIconTextPushButton ")
            qtTextButtonLoader.source= ""
            console.info("destroy load the  fordIconTextPushButton ")
        }
    }

    Loader{
        id:fordTextButtonLoader
        anchors.left: unloaderTextButton.right
        anchors.leftMargin: 30
        anchors.top: unloaderTextButton.top
        anchors.topMargin: 50
    }
    Loader{
        id:qtTextButtonLoader
        anchors.left: fordTextButtonLoader.right
        anchors.top: fordTextButtonLoader.top
        anchors.topMargin: 5
        anchors.bottom: fordTextButtonLoader.bottom
        anchors.leftMargin: 30

    }

}


/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
