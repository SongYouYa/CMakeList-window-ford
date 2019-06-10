import QtQuick 2.6
import com.ford.hmicontrols 1.0 as HMIControls

Item {

    anchors.fill: parent
    property var carModel: [
        {"label":"Focus 6", "icon":"qrc:8inch/icon-call-disable.png"},
        {"label":"Fusion 6", "icon":"settingsVehicle"},
        {"label":"C-Max 6", "icon":"settingsVehicle"},
        {"label":"Mustang 6", "icon":"settingsVehicle"},
        {"label":"Taurus 6", "icon":"settingsVehicle"},
        {"label":"Escape 6", "icon":"settingsVehicle"},
        {"label":"Edge 6", "icon":"settingsVehicle"},
        {"label":"Focus 6", "icon":"settingsVehicle"},
        {"label":"Fusion 6", "icon":"settingsVehicle"},
        {"label":"C-Max 6", "icon":"settingsVehicle"},
        {"label":"Mustang 6", "icon":"settingsVehicle"},
        {"label":"Taurus 6", "icon":"settingsVehicle"},
        {"label":"Escape 6", "icon":"settingsVehicle"},
        {"label":"Edge 6", "icon":"settingsVehicle"},
        {"label":"Focus 6", "icon":"settingsVehicle"},
        {"label":"Fusion 6", "icon":"settingsVehicle"},
        {"label":"C-Max 6", "icon":"settingsVehicle"},
        {"label":"Mustang 6", "icon":"settingsVehicle"},
        {"label":"Taurus 6", "icon":"settingsVehicle"},
        {"label":"Escape 6", "icon":"settingsVehicle"},
        {"label":"Focus 6", "icon":"settingsVehicle"},
        {"label":"Fusion 6", "icon":"settingsVehicle"},
        {"label":"C-Max 6", "icon":"settingsVehicle"},
        {"label":"Mustang 6", "icon":"settingsVehicle"},
        {"label":"Taurus 6", "icon":"settingsVehicle"},
        {"label":"Escape 6", "icon":"settingsVehicle"},
        {"label":"Edge 6", "icon":"settingsVehicle"},
        {"label":"Focus 6", "icon":"settingsVehicle"},
        {"label":"Fusion 6", "icon":"settingsVehicle"},
        {"label":"C-Max 6", "icon":"settingsVehicle"},
        {"label":"Mustang 6", "icon":"settingsVehicle"},
        {"label":"Taurus 6", "icon":"settingsVehicle"},
        {"label":"Escape 6", "icon":"settingsVehicle"},
        {"label":"Focus 6", "icon":"settingsVehicle"},
        {"label":"Fusion 6", "icon":"settingsVehicle"},
        {"label":"C-Max 6", "icon":"settingsVehicle"},
        {"label":"Mustang 6", "icon":"settingsVehicle"},
        {"label":"Taurus 6", "icon":"settingsVehicle"},
        {"label":"Escape 6", "icon":"settingsVehicle"},
        {"label":"Edge 6", "icon":"settingsVehicle"},
        {"label":"Focus 6", "icon":"settingsVehicle"},
        {"label":"Fusion 6", "icon":"settingsVehicle"},
        {"label":"C-Max 6", "icon":"settingsVehicle"},
        {"label":"Mustang 6", "icon":"settingsVehicle"},
        {"label":"Taurus 6", "icon":"settingsVehicle"},
        {"label":"Escape 6", "icon":"settingsVehicle"},
        {"label":"Edge 6", "icon":"settingsVehicle"}
    ]

        HMIControls.ListViewControl {
            id: carListView
            orientation: Qt.Horizontal
             hasScrollBar: false
            model: carModel
            width: parent.width
            height: 400
            rows: 2
              listType: HMIControls.ListViewHelper.Type_Grid

//            listItemHeight: 100
            clip: true
            //this is just an example of a possible datamodel


        }

            Item {
                width: 20
                height: width
            }

}
