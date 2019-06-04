import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import QtQuick.Layouts 1.3

import com.ford.hmicontrols 1.0 as HMIControls

Gallery {
    id: root
    GalleryExhibit {
        label: "Layout powered by Brand configuration"
        placard: layoutForBranding.placardText
        HMIControls.Layout {
            id: layoutForBranding
            layoutId: "mediaQueryLayoutBrandingExhibit"
            property string placardText: "This string will be replaced by the layout"
            anchors {
                fill: parent
                leftMargin: 400
            }
            Rectangle {
                objectName: "Rect"
                Text{
                    anchors.centerIn: parent
                    objectName: "rectText"
                }
            }
        }
    }
}
