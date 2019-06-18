import QtQuick 2.7
//import QtArp 1.0
//import navHmi 1.0

import com.ford.hmicontrols 1.0 as FHC
//import "../shared"

FHC.Layout {
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

    FHC.StyleHelper {
        id: mapStyleHelper
        styleId: "tnAlternativeRoutesStyle"
    }

    FHC.Layout {
        id: layout
        layoutId: "tnAlternativeRoutesLayout"
        anchors.fill: parent

        property real mapUsableAreaTopMargin
        property real mapUsableAreaBottomMargin
        property real mapUsableAreaLeftMargin
        property real mapUsableAreaRightMargin

        Rectangle {
            id: mapViewBackground
            objectName: "mapViewBackground"
            anchors.fill: parent

            color: mapStyleHelper.style.get("mapBackgroundColor")
        }


        ScaleBar {
            id: scaleBar
            visible: true
            objectName: "mapViewScaleBar"

            anchors {
                bottom: parent.bottom
                right: parent.right
            }
        }

        NoGpsIcon {
            id: noGpsIcon
            objectName: "noGpsIcon"
            //mapViewObj: mapView
            anchors.right: parent.right
            anchors.bottom: parent.bottom
        }

        FHC.IconTextPushButton {
            id: expandMapButton
            anchors {
                top: parent.top
                right: parent.right
            }
            objectName: "expandButton"
            visible: false

            onClicked: {
                root.expandMapActivated(true);
            }
        }

        FHC.IconTextPushButton {
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

        RouteBubbleGroup {
            id: routeBubbles
//            origin: Qt.point(mapView.x, mapView.y)
          //  routes: mapView.overviewRoutes
            showRelativeEte: false

            onSelectedRouteChanged: {
                if (selectedRoute !== undefined) {
                    for (var index = 0; index < alternativeRoutesList.routeListModel.length; ++index) {
                        if (selectedRoute.id === alternativeRoutesList.routeListModel[index].id) {
                            if (alternativeRoutesList.selectedIndex != index) {
                                alternativeRoutesList.selectedIndex = index;
                            }
                            break;
                        }
                    }
                }
            }
        }

        FHC.AssetItem {
            id: listBackground
            objectName: "listBackground"
            anchors {
                left: parent.left
                top: parent.top
            }
        }

        AlternativeRoutesList {
            id: alternativeRoutesList
            objectName: "tnAlternativeRouteList"

            anchors.top : parent.top
            anchors.left: parent.left
            visible: true
            routeListModel: 100

            Loader {
                id: busyPopupLoader
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                    verticalCenterOffset: topBarLoader.height/2
                }
                sourceComponent: loadingIndicator
                active: activeBusyIndicator
            }

            Component {
                id: loadingIndicator
                FHC.BusyIndicator {
                    objectName: "loadingIndicator"
                    height: 54
                    width: 54
                    styleId: "tnBlueIndicatorStyle"
                }
            }


            onSelectedIndexChanged: {
                root.highlightRoute();
                routeBubbles.selectedRoute = alternativeRoutesList.routeListModel[alternativeRoutesList.selectedIndex];
            }
        }
        Image {
            id: pic
            anchors{
                left:alternativeRoutesList.right
                top:alternativeRoutesList.top
            }
            //   anchors.top: rootRect.top
            source: "qrc:qmlf/8inch/map.png"
        }
//        AvoidOnRouteList {
//            id: avoidOnRouteList
//            objectName: "tnAvoidOnRouteList"
//            anchors.top : parent.top
//            anchors.left: parent.left
//            visible: isAvoidOnRouteView

//            onVisibleChanged: {
//                if (visible)
//                {
//                    preHighwayState = SettingsModel.avoidHighways;
//                    preTollRoadState = SettingsModel.avoidTollRoads;
//                    preTunnelsState = SettingsModel.avoidTunnels;
//                    preCountryBorderState = SettingsModel.avoidCountryBorders;
//                    preFerryState = SettingsModel.avoidFerries;
//                }
//            }
//        }

        GoButton {
            id: startButton
            objectName: "tnStartButton"
            anchors {
                left: parent.left
                bottom: parent.bottom
                bottomMargin: 60
            }
            visible: !root.isAvoidOnRouteView && !root.activeBusyIndicator
            durationText: alternativeRoutesList.currentRouteEte
            isEnabled: true
            routeCalculating: true

            onButtonActivated: {
                root.startButtonClicked(root.alternativeRoutesRoutingFlow.routes[alternativeRoutesList.selectedIndex]);
            }
        }

        Loader {
            id: topBarLoader
            sourceComponent: topBar
            active: true
        }

        Component {
            id: topBar
            AlternativeRoutesTopBar {
                objectName: "tnTopBar"
                anchors {
                    top : parent.top
                    left: parent.left
                }
                isAvoidOnRouteView: root.isAvoidOnRouteView

                onBackButtonActivated: {
                    backButtonClicked();
                }
                onAvoidOnRouteButtonActivated: {
                    avoidButtonClicked();
                }
            }
        }

        Loader {
            id: topBar12InchLoader
            sourceComponent: topBar12Inch
            active: false
        }

        Component {
            id: topBar12Inch
            HalfPanelTitleBar12Inch {
                objectName: "topBar12Inch"
                titleText: "KIPPOIRoutes"
                isShowAvoidButton: !root.isAvoidOnRouteView

                onBackButtonActivated: {
                    backButtonClicked();
                }
                onAvoidButtonActivated: {
                    avoidButtonClicked();
                }
            }
        }

    }

    /*Connections {
        target: hmiPlatformHandler
        enabled: !root.isInBackgroundState
        ignoreUnknownSignals: true

        onZoomIn: {
            doMapRelatedPlatformCommand(hmiPlatformHandler.hmiSupportedPlatformCommandType.ZoomIn);
        }
        onZoomOut: {
            doMapRelatedPlatformCommand(hmiPlatformHandler.hmiSupportedPlatformCommandType.ZoomOut);
        }
        onChangeMapOrientation: {
            if (orientation !== MapView.MODE_2D_NORTHUP) {
                hmiPlatformHandler.notifyExecuteResult(false);
                return ;
            }

            doMapRelatedPlatformCommand(hmiPlatformHandler.hmiSupportedPlatformCommandType.ChangeMapOrientation, orientation);
        }
        onChangeTrafficVisibility: {
            SettingsModel.trafficEnabled = (trafficVisibility === HMIController.TRAFFIC_OFF ? false : true);

            hmiPlatformHandler.notifyExecuteResult(true);
        }
        onUpdateAlternativeRoutes: {
            if (root.alternativeRoutesRoutingFlow.state !== RoutingFlow.CALCULATING_ROUTE) {
                if (root.isAvoidOnRouteView) {
                    root.isAvoidOnRouteView = false;
                }

                recalculateRoute();
            }
        }
    }*/

    onIsShownByVRChanged: {
        if (root.isShownByVR) {
            recalculateRoute();
        }
    }

    Component.onCompleted: {
      //  mapViewForPlatform = mapView;
//        if(root.alternativeRoutesRoutingFlow.resultState === RoutingFlow.AVAILABLE) {
//            root.activeBusyIndicator = false;
//        }
    }

//    Connections {
//        target: SettingsModel
//        ignoreUnknownSignals: true

//        onTrafficEnabledChanged: {
//            if(mapView.mapViewState === MapView.READY &&
//               mapView.trafficEnabled !== SettingsModel.trafficEnabled)
//            {
//                mapView.trafficEnabled = SettingsModel.trafficEnabled;
//            }
//        }

////        onAvoidHighwaysChanged: {
////            preHighwayState = SettingsModel.avoidHighways;
////        }
//    }

    function highlightRoute() {
//        if (alternativeRoutesList.selectedIndex < root.alternativeRoutesRoutingFlow.routes.length) {
//            mapView.highlightRoute(root.alternativeRoutesRoutingFlow.routes[alternativeRoutesList.selectedIndex]);
//        }
    }

    function checkAvoidStateChanged()
    {
        return false;
    }

    function backButtonClicked(){
        if(root.isAvoidOnRouteView){
            root.isAvoidOnRouteView = false;
            if(checkAvoidStateChanged() === true)
            {
                recalculateRoute();
            }
        }
        else
        {
            root.backButtonActivated();
        }
    }

    function isAvoidFail(avoidType) {
        for(var m = 0; m < alternativeRoutesRoutingFlow.routes.length; m++) {
            var characteristics = alternativeRoutesRoutingFlow.route(m).characteristics;
            for(var i = 0; i < characteristics.length; i++) {
                if (characteristics[i] == avoidType) {
                    return true;
                }
            }
            return false;
        }
    }

    function checkAvoidList(){
        var listAvoidStates = new Array;
        if(SettingsModel.avoidHighways && isAvoidFail(RoutingTypes.HAS_HIGHWAY)){
            listAvoidStates.push("KIPavoidHighwaysChkbx");
        }
        if(SettingsModel.avoidTollRoads && isAvoidFail(RoutingTypes.HAS_TOLL)){
            listAvoidStates.push("KIPavoidTollsChkbx");
        }
        if(SettingsModel.avoidTunnels && isAvoidFail(RoutingTypes.HAS_TUNNEL)){
            listAvoidStates.push("KIPavoidTunnelsChkbx");
        }
        if(SettingsModel.avoidCountryBorders && isAvoidFail(RoutingTypes.HAS_NATIONAL_BORDER)){
            listAvoidStates.push("KIPavoidBordersChkbx");
        }
        if(SettingsModel.avoidFerries && isAvoidFail(RoutingTypes.HAS_FERRY)){
            listAvoidStates.push("KIPavoidFerriesChkbx");
        }
        if(listAvoidStates.length == 1){
            showPopupMessage(translatedStrings["KIPavoid"]+translatedStrings[listAvoidStates[0]]+".");
        }
        else if(listAvoidStates.length > 1){
            showPopupMessage(translatedStrings["KIPavoidRoad"]);
        }
    }

    function avoidButtonClicked(){
        isAvoidOnRouteView = true;
        root.avoidOnRouteButtonActivated();
    }

    function recalculateRoute() {
        root.activeBusyIndicator = true;

        if (root.alternativeRoutesRoutingFlow.state === RoutingFlow.CALCULATING_ROUTE)
            root.alternativeRoutesRoutingFlow.cancelRequest();

        if (root.alternativeRoutesRoutingFlow.resultState === RoutingFlow.AVAILABLE)
            root.alternativeRoutesRoutingFlow.clearRoutes();

        if (root.destination &&
            root.destination.isValid &&
            root.destination.place.isValid) {
            mapView.regionType = MapView.REGION_WITHOUT_CVP;
            mapView.destinations = [root.destination];
        }

        alternativeRoutesList.routeListModel = [];
        mapView.clearAllRoutes();

        if (root.isShownByVR) {
            root.alternativeRoutesRequest.destinations = [root.destination];
        }

        root.alternativeRoutesRoutingFlow.calculateRoute(root.alternativeRoutesRequest);
    }
}
