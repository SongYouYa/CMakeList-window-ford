import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import QtQuick.Layouts 1.3

import com.ford.hmicontrols 1.0 as HMIControls


Gallery {
    id: root

    GalleryExhibit {

        HMIControls.Layout {
            id: layoutGalleryPage
            layoutId: "layoutGalleryPage"

            content: GridLayout {
                id: gridLayout

                Behavior on columns {
                    NumberAnimation { easing.type: Easing.Linear; easing.amplitude: 3.0; easing.period: 2.0; duration: 1500 }
                }
                HMIControls.IconTextPushButton {
                    id: firstButton
                    iconAssetId: "iconAcceptCall"
                    text: "One"
                    Layout.preferredWidth: 200
                    Layout.preferredHeight: 150
                }

                HMIControls.IconTextPushButton {
                    id: secondButton
                    iconAssetId: "iconAcceptCall"
                    text: "Two"
                    Layout.preferredWidth: 200
                    Layout.preferredHeight: 150
                }

                HMIControls.IconTextPushButton {
                    id: thirdButton
                    iconAssetId: "iconAcceptCall"
                    text: "Three"
                    Layout.preferredWidth: 200
                    Layout.preferredHeight: 150
                }
            }

        }
    }

    GalleryExhibit {
        Rectangle {
            id: blueRect
            color: "blue"

            y: thirdButton.y + thirdButton.height + 5
            x: thirdButton.x + thirdButton.width + 5
            width: 100
            height: 100

            Behavior on y {
                NumberAnimation { easing.type: Easing.OutElastic; easing.amplitude: 3.0; easing.period: 2.0; duration: 1000 }
            }
        }
    }

    GalleryExhibit {
        HMIControls.Layout {
        id: layoutGalleryRectsPage
        layoutId: "layoutGalleryRectsPage"
        height: childrenRect.height

            Rectangle {
                id: yellowRect
                objectName: "yellowRect"
            }

            Rectangle {
                id: redRect
                objectName: "redRect"
            }
        }
    }

    GalleryExhibit {
        HMIControls.Layout {
        layoutId: "layoutGallerySettingsLinePage"

            HMIControls.SettingsLine {
                id: settingsLine
                objectName: "settingsLine"

                HMIControls.AssetItem {
                    id: addIcon
                    objectName: "addIcon"
                    assetId: "iconAdd"
                }

                HMIControls.Text {
                    id: addText
                    objectName: "addText"
                    text: qsTr("Settings Line Example")
                    width: addText.contentWidth
                }
            }
        }
    }

}
