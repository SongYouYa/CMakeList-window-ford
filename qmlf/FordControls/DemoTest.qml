import QtQuick 2.12
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.0
import com.ford.hmicontrols 1.0 as FHC


FHC.ListViewControl {
    id: carListView
    model: 12
    anchors.fill: parent
    anchors.margins: 100
    spacing: 10
    clip: true
   // orientation:ListView.Horizontal

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
    }

    onListItemClicked: {
        console.log("List item clicked: " + index)
    }
}
