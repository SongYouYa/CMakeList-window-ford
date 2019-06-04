import QtQuick 2.6
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import com.ford.hmicontrols 1.0 as HMIControls

Item {
    id: root

    property alias model: repeater.model
    property alias menuWidth: menu.width
    property int currentIndex: 0

    signal clicked

    width: childrenRect.width
    anchors {
        top: parent.top
        bottom: parent.bottom
    }


    HMIControls.AssetItem {
        id: backgroundImage
        assetId: "mainBackground"
        anchors.fill: menu
    }

    HMIControls.Scrollable {
        id: menu
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
        }
        width: 350
        content: [
            Column {
                id: choices
                width: root.width
                spacing: 0

                ExclusiveGroup {
                    id: tabButtonGroup
                }
                Repeater {
                    id: repeater
                    delegate: HMIControls.AssetItem {
                        id: tabButton
                        property bool selected: currentIndex === index
                        assetId: selected ? "navbarButtonBackground-selected" : "navbarButtonBackground-activePressed"

                        width: root.width
                        height: 90

                        HMIControls.AssetItem {
                            id: icon
                            assetId: iconName
                            anchors {
                                left: tabButton.left
                                verticalCenter: tabButton.verticalCenter
                                margins: 15
                            }
                            z: tabButton.z + 1
                            height: 50
                            width: 50
                        }

                        HMIControls.Text {
                            id: mainTextLabel
                            text: buttonText
                            anchors {
                                left: icon.right
                                right: tabButton.right
                                verticalCenter: tabButton.verticalCenter
                                margins: 40
                            }
                            z: tabButton.z + 1
                            styleId: "BaseTextStyle"
                            maximumLineCount: 1
                        }

                        MouseArea {
                            anchors.fill: tabButton
                            onClicked: {
                                currentIndex = index
                                console.log("Gallery item selected at index:" + currentIndex+" with name:\""+buttonText+"\"")
                                root.clicked()
                            }
                        }
                    }
                }
            }
        ]
    }

    Item {
        id: autoCloser
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: menu.right
        }
        visible: false
        width: root.parent.width - menu.width
        MouseArea {
            anchors.fill: parent
            onClicked: {
                close();
            }
        }
    }

    function open() {
        state = "SHOWN";
    }
    function close() {
        state = "HIDDEN";
    }

    onClicked: {
        close();
    }
    x: -menu.width
    state: "HIDDEN"
    states: [
            State {
                name: "HIDDEN"; when: root.moveOut
                PropertyChanges { target: root; x: -menu.width }
                PropertyChanges { target: autoCloser; visible: false }
            },
            State {
                name: "SHOWN"; when: root.moveIn
                PropertyChanges { target: root; x: 0; }
                PropertyChanges { target: autoCloser; visible: true }
            }
        ]

    transitions: [
        Transition {
            to: "SHOWN"
            NumberAnimation { properties: "x,y"; easing.type: Easing.InOutQuad; duration: 400; loops: 1 }
        },
        Transition {
            to: "HIDDEN"
            NumberAnimation { properties: "x,y"; easing.type: Easing.InOutQuad; duration: 400; loops: 1 }
        }
    ]
}
