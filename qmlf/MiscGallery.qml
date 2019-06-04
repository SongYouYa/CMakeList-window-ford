import QtQuick 2.6
import QtQuick.Controls 1.0

import com.ford.hmicontrols 1.0 as HMIControls

Gallery {
    id: root

    GalleryExhibit {
        label: "Busy Indicator"
        HMIControls.BusyIndicator {
            width:100
            height:100
        }
    }

    GalleryExhibit {
        label: "Combo Box"
        placard: "Uses default drop-down list items defined in style.json"
        HMIControls.ComboBox {
            model: ["Explorer", "Expedition", "F-150", "Super Duty", "Transit Connect", "Ecosport"]
        }
    }

    GalleryExhibit {
        label: "List Delegates"
        placard: "Default styling with text delegate item repeated three times"
        Column {
            id: list
            width: parent.width
            Repeater {
                model: 3
                HMIControls.ListDelegate {
                    width: 300
                    HMIControls.Text {
                        text: "ListDelegate " + index
                        styleId: "BaseTextStyle"
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        width: parent.width
                    }
                }
            }
        }
    }

    GalleryExhibit {
        label: "List Delegates"
        placard: "No divider styling with text delegate item repeated three times"
        Column {
            id: list_no_divider
            width: parent.width
            Repeater {
                model: 3
                HMIControls.ListDelegate {
                    // Override default property values
                    hasDivider: false
                    height: contentText.height
                    width: 300

                    HMIControls.Text {
                        id: contentText
                        text: "ListDelegate (no divider) " + index
                        styleId: "BaseTextStyle"
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        width: parent.width
                    }
                }
            }
        }
    }

    GalleryExhibit {
        label: "Settings Line"
        placard: "Default styling with text delegate item repeated three times"
        Column {
            id: setting_list
            width: parent.width
            Repeater {
                model: 3
                HMIControls.SettingsLine {
                    width: 300
                    HMIControls.Text {
                        text: "SettingsLine " + index
                        styleId: "BaseTextStyle"
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        width: parent.width
                    }
                }
            }
        }
    }

    GalleryExhibit {
        label: "Icon Text Field Settings Line"
        placard: "Settings Line with Icon text Push Button - left icon and centered text"
        Column {
            id: icontextFieldSettingsLine
            width: parent.width
            HMIControls.IconTextFieldSettingsLine {
                labelText: "Icon Text Field Settings Line"
                assetIcon: "phone"
                width: parent.width
            }
        }
    }

    GalleryExhibit {
        label: "Icon Text Field Settings Line"
        placard: "Settings Line with Icon text Push Button - no Icon and centered text"
        Column {
            id: icontextFieldSettingsLine1
            width: parent.width
            HMIControls.IconTextFieldSettingsLine {
                labelText: "Icon Text Field Settings Line"
                width: parent.width
            }
        }
    }

    GalleryExhibit {
        label: "Arrow Button List Item"
        placard: "Using a data model to indicate if \"more information\" is available"
        Column {
            id: arrow_button_list
            width: parent.width
            Repeater {
                model: settingsModel
                HMIControls.ArrowButtonListItem {
                    labelText: label
                    statusLabelText: statusLabel !== undefined ? statusLabel : ""
                    hasMoreInfoOverride: moreInfoPresent
                    width: parent.width
                }
            }

            ListModel {
                id: settingsModel
                ListElement { label: "Language"; statusLabel: "English"; moreInfoPresent: true }
                ListElement { label: "Measure Units"; statusLabel: "km/Liter"; moreInfoPresent: false }
                ListElement { label: "Quantum Logic Immersion"; statusLabel: "Audience"; moreInfoPresent: true }
                ListElement { label: "Balance and Fade"; moreInfoPresent: false }
                ListElement { label: "About"; moreInfoPresent: true }
            }
        }
    }

    GalleryExhibit {
        label: "Arrow Button List Item with custom margins"
        placard: "Displaying Arrowbutton with custom margins using custom style"
        Column {
            width: parent.width
            HMIControls.ArrowButtonListItem {
                id: arrowbutton
                labelText: "Arrow Button List Item"
                styleId: "CustomArrowButtonListItemStyle"
                width: parent.width
            }
        }
    }
    GalleryExhibit {
        label: "Arrow Button List Item Restricted"
        placard: "Driving Restricted Example"
        Column {
            width: parent.width
            HMIControls.ArrowButtonListItem {
                id: arrowbuttonRestrictId
                labelText: "Arrow Button List Item with Restriction"
                styleId: "CustomArrowButtonListItemStyle"
                width: parent.width
                restricted: true
            }
        }
    }

    GalleryExhibit {
        placard: "Button to Enable/Disable Restriction for above control"

        HMIControls.IconTextPushButton {
            id: btn1
            text: arrowbuttonRestrictId.restricted ? "Disable Restriction" : "Enable Restriction"
            width: 200
            height: 80
            onClicked: {
                arrowbuttonRestrictId.restricted = !arrowbuttonRestrictId.restricted
            }
        }
    }

    GalleryExhibit {
        label: "Arrow Button List Item with listItemContents, and Moreinfo"
        placard: "Displaying additional items in the Arrow Button"
        Column {
            id: arrow_button_list_contents
            width: parent.width
            HMIControls.ArrowButtonListItem {
                labelText: "Ford"
                statusLabelText: "Mustang"
                hasMoreInfoOverride: true
                width: parent.width
                listItemContents: [
                    HMIControls.Text {
                        id: listcontent
                        text: qsTr("GT")
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Text.AlignRight
                        width: listcontent.contentWidth
                    },
                    HMIControls.AssetItem {
                        id: coloredLogo
                        assetId: "fordLogoShaderColorize"
                        anchors.left: listcontent.right
                        width: 80
                        height: 50
                        anchors.verticalCenter: parent.verticalCenter
                    }
                ]
            }
        }
    }

    GalleryExhibit {
        label: "Arrow Button List Item with state connected to custom contents"
        placard: "Custom content state update with the state of Arrow Button List Item"
        Column {
            width: parent.width
            HMIControls.ArrowButtonListItem {
                id: arrowButtonListItem
                width: parent.width
                listItemContents: [

                    HMIControls.AssetItem {
                        id: navIcon
                        assetHelper: HMIControls.AssetHelper {
                            assetId: "nav"
                            styleId: "baseIconStyle"
                            state: arrowButtonListItem.buttonState
                        }
                        colorReplace: true
                        anchors {
                            left: parent.left
                            verticalCenter: parent.verticalCenter
                        }
                    },

                    HMIControls.Text {
                        id: label
                        text: qsTr("Navigation Button Text")
                        color: arrowButtonListItem.labelFontColor

                        anchors {
                            left: navIcon.right
                            right: parent.right
                            verticalCenter: parent.verticalCenter
                            leftMargin: 20
                        }
                    }
                ]
            }
        }
    }

    GalleryExhibit {
            label: "Arrow Button List Item with secondarylabel, and Moreinfo"
            placard: "Displaying secondarylabel in the Arrow Button"
            Column {
                id: arrow_button_secondaryLabel
                width: parent.width
                HMIControls.ArrowButtonListItem {
                    labelText: "Ford"
                    secondaryLabelText: "secondaryLabelText"
                    hasMoreInfoOverride: true
                    width: parent.width
                }
            }
        }

        GalleryExhibit {
            label: "Arrow Button List Item with no status or secondary label, and Moreinfo"
            placard: "Displaying Arrowbutton with no textlabels"
            Column {
                id: arrow_button
                width: parent.width
                HMIControls.ArrowButtonListItem {
                    labelText: "Ford"
                    hasMoreInfoOverride: true
                    width: parent.width
                }
            }
        }

        GalleryExhibit {
            label: "Arrow Button List Item with textlabels, and Moreinfo"
            placard: "Displaying Arrowbutton with textlabels"
            Column {
                id: arrowbuttonTextLabels
                width: parent.width
                HMIControls.ArrowButtonListItem {
                    labelText: "Ford"
                    hasMoreInfoOverride: true
                    statusLabelText: "statusLabelText"
                    secondaryLabelText: "secondaryLabelText"
                    width: parent.width
                }
            }
        }


    //this combo box is placed at the bottom of the screen to show how it would behave when there is no room for the drop down
    GalleryExhibit {
        label: "Combo Box"
        placard: "Overrides the drop-down list items to display arrows"
        HMIControls.ComboBox {
            id: dropdown

            model: carModel
            width: itemWidth

            property int itemWidth: 380
            property int itemHeight: 50

            //this is just an example of a possible datamodel
            ListModel {
                id: carModel
                ListElement { itemText: "Fiesta" }
                ListElement { itemText: "Focus" }
                ListElement { itemText: "Fusion" }
                ListElement { itemText: "C-Max" }
                ListElement { itemText: "Mustang" }
                ListElement { itemText: "Taurus" }
                ListElement { itemText: "Escape" }
                ListElement { itemText: "Edge" }
            }

            //this is an example of how to override the list item components (not normally necessary)
            delegate: HMIControls.TextPushButton {
                id: dropDownItem
                width: dropdown.itemWidth
                height: dropdown.itemHeight
                isSelected: index === dropdown.currentIndex
                styleId: "listItemStyle"


                text: carModel ? carModel.get(index).itemText : index
                maximumLineCount: 1

                HMIControls.AssetItem {
                    id: icon
                    assetId: "arrowButtonRight"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                }

                onClicked: {
                    dropdown.currentIndex = index;
                    dropdown.popup.close();
                }
            }

            onCurrentTextChanged: {
                console.log(currentText)
            }

            onCurrentIndexChanged: {
                console.log(currentIndex)
            }
        }
    }
    GalleryExhibit {
        label: "Circular Gauge"
        placard: "A circular gauge with current max of 3600\nFull power output available"

        HMIControls.Gauge {
            id: fullGauge
            maxValue: 3600
            minValue: 0
            currentValue: 1000
            height: 300
            width: 300

            Timer {
                interval: 500
                repeat: true
                running: true
                onTriggered: fullGauge.currentValue = (fullGauge.currentValue + 100)
                             % fullGauge.currentLimit
            }

        }
    }
}
