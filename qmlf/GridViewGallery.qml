import QtQuick 2.6
import com.ford.hmicontrols 1.0 as HMIControls

Gallery {
    id: root

    property var carModel: [
        {"label":"Fiesta 1", "icon":"settingsVehicle"},
        {"label":"Focus 1", "icon":"settingsVehicle"},
        {"label":"Fusion 1", "icon":"settingsVehicle"},
        {"label":"C-Max 1", "icon":"settingsVehicle"},
        {"label":"Mustang 1", "icon":"settingsVehicle"},
        {"label":"Taurus 1", "icon":"settingsVehicle"},
        {"label":"Escape 1", "icon":"settingsVehicle"},
        {"label":"Edge 1", "icon":"settingsVehicle"},
        {"label":"Fiesta 2", "icon":"settingsVehicle"},
        {"label":"Focus 2", "icon":"settingsVehicle"},
        {"label":"Fusion 2", "icon":"settingsVehicle"},
        {"label":"C-Max 2", "icon":"settingsVehicle"},
        {"label":"Mustang 2", "icon":"settingsVehicle"},
        {"label":"Taurus 2", "icon":"settingsVehicle"},
        {"label":"Escape 2", "icon":"settingsVehicle"},
        {"label":"Edge 2", "icon":"settingsVehicle"},
        {"label":"Fiesta 3", "icon":"settingsVehicle"},
        {"label":"Focus 3", "icon":"settingsVehicle"},
        {"label":"Fusion 3", "icon":"settingsVehicle"},
        {"label":"C-Max 3", "icon":"settingsVehicle"},
        {"label":"Mustang 3", "icon":"settingsVehicle"},
        {"label":"Taurus 3", "icon":"settingsVehicle"},
        {"label":"Escape 3", "icon":"settingsVehicle"},
        {"label":"Edge 3", "icon":"settingsVehicle"},
        {"label":"Fiesta 4", "icon":"settingsVehicle"},
        {"label":"Focus 4", "icon":"settingsVehicle"},
        {"label":"Fusion 4", "icon":"settingsVehicle"},
        {"label":"C-Max 4", "icon":"settingsVehicle"},
        {"label":"Mustang 4", "icon":"settingsVehicle"},
        {"label":"Taurus 4", "icon":"settingsVehicle"},
        {"label":"Escape 4", "icon":"settingsVehicle"},
        {"label":"Edge 4", "icon":"settingsVehicle"},
        {"label":"Fiesta 5", "icon":"settingsVehicle"},
        {"label":"Focus 5", "icon":"settingsVehicle"},
        {"label":"Fusion 5", "icon":"settingsVehicle"},
        {"label":"C-Max 5", "icon":"settingsVehicle"},
        {"label":"Mustang 5", "icon":"settingsVehicle"},
        {"label":"Taurus 5", "icon":"settingsVehicle"},
        {"label":"Escape 5", "icon":"settingsVehicle"},
        {"label":"Edge 5", "icon":"settingsVehicle"},
        {"label":"Fiesta 6", "icon":"settingsVehicle"},
        {"label":"Focus 6", "icon":"settingsVehicle"},
        {"label":"Fusion 6", "icon":"settingsVehicle"},
        {"label":"C-Max 6", "icon":"settingsVehicle"},
        {"label":"Mustang 6", "icon":"settingsVehicle"},
        {"label":"Taurus 6", "icon":"settingsVehicle"},
        {"label":"Escape 6", "icon":"settingsVehicle"},
        {"label":"Edge 6", "icon":"settingsVehicle"}
    ]

    GalleryExhibit {
        label: "Adaptable Paged List"
        placard: "List that can change types between\ngrid and list view using the same model."
        HMIControls.ListViewControl {
            id: carListView3
            model: carModel
            width: 700
            height: 400
            orientation: Qt.Horizontal
            hasScrollBar: false
            splitIntoPages: true
            listType: HMIControls.ListViewHelper.Type_Grid
            clip: true

            onListItemClicked: {
                console.log("List item clicked: " + index)
            }
        }
    }

    Row {
        HMIControls.TextPushButton {
            styleId: "IconButtonStyle"
            text: "Previous Page"
            width: 200
            height: 80
            onClicked: carListView3.pageController.previousPage()
        }

        Item {
            width: 20
            height: width
        }

        HMIControls.TextPushButton {
            styleId: "IconButtonStyle"
            text: "Next Page"
            width: 200
            height: 80
            onClicked: carListView3.pageController.nextPage()
        }

        Item {
            width: 20
            height: width
        }

        HMIControls.TextPushButton {
            styleId: "IconButtonStyle"
            text: "Switch Grid/List"
            width: 200
            height: 80
            onClicked: carListView3.listType = !carListView3.listType
        }

        Item {
            width: 20
            height: width
        }

        HMIControls.TextPushButton {
            styleId: "IconButtonStyle"
            text: "Switch Direction"
            width: 200
            height: 80
            onClicked: carListView3.orientation = (carListView3.orientation === Qt.Horizontal) ? Qt.Vertical : Qt.Horizontal
        }
    }

    GalleryExhibit {
        label: "Paged Horizontal Grid"
        placard: ""

        HMIControls.ListViewControl {
            id: carListView
            model: carModel
            width: 700
            height: 400
            rows: 2
            columns: 4
            orientation: Qt.Horizontal
            hasScrollBar: false
            splitIntoPages: true
            listType: HMIControls.ListViewHelper.Type_Grid
            clip: true            

            onListItemClicked: {
                console.log("List item clicked: " + index)
            }
        }
    }

    Row {
        HMIControls.TextPushButton {
            styleId: "IconButtonStyle"
            text: "Previous Page"
            width: 200
            height: 80
            onClicked: carListView.pageController.previousPage()
        }

        Item {
            width: 20
            height: width
        }

        HMIControls.TextPushButton {
            styleId: "IconButtonStyle"
            text: "Next Page"
            width: 200
            height: 80
            onClicked: carListView.pageController.nextPage()
        }
    }

    GalleryExhibit {
        label: "Driving Restricted Horizontal Grid"
        placard: ""     
        HMIControls.ListViewControl {
            id: carRestrictedListView
            model: carModel
            width: 700
            height: 400
            rows: 2
            columns: 4
            orientation: Qt.Horizontal
            hasScrollBar: false
            splitIntoPages: true
            listType: HMIControls.ListViewHelper.Type_Grid
            clip: true
            restricted: true
            restrictedPageLimit: 3

            onListItemClicked: {
                console.log("List item clicked: " + index)
            }
        }
    }

    Row {
        HMIControls.TextPushButton {
            styleId: "IconButtonStyle"
            text: "Previous Page"
            width: 200
            height: 80
            onClicked: carListView.pageController.previousPage()
        }

        Item {
            width: 20
            height: width
        }

        HMIControls.TextPushButton {
            styleId: "IconButtonStyle"
            text: "Next Page"
            width: 200
            height: 80
            onClicked: carListView.pageController.nextPage()
        }
        Item {
            width: 20
            height: width
        }
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
        label: "Paged Vertical Grid"
        placard: ""
        HMIControls.ListViewControl {
            id: carListView2
            model: carModel
            width: 700
            height: 400
            orientation: Qt.Vertical
            hasScrollBar: false
            splitIntoPages: true
            listType: HMIControls.ListViewHelper.Type_Grid
            rows: 2
            columns: 4
            clip: true

            onListItemClicked: {
                console.log("List item clicked: " + index)
            }
        }
    }

    Row {
        HMIControls.TextPushButton {
            styleId: "IconButtonStyle"
            text: "Previous Page"
            width: 200
            height: 80
            onClicked: carListView2.pageController.previousPage()
        }

        Item {
            width: 20
            height: width
        }

        HMIControls.TextPushButton {
            styleId: "IconButtonStyle"
            text: "Next Page"
            width: 200
            height: 80
            onClicked: carListView2.pageController.nextPage()
        }
    }

    GalleryExhibit {
        label: "Grid with Custom Animations"
        placard: ""
        HMIControls.ListViewControl {
            id: carListView4
            model: carModel
            width: 700
            height: 400
            orientation: Qt.Horizontal
            hasScrollBar: false
            splitIntoPages: true
            listType: HMIControls.ListViewHelper.Type_Grid
            clip: true

            onListItemClicked: {
                console.log("List item clicked: " + index)
            }

            pageController.horizontalTransition: NumberAnimation {
                easing.type: Easing.InBack
                duration: 700
            }

            pageController.verticalTransition: NumberAnimation {
                easing.type: Easing.OutBounce
                duration: 700
            }
        }
    }

    Row {
        HMIControls.TextPushButton {
            styleId: "IconButtonStyle"
            text: "Previous Page"
            width: 200
            height: 80
            onClicked: carListView4.pageController.previousPage()
        }

        Item {
            width: 20
            height: width
        }

        HMIControls.TextPushButton {
            styleId: "IconButtonStyle"
            text: "Next Page"
            width: 200
            height: 80
            onClicked: carListView4.pageController.nextPage()
        }

        Item {
            width: 20
            height: width
        }

        HMIControls.TextPushButton {
            styleId: "IconButtonStyle"
            text: "Switch Direction"
            width: 200
            height: 80
            onClicked: carListView4.orientation = (carListView4.orientation === Qt.Horizontal) ? Qt.Vertical : Qt.Horizontal
        }

        Item {
            width: 20
            height: width
        }

        HMIControls.TextPushButton {
            styleId: "IconButtonStyle"
            text: "Enable/Disable Debug"
            width: 200
            height: 80
            onClicked: carListView4.isDebug = !carListView4.isDebug
        }
    }


}
