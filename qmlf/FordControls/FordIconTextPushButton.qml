import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick 2.0
import QtGraphicalEffects 1.0
import com.ford.hmicontrols 1.0 as FHC
Flickable {
    anchors.fill: parent
    contentWidth: parent.width * 2
    contentHeight: parent.height * 2

    ScrollBar.horizontal: ScrollBar { id: hbar; active: vbar.active }
    ScrollBar.vertical: ScrollBar { id: vbar; active: hbar.active }
    ScrollView{
        ScrollBar.vertical.policy: ScrollBar.AlwaysOn
        ScrollBar {
            id: scrollBar
            objectName: "scrollBar"
            hoverEnabled: true
            active: true
            orientation: Qt.Vertical
            size: frame.height / content.height
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.bottom: parent.bottom
        }
        Column{
            Repeater{
                model:100
                FHC.IconTextPushButton {
                    text: qsTr("Call Me")
                    styleId: "rightIconTextPushButtonStyle"
                    iconAssetId: "settingsBluetooth"
                    width: 180
                    height: 150
                }
            }
        }
    }
}

