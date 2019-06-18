import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick 2.0

Item{
    id: root

    /**
     * @property alternativeRoutesRequest - routing request from search details screen
     */
    property var alternativeRoutesRequest

    /**
     * @property alternativeRoutesRoutingFlow - routing flow from search details screen
     */
    property var alternativeRoutesRoutingFlow

    /**
     * @property locationProvider - provider for location and heading
     */
    property var locationProvider

    property var destination

    property bool isShownByVR: false

    property bool isAvoidOnRouteView

    property bool activeBusyIndicator: true
    property bool compassVisible

    property bool preHighwayState: false
    property bool preTollRoadState: false
    property bool preTunnelsState: false
    property bool preCountryBorderState: false
    property bool preFerryState: false

    property bool fullScreenMap: false

    // property alias mapItem: mapView

    signal backButtonActivated();
    signal avoidOnRouteButtonActivated();
    signal startButtonClicked(var route);
    signal expandMapActivated(bool isExpand)

    state:   "ready"

    //    states:[
    //        State {
    //            name: "initializing"
    //            when: mapView.mapViewState !== MapView.READY || root.alternativeRoutesRoutingFlow.resultState !== RoutingFlow.AVAILABLE
    //        },
    //        State {
    //            name: "ready"
    //            when: mapView.mapViewState === MapView.READY && root.alternativeRoutesRoutingFlow.resultState === RoutingFlow.AVAILABLE
    //        }
    //    ]

    onStateChanged: {
        if(state === "ready") {
            root.activeBusyIndicator = false;
            //            alternativeRoutesList.selectedIndex = 0;
            //            alternativeRoutesList.routeListModel = root.alternativeRoutesRoutingFlow.routes;

            //            mapView.overviewRoutes = root.alternativeRoutesRoutingFlow.routes;
            //            root.highlightRoute();
            //            mapView.regionType = MapView.REGION_WITH_ROUTES;
            //            if (root.destination &&
            //                root.destination.isValid &&
            //                root.destination.place.isValid) {
            //                mapView.destinations = [root.destination];
            //            }

            //            routeBubbles.selectedRoute = alternativeRoutesList.routeListModel[alternativeRoutesList.selectedIndex];
            //            checkAvoidList();
        }
    }


    Item {
        id: layout

        anchors.fill: parent

        property real mapUsableAreaTopMargin
        property real mapUsableAreaBottomMargin
        property real mapUsableAreaLeftMargin
        property real mapUsableAreaRightMargin




        //        ScaleBar {
        //            id: scaleBar
        //            visible: true
        //            objectName: "mapViewScaleBar"

        //            anchors {
        //                bottom: parent.bottom
        //                right: parent.right
        //            }
        //        }
        Rectangle {
            id: root1
            anchors{
            top:parent.top
            left:parent.left
            }
            Button {
                id: titleBar
                Image {
                    id: name
                      source: "qrc:qmlf/8inch/back.png"
                }
                anchors.right:parent.right
                anchors.left: root1.right
                anchors.rightMargin: 60
                objectName: "titleBar"
                anchors.fill: parent
               // text:"Routes"
            }


            Button {
                id: avoidOnRouteButton
                objectName: "avoidOnRouteButton"
                anchors {
                    top: parent.top
                    right: parent.right
                }
                visible:true

            }
        }



        Button {
            id: collapseMapButton
            anchors {
                top: parent.top
                right: parent.right
            }
            objectName: "collapseButton"
            visible: root.fullScreenMap && PlatformController.screenType === PlatformController.INCH_12

            onClicked: {
                root.expandMapActivated(false);
            }
        }


        ListModel {
            id:listModelofPoi
            ListElement { place:"Home"; details: "Set up and ge  there form anywhere"; distance:"3.3mi"}
            ListElement { place:"KFC"; details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"Amarican"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"China"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
            ListElement { place:"Crian";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "5.4mi" }
            ListElement { place:"Srtgf";details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
            ListElement { place:"Dlalihne";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"Uk"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"Home"; details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
            ListElement { place:"KFC"; details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"Amarican"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"China"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
            ListElement { place:"Crian";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "5.4mi" }
            ListElement { place:"Srtgf";details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
            ListElement { place:"Dlalihne";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"Uk"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"Home"; details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
            ListElement { place:"KFC"; details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"Amarican"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"China"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
            ListElement { place:"Crian";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "5.4mi" }
            ListElement { place:"Srtgf";details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
            ListElement { place:"Dlalihne";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"Uk"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"Home"; details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
            ListElement { place:"KFC"; details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"Amarican"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"China"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
            ListElement { place:"Crian";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "5.4mi" }
            ListElement { place:"Srtgf";details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
            ListElement { place:"Dlalihne";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"Uk"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"Home"; details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
            ListElement { place:"KFC"; details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"Amarican"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"China"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
            ListElement { place:"Crian";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "5.4mi" }
            ListElement { place:"Srtgf";details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
            ListElement { place:"Dlalihne";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"Uk"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"Home"; details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
            ListElement { place:"KFC"; details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"Amarican"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"China"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
            ListElement { place:"Crian";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "5.4mi" }
            ListElement { place:"Srtgf";details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
            ListElement { place:"Dlalihne";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"Uk"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"Home"; details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
            ListElement { place:"KFC"; details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"Amarican"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"China"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
            ListElement { place:"Crian";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "5.4mi" }
            ListElement { place:"Srtgf";details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
            ListElement { place:"Dlalihne";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"Uk"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"Home"; details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
            ListElement { place:"KFC"; details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"Amarican"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"China"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
            ListElement { place:"Crian";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "5.4mi" }
            ListElement { place:"Srtgf";details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
            ListElement { place:"Dlalihne";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"Uk"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"Home"; details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
            ListElement { place:"KFC"; details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"Amarican"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"China"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
            ListElement { place:"Crian";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "5.4mi" }
            ListElement { place:"Srtgf";details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
            ListElement { place:"Dlalihne";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"Uk"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"China"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
            ListElement { place:"Crian";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "5.4mi" }
            ListElement { place:"Srtgf";details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
            ListElement { place:"Dlalihne";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"Uk"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"Home"; details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
            ListElement { place:"KFC"; details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"Amarican"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"China"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
            ListElement { place:"Crian";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "5.4mi" }
            ListElement { place:"Srtgf";details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
            ListElement { place:"Dlalihne";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"Uk"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"China"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
            ListElement { place:"Crian";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "5.4mi" }
            ListElement { place:"Srtgf";details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
            ListElement { place:"Dlalihne";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"Uk"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"Home"; details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
            ListElement { place:"KFC"; details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"Amarican"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"China"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
            ListElement { place:"Crian";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "5.4mi" }
            ListElement { place:"Srtgf";details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
            ListElement { place:"Dlalihne";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"Uk"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"China"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
            ListElement { place:"Crian";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "5.4mi" }
            ListElement { place:"Srtgf";details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
        }
        Component {
            id: contactDelegate

            Rectangle{
                border.width: 1
                border.color: "gray"
                height:60
                Text {
                    width:100
                    height:50

                    text: place
                    font.pixelSize: 20
                    MouseArea{
                        cursorShape: Qt.IBeamCursor
                        anchors.fill: parent
                        enabled: false
                    }
                }
                Text {
                    id: lablemile
                    text:distance
                    anchors.left: parent.left
                    anchors.leftMargin: 300
                    font.pixelSize: 12

                }
            }
        }
        QtAlternativeRoutesList {
            id: alternativeRoutesList
            objectName: "tnAlternativeRouteList"

            anchors.top : parent.top
            anchors.left: parent.left
            visible: true
            routeListModel: listModelofPoi
            width:400
            height: 500
            routeListDelegate:  contactDelegate
            Loader {
                id: busyPopupLoader
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                    verticalCenterOffset: 0
                }
                sourceComponent: loadingIndicator
                active: activeBusyIndicator
            }

            Component {
                id: loadingIndicator
                BusyIndicator {
                    objectName: "loadingIndicator"
                    height: 54
                    width: 54
                }

            }
        }


        Rectangle{
            anchors {
                bottom: alternativeRoutesList.bottom
                left: parent.left
                right: alternativeRoutesList.right
            }
            Button{
                id: button
                Text {
                    id: goButtonTextId
                    objectName: "goButtonText"
                    font.pixelSize: 16

                    text: "Start"
                }

            }
        }


        Rectangle {
            id: mapViewBackground
            objectName: "mapViewBackground"
            anchors{
                left:alternativeRoutesList.right
                top:alternativeRoutesList.top
            }
            Image {
                id: pic

                //   anchors.top: rootRect.top
                source: "qrc:qmlf/8inch/map.png"
            }
        }


    }
}
