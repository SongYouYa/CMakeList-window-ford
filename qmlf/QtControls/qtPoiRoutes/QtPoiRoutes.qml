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
            ListElement { place:"HomeKFC 12653 mICHIGAN Ave,Dern"; details: "Set up and ge  there form anywhere"; distance:"3.3mi"}
            ListElement { place:"KFC653 mICHIGAN Ave"; details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"Amarican653 mICHIGAN Ave"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"5712 Michigan Ave,Dearborn"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
            ListElement { place:"Cria653 mICHIGAN Aven";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "5.4mi" }
            ListElement { place:"Srtgf5712 Michigan Ave,Dearborn";details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
            ListElement { place:"Dlalihne653 mICHIGAN Ave";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"UkAve,Dearborn,MI 453"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"HomKFC653 mICHIGAN Avee"; details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
            ListElement { place:"KFCAve,Dearborn,MI 453"; details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"Amarican"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"ChKFC653 mICHIGAN Aveina"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
            ListElement { place:"CrKFC653 mICHIGAN Aveian";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "5.4mi" }
            ListElement { place:"SrKFC653 mICHIGAN Avetgf";details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
            ListElement { place:"Dlalihne";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"UKFC653 mICHIGAN Avek"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"HoKFC653 mICHIGAN Aveme"; details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
            ListElement { place:"KFKFC653 mICHIGAN AveC"; details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"AKFC653 mICHIGAN Avemarican"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"ChKFC653 mICHIGAN Aveina"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
            ListElement { place:"CrianKFC653 mICHIGAN Ave";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "5.4mi" }
            ListElement { place:"SrtgfKFC653 mICHIGAN Ave";details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
            ListElement { place:"DlalihneKFC653 mICHIGAN Ave";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"Uk"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"KFC653 mICHIGAN AveHome"; details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
            ListElement { place:"KFC653 mICHIGAN AveKFC"; details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
            ListElement { place:"AmarKFC653 mICHIGAN Aveican"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
            ListElement { place:"ChinaKFC653 mICHIGAN Ave"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
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
                    anchors.leftMargin: 340
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

        }


        Rectangle{
            id:bottomButton
            color: "blue"
            width:200
            height:60
            radius: 10
            anchors {
                bottom: alternativeRoutesList.bottom
                bottomMargin: 65
                left: parent.left
                right: alternativeRoutesList.right
            }
            Rectangle{
                id: button
                color:"green"
                anchors.left: bottomButton.left
                anchors.leftMargin: 9
                Text {
                    id: buttonName
                    text: qsTr("Start")
                     font.pixelSize: 20
                     color:"white"
                }
            }

            Text {
                id: goButtonTextId
                objectName: "goButtonText"
                font.pixelSize: 16
                color: "white"
                anchors.left: button.right
                anchors.leftMargin:320
                text: "1.2mi"
            }


            BusyIndicator {
                id: loadingIndicator
                objectName: "loadingIndicator"

                anchors {
                    verticalCenter: parent.verticalCenter
                    left: button.left
                    leftMargin: 300
                }

                visible: true
            }
        }



        Rectangle {
            id: mapViewBackground
            objectName: "mapViewBackground"
            anchors{
                left:alternativeRoutesList.right
                leftMargin: 2
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
