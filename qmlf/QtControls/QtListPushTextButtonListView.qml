import QtQuick 2.12

import com.ford.hmicontrols 1.0 as FHC

FHC.Layout
{
FHC.ListViewControl {
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
