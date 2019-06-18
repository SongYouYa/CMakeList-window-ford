import QtQuick 2.7
import com.ford.hmicontrols 1.0 as FHC
//import QtArp 1.0
//import navHmi 1.0

FHC.Layout {
    id: routeItem
    layoutId: "tnAlternativeRouteItemLayout"

    property string resultName
    property string routeInfo: ""
    /**@property trafficInfo - Show traffic info of route
      * If traffic in setting is off, the trafficInfo will be empty. If traffic is on, there will show "Light Traffic" or "Heavy Traffic".
      * TODO: when traffic is on, need to get the traffic info of route
      */
    property string trafficInfo: ""
    property real resultDistance
    property string ete
    property bool isSelected: false
    property int heightWithoutRouteDetail
    property int nameLabelBigTopMargin
    property int nameLabelNormalTopMargin
    property int routeInfoLabelLoaderTopMargin

    signal itemActivated()

    height: (routeInfo !== "" && routeItem.isSelected) ? (trafficInfo !== "" ? heightWithoutRouteDetail + routeInfoLabelLoader.height + routeInfoLabelLoaderTopMargin
                                                                             : heightWithoutRouteDetail + routeInfoLabelLoader.height - trafficLabelLoader.height)
                                                       : heightWithoutRouteDetail

    MouseArea {
        anchors.fill: parent
        onClicked:  {
            routeItem.itemActivated();
        }
    }

    FHC.Text {
        id: nameLabel
        objectName: "nameLabel"
        anchors {
            top: parent.top
            left: parent.left
            right: (trafficInfo === "" && routeInfo === "") ? (distance.width > eteLabel.width ? distance.left
                                                                                               : eteLabel.left)
                                                            : distance.left
            topMargin: (trafficInfo === "" && routeInfo === "") ? (lineCount > 1 ? nameLabelNormalTopMargin : nameLabelBigTopMargin) : nameLabelNormalTopMargin
        }
        text: translatedStrings["KIPPOIRoutesVia"].arg(resultName);
        styleId: routeItem.isSelected ? "tnAlternativeRoutesInfoTextSelectedStyle" : "BaseTextStyle"
    }

    FHC.Text {
        id: distance
        objectName: "distance"
        text: distanceFormat.formattedDistance
        anchors {
            top: parent.top
            right: parent.right
        }
        width: text.width
        styleId: routeItem.isSelected ? "tnAlternativeRoutesDistanceSelectStyle" : "tnAlternativeRoutesDistanceStyle"

//        DistanceConversion {
//            id : distanceFormat

//            useFordRoundRule: false
//            kilometersTranslation: "%1 " + ((QtArp.localizationManager.measurementUnit === DistanceFormatter.METRIC)? translatedStrings["KIPcommonDistanceUnitKm"] : translatedStrings["KIPcommonDistanceUnitMi"])
//            metersTranslation: "%1 " + ((QtArp.localizationManager.measurementUnit === DistanceFormatter.METRIC)? translatedStrings["KIPcommonDistanceUnitM"] : translatedStrings["KIPcommonDistanceUnitFt"])
//            format: QtArp.localizationManager.measurementUnit
//            distanceInMeters: resultDistance
//        }
    }

    Loader {
        id: trafficLabelLoader
        objectName: "trafficLabel"
        anchors {
            top: nameLabel.bottom
            left: parent.left
            right: nameLabel.lineCount > 1 ? parent.right : eteLabel.left
        }
        active: trafficInfo !== ""
        sourceComponent: FHC.Text {
            text: trafficInfo
            styleId: routeItem.isSelected ? "tnAlternativeRoutesInfoTextSelectedStyle" : "BaseTextStyle"
        }
    }

    FHC.Text{
        id: eteLabel
        objectName: "eteLabel"
        text: ete
        anchors {
            top: distance.bottom
            right: parent.right
        }
        width: text.width
        styleId: routeItem.isSelected ? "tnAlternativeRoutesEteTextSelectedStyle" : "tnAlternativeRoutesEteTextStyle"
    }

    Loader {
        id: routeInfoLabelLoader
        objectName: "routeInfoLabelLoader"
        anchors {
            left: parent.left
            right: trafficInfo === "" ? eteLabel.left : parent.right
            top: trafficInfo === "" ? nameLabel.bottom : trafficLabelLoader.bottom
        }
        active: routeItem.isSelected && routeInfo !== ""
        sourceComponent: FHC.Text {
            styleId: routeItem.isSelected ? "tnAlternativeRoutesInfoTextSelectedStyle" : "BaseTextStyle"
            text: routeInfo
        }
    }

    FHC.AssetItem {
        id: separator
        objectName: "separator"
        assetId: "tnListDivider"
        anchors.bottom: parent.bottom
        anchors.left: parent.left
    }
}
