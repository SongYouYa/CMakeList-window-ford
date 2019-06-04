import QtQuick 2.6
import com.ford.hmicontrols 1.0 as HMIControls

Gallery {
    id: root
    property int switchWidth: 400

    GalleryExhibit {
        label: "Toggle Switch"
        placard: "Default style without text; Width 200"
        HMIControls.ToggleSwitch {

        }
    }

    GalleryExhibit {
        label: "Toggle Switch with restriction"
        placard: "driving restriction example"
        HMIControls.ToggleSwitch {
            id:restrictedswitchId
            restricted: true
        }
    }

    GalleryExhibit {
        placard: "Button to Enable/Disable Restriction for above control"

        HMIControls.IconTextPushButton {
            id: btn1
            text: restrictedswitchId.restricted ? "Disable Restriction" : "Enable Restriction"
            width: 200
            height: 80
            onClicked: {
                restrictedswitchId.restricted = !restrictedswitchId.restricted
            }
        }
    }

    GalleryExhibit {
        label: "Toggle Switch"
        placard: "Default style with Text; Width set in style.json"
        HMIControls.ToggleSwitchWithText {
            autoSelectOnClick: true
            text: qsTr("Hello, World!")
            width: parent.width
        }
    }

    GalleryExhibit {
        label: "Toggle Switch"
        placard: "Text-Left; Align-Right; OutlineStyle; Width set in style.json"
        HMIControls.ToggleSwitchWithText {
            autoSelectOnClick: true
            styleId: "toggleSwitchWithTextTextLeftAlignRightOutlineStyle"
            text: qsTr("OutlineStyle text for a different font look")
            width: parent.width
        }
    }

    GalleryExhibit {
        label: "Toggle Switch"
        placard: "Text-Left; Align-Right; NoWrap causes elide; Width 400"
        HMIControls.ToggleSwitchWithText {
            autoSelectOnClick: true
            styleId: "toggleSwitchWithTextTextLeftAlignRightStyle"
            text: qsTr("Hello, World! Nice to meet you.")
            wrapMode: Text.NoWrap
            width: switchWidth
        }
    }

    GalleryExhibit {
        label: "Toggle Switch"
        placard: "Text-Left; Align-Right; WordWrap no elide; Width 400"
        HMIControls.ToggleSwitchWithText {
            autoSelectOnClick: true
            styleId: "toggleSwitchWithTextTextLeftAlignRightStyle"
            text: qsTr("Hello, World! Nice to meet you.")
            wrapMode: Text.WordWrap
            width: switchWidth
        }
    }

    GalleryExhibit {
        label: "Toggle Switch"
        placard: "Text-Right; Align-Left; Width 400"
        HMIControls.ToggleSwitchWithText {
            autoSelectOnClick: true
            styleId: "toggleSwitchWithTextTextRightStyle"
            text: qsTr("Lorem ipsum dolor sit amet, consectetur adipiscing elit")
            width: switchWidth
        }
    }

    GalleryExhibit {
        label: "Toggle Switch"
        placard: "Text-Right; Align-Left; NoWrap causes elide; Width 400"
        HMIControls.ToggleSwitchWithText {
            autoSelectOnClick: true
            styleId: "toggleSwitchWithTextTextRightStyle"
            text: qsTr("Lorem ipsum dolor sit amet, consectetur adipiscing elit")
            wrapMode: Text.NoWrap
            width: switchWidth
        }
    }

    GalleryExhibit {
        label: "Toggle Switch"
        placard: "Text-Right; Align-Right; NoWrap causes elide; Width 400"
        HMIControls.ToggleSwitchWithText {
            autoSelectOnClick: true
            styleId: "toggleSwitchWithTextTextRightAlignRightStyle"
            text: qsTr("Lorem ipsum dolor sit amet, consectetur adipiscing elit")
            wrapMode: Text.NoWrap
            width: switchWidth
        }
    }

    GalleryExhibit {
        label: "Toggle Switch"
        placard: "Text-Right; Align-Right; TextWrap no elide; Width 400"
        HMIControls.ToggleSwitchWithText {
            autoSelectOnClick: true
            styleId: "toggleSwitchWithTextTextRightAlignRightStyle"
            text: qsTr("Lorem ipsum dolor sit amet, consectetur adipiscing elit")
            wrapMode: Text.WordWrap
            width: switchWidth
        }
    }

    GalleryExhibit {
        label: "Toggle Switch"
        placard: "Default with sunken text; Width set in style.json"
        HMIControls.ToggleSwitchWithText {
            autoSelectOnClick: true
            styleId: "toggleSwitchWithTextStyleSunken"
            text: qsTr("Lorem ipsum dolor sit amet")
            width: parent.width
        }
    }

    GalleryExhibit {
        label: "Switch Button List Item"
        placard: "With Icon, Text, and Moreinfo"
        HMIControls.SwitchButtonListItem {
            autoSelectOnClick: true
            hasMoreInfoOverride: true
            labelText: "Cruise Control"
            itemIcon: "cruiseControl"
            width: parent.width
        }
    }

    GalleryExhibit {
        label: "Switch Button List Item"
        placard: "With Icon, and Text"
        HMIControls.SwitchButtonListItem {
            autoSelectOnClick: true
            hasMoreInfoOverride: false
            labelText: "Cruise Control"
            itemIcon: "cruiseControl"
            width: parent.width
        }
    }

    GalleryExhibit {
        label: "Switch Button List Item"
        placard: "Disabled mode with Icon, Text, and Moreinfo"
        HMIControls.SwitchButtonListItem {
            autoSelectOnClick: true
            enabled: false
            hasMoreInfoOverride: true
            labelText: "Cruise Control"
            itemIcon: "cruiseControl"
            width: parent.width
        }
    }

    GalleryExhibit {
        label: "Switch Button List Item"
        placard: "Right to left mode, with Moreinfo"
        LayoutMirroring.enabled : true
        LayoutMirroring.childrenInherit: true
        HMIControls.SwitchButtonListItem {
            autoSelectOnClick: true
            hasMoreInfoOverride: true
            labelText: "Cruise Control"
            itemIcon: "cruiseControl"
            width: parent.width
        }
    }
}
