import QtQuick 2.7
import com.ford.hmicontrols 1.0 as HMIControls


Gallery {
    id: root

    GalleryExhibit {
        label: "Icon Text Push Button"
        placard: "Its restricted Button Example"

        HMIControls.IconTextPushButton {
            id: restrictedButtonId
            text: qsTr("Click Me")
            iconAssetId: "iconMenu"
            width: 160
            height: 120
            restricted: true
            onRestrictedClicked: {                
                console.warn("Restricted Onclick works during restricted.")
            }
        }        
    }

    GalleryExhibit {
        placard: "Button to Enable/Disable Restriction for above control"

        HMIControls.IconTextPushButton {
            id: btn1
            text: restrictedButtonId.restricted ? "Disable Restriction" : "Enable Restriction"
            width: 200
            height: 80
            onClicked: {
                restrictedButtonId.restricted = !restrictedButtonId.restricted
            }
        }
    }

    GalleryExhibit {
        label: "Icon Text Push Button"
        placard: "Icon Text Push button can be used as\n simple Text Push Button by sending empty IconAssetId "
        HMIControls.IconTextPushButton {
            iconAssetId: ""
            text: qsTr("Click Me")
            width: 150
            height: 60
        }
    }

    GalleryExhibit {
        label: "Icon Text Push Button"
        placard: "Icon Text Push button can be used as\n simple Text Push Button by sending no iconAssetId"
        HMIControls.IconTextPushButton {
            text: qsTr("Click Me")
            width: 150
            height: 60
        }
    }


    GalleryExhibit {
        label: "Icon Text Push Button"
        placard: "Default: IconTextPushButtonStyle"
        HMIControls.IconTextPushButton {
            text: qsTr("Click Me")
            iconAssetId: "iconMenu"
            width: 160
            height: 120
        }
    }


    GalleryExhibit {
        label: "Icon Text Push Button"
        placard: "Left Aligned Text, Right Aligned Icon; rightIconTextPushButtonStyle"
        HMIControls.IconTextPushButton {
            text: qsTr("Click Me")
            styleId: "rightIconTextPushButtonStyle"
            iconAssetId: "settingsBluetooth"
            width: 160
            height: 80
        }
    }

    GalleryExhibit {
        label: "Icon Text Push Button - click"
        HMIControls.IconTextPushButton {
            text: qsTr("Icon Text Push Button With Some Really Long Text That Should Not Be Completely Rendered")
            iconAssetId: "settingsBluetooth"
            textMaximumLineCount: 1
            property int clickCount: 0
            onClicked: {
                clickCount = clickCount + 1
                var s = clickCount == 1 ? "" : "s"
                parent.placard = "You clicked me " + clickCount + " time" + s + "!"
            }

            width: 150
            height: 100
        }
    }

    GalleryExhibit {
        label: "Icon Text Push Button - AutoRepeat"
        HMIControls.IconTextPushButton {
            text: qsTr("Icon Text Push Button With Some Really Long Text That Should Not Be Completely Rendered")
            iconAssetId: "settingsBluetooth"
            textMaximumLineCount: 1
            property int autoRepeatCount: 0
            onAutoRepeat: {
                autoRepeatCount = autoRepeatCount + 1
                var s = autoRepeatCount == 1 ? "" : "s"
                parent.placard = "autoRepeatCount  " + autoRepeatCount + " time" + s + "!"
            }

            width: 150
            height: 100
        }
    }


    GalleryExhibit {
        label: "Icon Text Push Button"
        placard: "With select state toggle!"
        HMIControls.IconTextPushButton {
            text: qsTr("Click Me")
            iconAssetId: "settingsBluetooth"
            autoSelectOnClick: true
            onClicked: {
                parent.placard = "Selected: " + isSelected;
            }

            width: 150
            height: 100
        }
    }
    GalleryExhibit {
        label: "Icon Text Push Button"
        placard: "With climate styling and latching\n(unused in Lincoln theme)"
        HMIControls.IconTextPushButton {
            styleId: "climateLatchedButtonStyle"
            autoSelectOnClick: true
            text: qsTr("Dual")
            height: 65
            width: 130
        }
    }

    GalleryExhibit {
        label: "Double Icon Button"
        placard: "With climate styling and latching\n(unused in Lincoln theme)"
        HMIControls.DoubleIconPushButton {
            styleId: "climateIconLatchedButtonStyle"
            autoSelectOnClick: true
            height: 80
            width: 130
        }
    }

    GalleryExhibit {
        label: "Vertical Indicator Button"
        HMIControls.IndicatorButton {
            text: qsTr("ABC")
            height: 60
            width: 130
        }
    }

    GalleryExhibit {
        label: "Horizontal Indicator Button"
        HMIControls.IndicatorButton {
            styleId: "HorizontalIndicatorButtonStyle"
            text: qsTr("ABC")
            height: 60
            width: 130
        }
    }

    GalleryExhibit {
        label: "Icon Two State Push Buttons"
        placard: "With default square and round styles"
        HMIControls.IconTwoStatePushButton {
            iconAssetId: "iconPlayPause"
        }
        HMIControls.IconTwoStatePushButton {
            styleId: "iconTwoStatePushButtonRoundStyle"
            iconAssetId: "iconPlayPause"
        }

    }

    GalleryExhibit {
        label: "Icon Two State Push Buttons with Inactive states"
        placard: "Inactive both states background example"
        HMIControls.IconTwoStatePushButton {
            styleId: "iconTwoStatePushButtonRoundStyle"
            iconAssetId: "iconPlayPause"
            isActive: false           
        }
        HMIControls.IconTwoStatePushButton {
            styleId: "iconTwoStatePushButtonRoundStyle"
            iconAssetId: "iconPlayPause"
            isActive:false
            isSelected: true
        }

    }

    GalleryExhibit {
        label: "Icon Text Push Button"
        placard: "With \"tiny button\" stylings: bottom, left, and center"
        HMIControls.IconTextPushButton {
            styleId: "tinyButtonBottomStyle"
            iconAssetId: "arrowUp"
            width: 70
            height: 70
        }
        HMIControls.IconTextPushButton {
            styleId: "tinyButtonLeftStyle"
            iconAssetId: "arrowUp"
            width: 70
            height: 70
        }
        HMIControls.IconTextPushButton {
            styleId: "tinyButtonCenterStyle"
            iconAssetId: "arrowUp"
            width: 70
            height: 70
        }
    }

    GalleryExhibit {
        label: "Icon Text Push Button"
        placard: "With \"tiny button\" styling, but using manual alignment"
        HMIControls.IconTextPushButton {
            iconAssetId: "arrowLeft"
            iconPositionHorizontal: "left"
            iconPositionVertical: "center"
            text: "Left"
            width: 130
            height: 90
        }
        HMIControls.IconTextPushButton {
            iconAssetId: "arrowUp"
            iconPositionVertical: "top"
            text: "Top"
            width: 130
            height: 90
        }
        HMIControls.IconTextPushButton {
            iconAssetId: "arrowRight"
            iconPositionHorizontal: "right"
            iconPositionVertical: "center"
            text: "Right"
            width: 130
            height: 90
        }
    }

    GalleryExhibit {
        label: "More Info Button"
        HMIControls.MoreInfoButton {
            id: moreInfoButton

        }
    }

    GalleryExhibit {
        label: "Button with debug helper"
        placard: "Click the debug regions to see more information"
        HMIControls.IconTextPushButton {
            id: goToSpecialButton
            visible: true
            styleId: "goToButtonStyle"
            text: qsTr("Debug!")

            height: 60
            width: 180
            HMIControls.DebugHelper {
                // By default, the target is set to the parent
                infoAnchorItem: debugInfo
                // By default, show is false for release builds
                show: true
            }
        }
        Rectangle {
            id: debugInfo
            height: 100
            width: 250
            color: "transparent"
        }
    }
}
