import QtQuick 2.0

import com.ford.hmicontrols 1.0 as HMIControls

Row {
    id: root
    property alias label: labelText.text
    property alias placard: placardText.text

    anchors {
        left: parent.left
        right: parent.right
    }

    spacing: 25
    height: childrenRect.height

    Column {
        spacing: 10
        width: 300
        HMIControls.Text {
            id: labelText
            styleId: "BaseTextStyle"
            wrapMode: Text.Wrap
            anchors {
                left: parent.left
            }
            width: parent.width
        }
        HMIControls.Text {
            id: placardText
            styleId: "textStyleSmall"
            wrapMode: Text.Wrap
            anchors {
                left: parent.left
            }
            width: parent.width
        }
    }
}
