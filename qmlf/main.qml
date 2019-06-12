
import QtQuick.Window 2.2
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.0
import QtQuick 2.9
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    id: window
    visible: true
    width: 1200
    height: 1920
    title: qsTr("test QuickControl FORD VS QT ")

    header: ToolBar {
        contentHeight: toolButton.implicitHeight

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
                    stackView.push("qrc:qmlf/QtControls/MapManuButton.qml")
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
                    stackView.push("qrc:FordListViewGallery.qml")
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
                    stackView.push("qrc:qmlf/QtControls/QtGridtPushTextButtonListView.qml")
                    console.timeEnd("Grid----Qt#################################################");
                    drawer.close()
                }
            }

            ItemDelegate {
                text: qsTr("Grid-Ford")
                width: parent.width

                onClicked: {
                    console.time("Grid--Ford#################################################");
                    stackView.push("qrc:FordGridViewGallery.qml")
                    console.timeEnd("Grid--Ford#################################################");
                    drawer.close()
                }
            }

            /*   testDemo */
            ItemDelegate {
                text: qsTr("ShowResult")
                width: parent.width

                onClicked: {
                    console.time("TestDemo#################################################");
                    stackView.push("qrc:qmlf/tableModuleView/TableShowWidget.qml")
                    console.timeEnd("TestDemo#################################################");
                    drawer.close()
                }
            }

        }
    }

    StackView {
        id: stackView
        initialItem: "qrc:qmlf/HomeForm.qml"
        anchors.fill: parent
    }
}

