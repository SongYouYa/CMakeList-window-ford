
import QtQuick.Window 2.2
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.0
import QtQuick 2.9
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    id: window
    visible: true
    width: 800
    height: 500
    title: qsTr("test QuickControl FORD VS QT ")

    header: ToolBar {
        id:toobar
        contentHeight: toolButton.implicitHeight
        Image {
            id: topbarbackground
            source: "qrc:qmlf/8inch/titlebar.PNG"
            anchors.left: window.left
            height: 40
        }
        ToolButton {
            id: toolButton
            text: stackView.depth > 1 ? "\u25C0" : "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    drawer.open()
                }
            }
        }

        Label {
            text: stackView.currentItem.title
            anchors.centerIn: parent
        }
    }

    Drawer {
        id: drawer
        width: window.width * 0.66
        height: window.height

        Column {
            anchors.fill: parent
            ///******************************RecentPageComponent*********************////
            ItemDelegate {
                text: qsTr("RecentScreen-QT")
                width: parent.width
                onClicked: {

                    console.time("RScreen-QT##########################################");
                    stackView.push("RecentScreenQuickControl.qml")
                    console.timeEnd("RScreen-QT##########################################");
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("RecentScreen-FORD")
                width: parent.width

                onClicked: {
                    console.time("RScreen-FD#################################################");
                    stackView.push("RecentScreenFHC.qml")
                    console.timeEnd("RScreen-FD#################################################");
                    drawer.close()
                }
            }


            ///******************************GridComponent*********************////
            ItemDelegate {
                text: qsTr("Single Componet PushTextButton")
                width: parent.width

                onClicked: {
                    console.time("QtAdFdPage#################################################");
                    stackView.push("QtControls/MapManuButton.qml")
                    console.timeEnd("QtAdFdPage#################################################");
                    drawer.close()
                }
            }
            ///******************************ListComponent*********************////
            ItemDelegate {
                text: qsTr("List-Qt")
                width: parent.width

                onClicked: {
                    console.time("List----Qt#################################################");
                    stackView.push("qrc:qmlf/QtControls/QtListPushTextButtonListView.qml")
                    console.timeEnd("List----Qt#################################################");
                    drawer.close()
                }
            }

            ItemDelegate {
                text: qsTr("List-Ford")
                width: parent.width

                onClicked: {
                    console.time("List--Ford#################################################");
                    stackView.push("FordControls/gridlistview/FordListViewGallery.qml")
                    console.timeEnd("List--Ford#################################################");
                    drawer.close()
                }
            }
            ///******************************GridComponent*********************////
            ItemDelegate {
                text: qsTr("Grid-Qt")
                width: parent.width

                onClicked: {
                    console.time("Grid----Qt#################################################");
                    stackView.push("QtControls/QtGridtPushTextButtonListView.qml")
                    console.timeEnd("Grid----Qt#################################################");
                    drawer.close()
                }
            }

            ItemDelegate {
                text: qsTr("Grid-Ford")
                width: parent.width

                onClicked: {
                    console.time("Grid--Ford#################################################");
                    stackView.push("FordControls/gridlistview/FordGridViewGallery.qml")
                    console.timeEnd("Grid--Ford#################################################");
                    drawer.close()
                }
            }
              ///******************************PoiRouterList*********************////
            ItemDelegate {

                text: qsTr("Route-Ford")
                width: parent.width

                onClicked: {
                    console.time("RouterList#################################################");
                    stackView.push("FordControls/poiRoutes/PoiRoutes.qml")
                    console.timeEnd("RouterList#################################################");
                    drawer.close()
                }
            }

            ItemDelegate {

                text: qsTr("Route-Qt")
                width: parent.width

                onClicked: {
                    console.time("Router--Qt#################################################");
                    stackView.push("QtControls/qtPoiRoutes/QtPoiRoutes.qml")
                    console.timeEnd("Router--Qt#################################################");
                    drawer.close()
                }
            }
            /*   testDemo */
            ItemDelegate {
                text: qsTr("ShowResult")
                width: parent.width

                onClicked: {
                    console.time("TestDemo#################################################");
                    stackView.push("tableModuleView/TableShowWidget.qml")
                    console.timeEnd("TestDemo#################################################");
                    drawer.close()
                }
            }

        }
    }

    StackView {
        id: stackView
        initialItem: "HomeForm.qml"
        anchors.fill: parent
    }
}

