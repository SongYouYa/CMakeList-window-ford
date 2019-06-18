import QtQuick 2.7
import com.ford.hmicontrols 1.0 as FHC
//import QtArp 1.0
//import "../shared"

FHC.Layout {
    id: root
    layoutId: "tnAlternativeRoutesListLayout"

    property alias routeListModel: alternativeRoutesList.model
    property int selectedIndex: 0

    property string currentRouteEte

    ListView {
        id: alternativeRoutesList
        objectName: "alternativeRoutesList"
        anchors {
            top: parent.top
            left: parent.left
        }
        height: parent.height

        delegate: AlternativeRouteItem {
            isSelected: root.selectedIndex === index
            resultName: "modelData.summary.mainStreet"
//          TODO: add route details when available in backend routeInfo: model.resDet
            routeInfo: "via Michigan Ave"
            resultDistance: 1.2

            ArpEteFormatter {
                id: eteFormatter
                minutesTranslation: "KIPcommonEteUnitMin"
                hoursTranslation: "KIPcommonEteUnitHour"
                daysTranslation: "KIPcommonEteUnitDay"
                eteFormat: "1 mi"
                eteDurationObject: modelData.summary.ete
            }
            ete: "4min"

            onItemActivated: {
                if (root.selectedIndex != index) {
                    root.selectedIndex = index;
                    currentRouteEte = ete;
                }
            }
            Component.onCompleted: {
                if (root.selectedIndex === index) {
                    currentRouteEte = ete;
                }
            }
        }
        onCurrentItemChanged: currentRouteEte = currentItem.ete
    }

    FHC.ScrollBar {
        id: scrollBar
        objectName: "scrollBar"
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
        }
        visible: alternativeRoutesList.visibleArea.heightRatio < 1
        view: alternativeRoutesList
    }

    onSelectedIndexChanged: {
        if(alternativeRoutesList.currentIndex !== selectedIndex) {
            alternativeRoutesList.currentIndex = selectedIndex
        }
    }

    function getRouteInfo(index)
    {
        var routeInfoString = "";
        var characteristics = routeListModel[index].characteristics;
        if (characteristics === undefined) {
            return "";
        }

        for (var i = 0; i < characteristics.length; ++i) {
            if (characteristics[i] == RoutingTypes.HAS_NATIONAL_BORDER) {
                routeInfoString += translatedStrings["KIPRoutesCountryBorder"];
            }
        }
        return routeInfoString;
    }
}
