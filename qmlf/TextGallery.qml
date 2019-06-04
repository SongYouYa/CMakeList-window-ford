import QtQuick 2.7
import QtQuick.Controls 1.0
import com.ford.hmicontrols 1.0 as HMIControls

Gallery {
    id: root

    GalleryExhibit {
        label: "Normal Text"
        HMIControls.Text {
            text: qsTr("This is some normal text, enough width for its content.")
            width: 700
            horizontalAlignment: Text.AlignRight           
        }
        width: 700
    }

    GalleryExhibit {
        label: "Normal Text gets disabled when restricted"
        HMIControls.Text {
            id: restrictedTextId
            text: qsTr("This is some normal text to test driving restriction")
            width: 700
            horizontalAlignment: Text.AlignRight
            restricted: true
        }
        width: 700
    }

    GalleryExhibit {
        placard: "Button to Enable/Disable Restriction for above control"
        HMIControls.IconTextPushButton {
            id: btn
            text: restrictedTextId.restricted ? "Disable Restriction" : "Enable Restriction"
            width: 200
            height: 80
            onClicked: {
                restrictedTextId.restricted = !restrictedTextId.restricted
            }
        }
    }

    GalleryExhibit {
        label: "Eliding Text"
        placard: "Default Elide properties"
        HMIControls.Text {
            text: qsTr("This is some eliding text.")
            width: 200
            maximumLineCount: 1
        }
    }

    GalleryExhibit {
        label: "Eliding Text"
        placard: "Left Elide; Align Right"
        HMIControls.Text {
            text: qsTr("This is some eliding text.")
            width: 200
            maximumLineCount: 1
            elide: Text.ElideLeft
            horizontalAlignment: Text.AlignRight
        }
    }

    GalleryExhibit {
        label: "Text with NO Elide"
        placard: "elideFadeEffectEnabled false; ElideNone"
        HMIControls.Text {
            text: qsTr("This is some eliding text.")
            width: 200
            maximumLineCount: 1
            elide: Text.ElideNone
            elideFadeEffectEnabled: false
        }
    }

    GalleryExhibit {
        label: "Text with ElideRight"
        placard: "elideFadeEffectEnabled false"
        HMIControls.Text {
            text: qsTr("This is some eliding text.")
            width: 200
            maximumLineCount: 1
            elide: Text.ElideRight
            elideFadeEffectEnabled: false
        }
    }

    GalleryExhibit {
        label: "Text with ElideLeft"
        placard: "Left Elide; Align Right; elideFadeEffectEnabled false"
        HMIControls.Text {
            text: qsTr("This is some eliding text.")
            width: 200
            maximumLineCount: 1
            elide: Text.ElideLeft
            horizontalAlignment: Text.AlignRight
            elideFadeEffectEnabled: false
        }
    }

    GalleryExhibit {
        label: "Eliding Mirrored Text"
        placard: "default settings; LayoutMirroring.enabled true"

        LayoutMirroring.enabled: true
        LayoutMirroring.childrenInherit: true

        HMIControls.Text {
            text: qsTr("This is some eliding text.")
            width: 200
            maximumLineCount: 1
        }
    }

    GalleryExhibit {
        label: "Eliding Wrapped Text"
        HMIControls.Text {
            text: qsTr("This is some eliding text that should wrap to a second line.")
            width: 250
            maximumLineCount: 2
        }
    }

    GalleryExhibit {
        label: "Dots Eliding Wrapped Text"
        HMIControls.Text {
            text: qsTr("This is sample text spread in multi-line and right elided with dots.")
            width: 250
            maximumLineCount: 2
            elideFadeEffectEnabled: false
        }
    }

    GalleryExhibit {
        label: "Drop Shadow Text"
        HMIControls.Text {
            text: qsTr("Shadow")
            width: 200
            maximumLineCount: 1
            styleId: "dropShadowTextStyle"
        }
    }

    GalleryExhibit {
        label: "Scrolling Text"
        HMIControls.ScrollingText {
            text: qsTr("This is some really super duper long scrolling text.  Well it's not that long.")
            width: 250
        }
    }

    Component {
        id: keyboard
        Row {
            spacing: 5
            Repeater {
                model: 5
                HMIControls.IconTextPushButton {
                    id: jkc
                    text: index
                    width: 60
                    height: width
                    onClicked: textBuffer += index
                }
            }
        }
    }

    GalleryExhibit {
        label: "TextInputLine - Text Input"

        Column {
            HMIControls.TextInputLine {
                styleId: "TextFieldStyleGallery"
                placeholderText: "This is a sample text"
                text: loaderNoBackspace.textBuffer
            }

            Loader {
                id: loaderNoBackspace
                sourceComponent: keyboard
                property string textBuffer
            }
        }
    }

    GalleryExhibit {
        label: "TextInputLine - Text Input with Backspace button"

        Column {
            HMIControls.TextInputLine {
                styleId: "TextFieldStyleGallery"
                placeholderText: "This is a sample text"
                backspaceButtonVisible: true
                text: loaderBackspace.textBuffer
            }

            Loader {
                id: loaderBackspace
                sourceComponent: keyboard
                property string textBuffer
            }
        }
    }

    GalleryExhibit {
        label: "TextInputLine - " + textInputLinePassword.textMaximumLength + " char Password Input"

        Column {
            HMIControls.TextInputLine {
                id: textInputLinePassword
                styleId: "TextFieldStyleGallery"
                textEchoMode: TextInput.Password
                textMaximumLength: 5 // Can remove and set "maxLength" in style
                placeholderText: "Password: Must have at most " + textMaximumLength + " characters"
                text: loaderPassword.textBuffer
            }

            Loader {
                id: loaderPassword
                sourceComponent: keyboard
                property string textBuffer
            }
        }
    }
}
