import QtQuick 2.7
//import QtArp 1.0
import com.ford.hmicontrols 1.0 as FHC

//import "../shared"

FHC.Layout {
    id: root
    layoutId: "tnAvoidOnRouteListLayout"
    property int listDelegateWidth
    property int listDelegateHeight
    property int listDelegateLeftMargin

    ListModel {
        id: listModel
        ListElement { avoidItemName: "HighwaysChkbx"}
        ListElement { avoidItemName: "TollsChkbx"}
        ListElement { avoidItemName: "TunnelsChkbx"}
        ListElement { avoidItemName: "BordersChkbx"}
        ListElement { avoidItemName: "FerriesChkbx"}
    }

    ListView {
        id: selectList
        anchors.fill: parent
        model: listModel

        delegate: CheckBoxButtonWithHDivider {
            width: 100
            height: 50
            anchors {
                left: parent.left
                leftMargin: root.listDelegateLeftMargin
            }

            styleId: "tnAvoidOnRouteListCheckItemStyle"
            backgroundAssetId: ""
            text: "KIPavoid"
            isSelected: checkInitialState(index)

            onIsSelectedChanged: {
                setAvoidRouteType(index, isSelected);
            }
        }
    }

    FHC.AssetItem {
        id: fadeoutBar
        objectName: "fadeoutBar"
        anchors {
            left: parent.left
            bottom: parent.bottom
        }
    }

    function checkInitialState(index)
    {
        switch(index)
        {
//        case 0:
//            return  SettingsModel.avoidHighways;
//        case 1:
//            return SettingsModel.avoidTollRoads;
//        case 2:
//            return SettingsModel.avoidTunnels;
//        case 3:
//            return SettingsModel.avoidCountryBorders;
//        case 4:
//            return SettingsModel.avoidFerries;
        default:
            return false;
        }
    }

    function setAvoidRouteType(index, state)
    {
        switch(index)
        {
        case 0:
            SettingsModel.avoidHighways = state;
            break;
        case 1:
            SettingsModel.avoidTollRoads = state;
            break;
        case 2:
            SettingsModel.avoidTunnels = state;
            break;
        case 3:
            SettingsModel.avoidCountryBorders = state;
            break;
        case 4:
            SettingsModel.avoidFerries = state;
            break;
        default:
            break;
        }
    }

}
