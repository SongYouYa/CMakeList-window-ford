import QtQuick 2.6
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import QtQuick.Layouts 1.3

import com.ford.hmicontrols 1.0 as HMIControls

Gallery {
    id: root

    anchors.margins: 20
    width: parent.width
    height: parent.height

    HMIControls.Layout {
        id: layout
        layoutId: "layoutJsonExprtkParserGalleryPage"

        anchors.fill: parent
        width: parent.width
        height: parent.height

        GalleryExhibit {
            label: "Icon Text Push Button"
            placard: "Configurable through Gallery's Layouts.json"
            HMIControls.IconTextPushButton {
                id: buttonOne
                objectName: "buttonOne"
                iconAssetId: "iconAcceptCall"
                text: "One"
                width: 100
                height: 100
                visible: false
            }
            HMIControls.IconTextPushButton {
                id: buttonTwo
                objectName: "buttonTwo"
                iconAssetId: "iconAcceptCall"
                text: "Two"
            }
        }
    }
}
