import QtQuick 2.6
import com.ford.hmicontrols 1.0 as HMIControls

Gallery {
    id: root

    property int itemWidth: 300

    GalleryExhibit {
        label: "Radio Button"
        placard: "Default style - width comes from style.json, height 40"
        HMIControls.RadioButton {
            text: qsTr("Supercali")
            height: 40            
        }
    }
    GalleryExhibit {
        label: "Radio Button"
        placard: "Radio Button with Restricted"
        HMIControls.RadioButton {
            id: restrictedRadioButtonId
            text: qsTr("Supercali")
            height: 40
            restricted: true
        }
    }
    GalleryExhibit {
        placard: "Button to Enable/Disable Restriction for above control"
        HMIControls.IconTextPushButton {
            id: btn1
            text: restrictedRadioButtonId.restricted ? "Disable Restriction" : "Enable Restriction"
            width: 200
            height: 80
            onClicked: {
                restrictedRadioButtonId.restricted = !restrictedRadioButtonId.restricted
            }
        }
    }


    GalleryExhibit {
        label: "Radio Button"
        placard: "Text-Left; Align-Right; NoWrap; font:12; icon:50"
        HMIControls.RadioButton {
            styleId: "radioButtonTextLeftAlignRightStyle"
            text: qsTr("fragilistic")
            iconHeight: 50
            iconWidth: 50
            fontSize: 12
            wrapMode: Text.NoWrap
            width: 200
        }
    }

    GalleryExhibit {
        label: "Radio Button"
        placard: "Text-Right; Align-Right; WordWrap; font:10; icon:30"
        HMIControls.RadioButton {
            styleId: "radioButtonTextRightStyle"
            text: qsTr("expiali")
            fontSize: 10
            iconHeight: 30
            iconWidth: 30
            width: itemWidth
        }
    }

    GalleryExhibit {
        label: "Radio Button"
        placard: "Text-Right; Align-left; WordWrap; font:8; icon:25; HEIGHT 250"
        HMIControls.RadioButton {
            styleId: "radioButtonTextRightAlignLeftStyle"
            text: qsTr("docious")
            fontSize: 8
            iconHeight: 25
            iconWidth: 25
            width: itemWidth
            height: 250
        }
    }

    GalleryExhibit {
        label: "Radio Button"
        placard: "Manually configured Text Position Right; Align-left; WordWrap; font:8; icon:25"
        HMIControls.RadioButton {
            styleId: "RadioButtonStyle"
            text: qsTr("docious2")
            fontSize: 8
            iconHeight: 25
            iconWidth: 25
            width: itemWidth
            textPosition: "right"
            textAlign: "left"
        }
    }

    GalleryExhibit {
        label: "Radio Button"
        placard: "Default style long text - width 500"
        HMIControls.RadioButton {
            text: qsTr("Lorem ipsum dolor sit amet, consectetur adipiscing elit")
            wrapMode: Text.NoWrap
            width: 500
        }
    }

    GalleryExhibit {
        label: "Radio Button"
        placard: "Text-Left; Align-Right; font:14; icon:50; NoWrap causes elide; "
        HMIControls.RadioButton {
            styleId: "radioButtonTextLeftAlignRightStyle"
            text: qsTr("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
            iconHeight: 50
            iconWidth: 50
            fontSize: 14
            wrapMode: Text.NoWrap
            width: itemWidth
        }
    }

    GalleryExhibit {
        label: "Radio Button"
        placard: "Text-Left; Align-Right; font:14; icon:50; WordWrap no elide; "
        HMIControls.RadioButton {
            styleId: "radioButtonTextLeftAlignRightStyle"
            text: qsTr("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
            iconHeight: 50
            iconWidth: 50
            fontSize: 14
            wrapMode: Text.WordWrap
            width: itemWidth
        }
    }

    GalleryExhibit {
        label: "Radio Button Group"
        placard: "Default style"
        HMIControls.RadioButtonGroup {
            width: itemWidth
            clip: true
            radioButtonModel: ["Subzero", "Cool", "Medium", "Warm", "Hot"]
            styleId: "radioButtonTextRightAlignLeftStyle"
            selectedIndex: requestedIndex
        }
    }

    GalleryExhibit {
        label: "Radio Button Group"
        placard: "boundsBehavior: Flickable.StopAtBounds"
        HMIControls.RadioButtonGroup {
            width: itemWidth
            height: 150
            clip: true
            radioButtonModel: ["Subzero", "Cool", "Medium", "Warm", "Hot"]
            styleId: "radioButtonTextRightAlignLeftStyle"
            selectedIndex: requestedIndex
            boundsBehavior: Flickable.StopAtBounds
        }
    }
    GalleryExhibit {
        label: "Radio Button Group"
        placard: "Restricted RadioButtonGroup"

        HMIControls.RadioButtonGroup {
            id: restrictedRadioButtonGroupId
            width: itemWidth
            height: 150
            clip: true
            radioButtonModel: ["Subzero", "Cool", "Medium", "Warm", "Hot"]
            styleId: "radioButtonTextRightAlignLeftStyle"
            selectedIndex: requestedIndex
            boundsBehavior: Flickable.StopAtBounds
            restricted: true
            onRestrictedClicked: {
                console.warn("RestrictedOnclick works when restricted is true.")
            }

        }

    }

    GalleryExhibit {
        placard: "Button to Enable/Disable Restriction for above control"
        HMIControls.IconTextPushButton {
            id: btn
            text: restrictedRadioButtonGroupId.restricted ? "Disable Restriction" : "Enable Restriction"
            width: 200
            height: 80
            onClicked: {
                restrictedRadioButtonGroupId.restricted = !restrictedRadioButtonGroupId.restricted
            }
        }
    }

}
