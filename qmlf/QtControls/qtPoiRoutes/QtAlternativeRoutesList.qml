
import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick 2.0

Item {
    id: root

    property alias routeListModel: alternativeRoutesList.model
    property alias routeListDelegate: alternativeRoutesList.delegate
    property int selectedIndex: 0

    property string currentRouteEte
    Flickable {
        anchors.fill: parent
        contentWidth: parent.width * 2
        contentHeight: parent.height * 2

        //               ScrollBar.horizontal: ScrollBar { id: hbar; active: vbar.active }
        //               ScrollBar.vertical: ScrollBar { id: vbar; active: hbar.active }
        ScrollView{
            ScrollBar.vertical.policy: ScrollBar.AlwaysOn
            ListView {
                id: alternativeRoutesList
                objectName: "alternativeRoutesList"
                anchors {
                    top: parent.top
                    left: parent.left
                }
                height: parent.height
                highlight: Rectangle{
                    color: "lightsteelblue";
                    radius: 3;
                }
                highlightFollowsCurrentItem: true;
                focus: true;


                onCurrentItemChanged: currentRouteEte = currentItem.ete
                ScrollBar {
                    id: scrollBar
                    objectName: "scrollBar"
                    hoverEnabled: true
                    active: true
                    orientation: Qt.Vertical
                    size: frame.height / content.height
                    anchors.top: parent.top
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                }

                //    onSelectedIndexChanged: {
                //        if(alternativeRoutesList.currentIndex !== selectedIndex) {
                //            alternativeRoutesList.currentIndex = selectedIndex
                //        }
                //    }

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
        }
    }
}
