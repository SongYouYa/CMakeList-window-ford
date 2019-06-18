import QtQuick 2.7
import com.ford.hmicontrols 1.0 as FHC

Item{
    id: root

    property var route
    property var referenceRoute
    property bool showRelativeEte : false
    property bool highlight : false
    property var cursorOrientation
    property point cursorPosition
    property point referenceOrigin

    signal tapped()

    width: bubble.width
    height: bubble.height

    Bubble {
        id:bubble
        anchors.centerIn: parent
        ete: (root.route !== undefined && root.route.summary !== undefined) ?
                 root.route.summary.ete: undefined
        referenceEte: (root.referenceRoute !== undefined && root.referenceRoute.summary !== undefined) ?
                          root.referenceRoute.summary.ete: undefined
        showRelativeEte: root.showRelativeEte
        highlight: root.highlight
        cursorOrientation: root.cursorOrientation
        cursorPosition: root.cursorPosition
        referenceOrigin: root.referenceOrigin

        onTapped: {
            root.tapped();
        }
    }

    function findProperPosition() {
        return bubble.findProperPosition();
    }
}
