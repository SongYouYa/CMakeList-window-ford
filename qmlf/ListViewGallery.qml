import QtQuick 2.6
import com.ford.hmicontrols 1.0 as HMIControls

Gallery {
    id: root

    GalleryExhibit {
        id: carListViewExhibit
        label: "Standard ListView"
        placard: "Uses a list data model"
        HMIControls.ListViewControl {
            id: carListView
            model: carModel
            width: 700
            height: 320
            rows: 4

//            listItemHeight: 100
            clip: true
            //this is just an example of a possible datamodel
            ListModel {
                id: carModel
                ListElement { label: "Fiesta 1" }
                ListElement { label: "Focus 1" }
                ListElement { label: "Fusion 1" }
                ListElement { label: "C-Max 1" }
                ListElement { label: "Mustang 2" }
                ListElement { label: "Taurus 2" }
                ListElement { label: "Escape 2" }
                ListElement { label: "Edge 2" }

                ListElement { label: "Fiesta 3" }
                ListElement { label: "Focus 3" }
                ListElement { label: "Fusion 3" }
                ListElement { label: "C-Max 3" }
                ListElement { label: "Mustang 4" }
                ListElement { label: "Taurus 4" }
                ListElement { label: "Escape 4" }
                ListElement { label: "Edge 4" }

                ListElement { label: "Fiesta 5" }
                ListElement { label: "Focus 5" }
                ListElement { label: "Fusion 5" }
                ListElement { label: "C-Max 5" }
                ListElement { label: "Mustang 6" }
                ListElement { label: "Taurus 6" }
                ListElement { label: "Escape 6" }
                ListElement { label: "Edge 6" }

                ListElement { label: "Fiesta 7" }
                ListElement { label: "Focus 7" }
                ListElement { label: "Fusion 7" }
                ListElement { label: "C-Max 7" }
                ListElement { label: "Mustang 8" }
                ListElement { label: "Taurus 8" }
               ListElement { label: "Escape 8" }
               ListElement { label: "Edge 8" }


            }

            onListItemClicked: {
                console.log("List item clicked: " + index)
            }
        }
    }

    GalleryExhibit {
        id: drivingRestrictionListViewExhibit
        label: "Driving Restricition ListView"
        placard: "Driving restricted List view upto 3 pages limit"

        HMIControls.ListViewControl {
            id: carRestrictedListView
            model: carModel
            width: 700
            height: 320
            rows: 4
            clip: true
            restricted: true

            //Set restrictedPageLimit property for telling the limit the no of pages during DrivingRestriction
            restrictedPageLimit: 3

            onListItemClicked: {
                console.log("List item clicked: " + index)
            }

            onRestrictionStateTriggered: {
                console.log("Restriction State Trigger " + restrictionState)
            }
        }
    }

    GalleryExhibit {
        placard: "Button to Enable/Disable Restriction for above control"
        HMIControls.IconTextPushButton {
            id: btn1
            text: carRestrictedListView.restricted ? "Disable Restriction" : "Enable Restriction"
            width: 200
            height: 80
            onClicked: {
                carRestrictedListView.restricted = !carRestrictedListView.restricted
            }
        }
    }


    GalleryExhibit {
        id: alphabeticalOrderList
        label: "Alphabetical Order ListView"
        placard: "Current model has been sorted alphabetically by setting property nameRoletoSort with roleName ('label' for current model) and enabling property stringSortEnable"

        HMIControls.ListViewControl {
            id: alphabeticalListView
            model: carModel
            width: 700
            height: 320
            rows: 4
            clip: true
            roleName: "label"
            stringSortEnabled: true
            onListItemClicked: {
                console.log("List item clicked: " + index)
            }
        }
    }


    GalleryExhibit {
        label: "Customized ListView"
        placard: "Overrides appearance of listItemComponent"
        HMIControls.ListViewControl {
            id: listViewTrucks

            //an example of how to set the dataModel directly, not using the listDataModel
            model: ["Explorer", "Expedition", "F-150", "Super Duty", "Transit Connect", "Ecosport"]
            clip: true
            width: 700
            height: 320
            rows: 3
//            listItemHeight: 100

            //an example of how to override the default delegate, supplying custom QML layout

            delegate: HMIControls.IconTextPushButton {
                width: listViewTrucks.width
                height: 40
//                height: listViewTrucks.listItemHeight
                textStyle: "inverseColorTextStyle"
                textMaximumLineCount: 1
                text: modelData
                iconAssetId: "iconMenu"
                backgroundAssetId: "dropDownItem"
                iconPositionHorizontal: "right"
                iconPositionVertical: "center"
                onClicked: {
                    console.log("Custom item selected: " + index)
                }
            }
        }
    }
}
