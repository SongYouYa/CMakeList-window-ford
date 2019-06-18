import QtQuick 2.7
//import QtArp 1.0
//import QtArp.common 1.0

Item {
    id: root

    /**
     * @property routeBubbleDimensions - route bubble dimensions consumable by MapView when calculating their positions
     */
    property var routeBubbleDimensions: []


    /**
     * @property origin - relative coordinate from where the bubbles should be placed
     */
    property point origin: Qt.point(0,0)

    /**
     * @property routes - input routes used for bubble creation, route assignment and selection/highlighting via tapping
     */
    property var routes: undefined

    /**
     * @property selectedRoute - input/output route to indicate which which route has been selected via tap,
     *                           or which bubble should be highlighted based on its corresponding route
     */
    property var selectedRoute

    /**
     * @property showRelativeEte - flag indicating if the ETE shown should be relative to currently highlighted route bubble
     *           instead of its actual value
     */
    property bool showRelativeEte: false

    Repeater {
        id: routeBubbles
        model: routes
        delegate: RouteBubble {
            visible: false
            route: modelData
            referenceRoute: root.showRelativeEte ? root.selectedRoute : undefined
            showRelativeEte: root.showRelativeEte
            referenceOrigin: root.origin
            onTapped: {
                root.selectedRoute = route;
            }

            onWidthChanged: {
                var pos = findProperPosition();
                if (pos) {
                    x = pos.x;
                    y = pos.y;
                }
            }

            onHeightChanged: {
                var pos = findProperPosition();
                if (pos) {
                    x = pos.x;
                    y = pos.y;
                }
            }
        }

        onModelChanged: {
            routeBubbleDimensions = generateRouteTooltipDimensions();
            routeBubbles.highlightRouteTooltip(selectedRoute);
        }

        function generateRouteTooltipDimensions() {
            var tooltipDimensions = [];
            for (var index = 0; index < count; ++index) {
                if (itemAt(index) && itemAt(index).route) {
                    tooltipDimensions.push(QtArpRouteTooltipDimensionBuilder.routeTooltipDimension(itemAt(index).route.id,
                                                                                                   itemAt(index).width,
                                                                                                   itemAt(index).height));
                }
            }

            return tooltipDimensions;
        }

        function highlightRouteTooltip(route) {
            for (var index = 0; index < routeBubbles.count; ++index) {
                routeBubbles.itemAt(index).highlight = false;
            }

            if (route !== undefined) {
                for (index = 0; index < routeBubbles.count; ++index) {
                    if (routeBubbles.itemAt(index).route !== undefined && (routeBubbles.itemAt(index).route.id === route.id)) {
                        routeBubbles.itemAt(index).highlight = true;
                        break;
                    }
                }
            }
        }
    }

    function setPositions(positions) {
        var bubbleIndex = 0;

        // Deactivate the route tooltip bubbles until they are correctly placed and to prevent them showing obsolete information
        for (bubbleIndex = 0; bubbleIndex < routeBubbles.count; ++bubbleIndex) {
            routeBubbles.model[bubbleIndex].visible = false;
        }

        for (var positionIndex = 0; positionIndex < positions.length; ++positionIndex) {
            for (bubbleIndex = 0; bubbleIndex < routeBubbles.count; ++bubbleIndex) {
                if ( routeBubbles.itemAt(bubbleIndex) && routeBubbles.itemAt(bubbleIndex).route &&
                        positions[positionIndex].routeId === routeBubbles.itemAt(bubbleIndex).route.id) {
                    var bubble =  routeBubbles.itemAt(bubbleIndex);
                    bubble.cursorOrientation = positions[positionIndex].cursorPosition;
                    bubble.cursorPosition = Qt.point(positions[positionIndex].x, positions[positionIndex].y);
                    var pos = bubble.findProperPosition();
                    if (pos) {
                        bubble.x = pos.x;
                        bubble.y = pos.y;
                    }
                    bubble.visible = true;
                }
            }
        }
    }

    onSelectedRouteChanged: {
        routeBubbles.highlightRouteTooltip(selectedRoute);
    }
}
