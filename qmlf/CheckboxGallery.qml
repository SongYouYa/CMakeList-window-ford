import QtQuick 2.6
import com.ford.hmicontrols 1.0 as HMIControls


Gallery {
    id: root

    property int itemWidth: 300

    GalleryExhibit {
        label: "Check Box Button"
        placard: "Default style - width comes from style.json, height 40"
        HMIControls.CheckBoxButton {
            text: qsTr("Click me")
            autoSelectOnClick: true
            height: 40
        }
    }
    GalleryExhibit {
        label: "Check Box Button"
        placard: "Check box with restricted"

        HMIControls.CheckBoxButton {
            id: restrictedButtonId
            text: qsTr("Click me Restricted")
            autoSelectOnClick: true
            height: 40
            restricted: true
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
        label: "Check Box Button"
        placard: "Default style long text - width 500, no height set"
        HMIControls.CheckBoxButton {
            text: qsTr("Click me to switch between selected & unselected")
            autoSelectOnClick: true
            wrapMode: Text.WordWrap
            width: 500
        }
    }

    GalleryExhibit {
        label: "Check Box Button"
        placard: "Default style; font:8; icon:25"
        HMIControls.CheckBoxButton {
            text: qsTr("Click me")
            autoSelectOnClick: true
            fontSize: 8
            iconHeight: 25
            iconWidth: iconHeight
            width: itemWidth
        }
    }

    GalleryExhibit {
        label: "Check Box Button"
        placard: "Text-Right; Align-Left; WordWrap; font:6; icon:20"
        HMIControls.CheckBoxButton {
            styleId: "checkBoxTextRightAlignLeftStyle"
            text: qsTr("I am the very model of a modern Major-General / I've information vegetable, animal, and mineral")
            fontSize: 6
            iconHeight: 20
            iconWidth: iconHeight
            autoSelectOnClick: true
            wrapMode: Text.WordWrap
            width: itemWidth
        }
    }

    GalleryExhibit {
        label: "Check Box Button"
        placard: "Text-Right; Align-Right; NoWrap; font:12"
        HMIControls.CheckBoxButton {
            styleId: "checkBoxTextRightStyle"
            text: qsTr("Supercalifragilisticexpialidocious")
            fontSize: 12
            iconHeight: 30
            iconWidth: iconHeight
            autoSelectOnClick: true
            wrapMode: Text.NoWrap
            width: itemWidth
        }
    }
    GalleryExhibit {
        label: "Check Box Button"
        placard: "Text-Right; Align-Left; NoWrap causes elide"
        HMIControls.CheckBoxButton {
            styleId: "checkBoxTextRightAlignLeftStyle"
            text: qsTr("Even though the sound of it is something quite atrocious")
            wrapMode: Text.NoWrap
            autoSelectOnClick: true
            width: itemWidth
        }
    }

    GalleryExhibit {
        label: "Check Box Button"
        placard: "Text-Right; Align-Right; font:10; icon:30; WordWrap causes no elide"
        HMIControls.CheckBoxButton {
            styleId: "checkBoxTextRightStyle"
            text: qsTr("I am the very model of a modern Major-General / I've information vegetable, animal, and mineral")
            fontSize: 10
            iconHeight: 30
            iconWidth: iconHeight
            autoSelectOnClick: true
            width: itemWidth
        }
    }

    GalleryExhibit {
        label: "Check Box Button"
        placard: "Text-Left; Align-Right; font:10; NoWrap causes elide"
        HMIControls.CheckBoxButton {
            styleId: "checkBoxTextLeftAlignRightStyle"
            text: qsTr("I am the very model of a modern Major-General / I've information vegetable, animal, and mineral")
            fontSize: 10
            wrapMode: Text.NoWrap
            autoSelectOnClick: true
            width: itemWidth
        }
    }

    GalleryExhibit {
        label: "Check Box Button"
        placard: "Text-Left; Align-Right; WordWrap; font:10"
        HMIControls.CheckBoxButton {
            styleId: "checkBoxTextLeftAlignRightStyle"
            text: qsTr("Supercalifragilisticexpialidocious / Even though the sound of it is something quite atrocious")
            fontSize: 10
            autoSelectOnClick: true
            width: itemWidth
        }
    }

    GalleryExhibit {
        label: "Check Box Button"
        placard: "Text-Left; Align-Right; WordWrap; font:12; HEIGHT 250"
        HMIControls.CheckBoxButton {
            styleId: "checkBoxTextLeftAlignRightStyle"
            text: qsTr("Supercalifragilisticexpialidocious / Even though the sound of it is something quite atrocious")
            fontSize: 12
            autoSelectOnClick: true
            width: itemWidth
            height: 250
        }
    }

    GalleryExhibit {
        label: "Check Box Button"
        placard: "Text-Left; Align-Left; WordWrap; font:12"
        HMIControls.CheckBoxButton {
            styleId: "CheckBoxButtonStyle"
            text: qsTr("Supercalifragilisticexpialidocious / Even though the sound of it is something quite atrocious")
            fontSize: 12
            autoSelectOnClick: true
            width: itemWidth
        }
    }
}

