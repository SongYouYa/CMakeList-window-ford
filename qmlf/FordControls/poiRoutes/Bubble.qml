import QtQuick 2.7
import com.ford.hmicontrols 1.0 as FHC
//import QtArp 1.0
//import QtArp.common 1.0

FHC.Layout {
    id: bubble

    property var ete
    property var referenceEte
    property bool highlight : false
    property bool showRelativeEte : false
    property var cursorOrientation
    property point cursorPosition
    property point referenceOrigin

    signal tapped()

    width: leftContainerBg.width + midContainerBg.width + rightContainerBg.width
    height: midContainerBg.height

    property var relativeEte: QtArpRelativeEteBuilder.relativeEte(ete, referenceEte)

    FHC.AssetItem {
        id: leftContainerBg
        objectName: "leftContainerBackground"
    }

    FHC.AssetItem {
        id: midContainerBg
        objectName: "midContainerBackground"
        width: eteDisplayerItem.width
        anchors.left: leftContainerBg.right
    }

    FHC.AssetItem {
        id: rightContainerBg
        objectName: "rightContainerBackground"
        anchors.left: midContainerBg.right
    }

    Item {
        id: eteDisplayerItem
        objectName: "eteDisplayerItem"
        anchors.left: midContainerBg.left
        anchors.top: midContainerBg.top
        width: eteInfo.width
        height: eteInfo.height
    }

    Column {
        id: eteInfo
        anchors.centerIn : eteDisplayerItem

        property var eteComparisonText: getComparisonText(bubble.relativeEte)

        EteDisplayer {
            id: eteDisplayer
            visible: bubble.state !== "unhighlightedSimilarEta"
            anchors.horizontalCenter: eteInfo.horizontalCenter
            valueAndUnitSpacing: true
        }

        FHC.Text {
            styleId:"tnEteComparisonFontStyle"
            anchors.horizontalCenter: eteInfo.horizontalCenter
            anchors.topMargin: bubble.state === "unhighlightedRelativeEte" ? -1 : 0
            text: eteInfo.eteComparisonText[0]
            width: text.width
            visible: bubble.state === "unhighlightedSimilarEta" || bubble.state === "unhighlightedRelativeEte"
        }

        FHC.Text {
            styleId:"tnEteComparisonFontStyle"
            anchors.horizontalCenter: eteInfo.horizontalCenter
            text: eteInfo.eteComparisonText[1]
            width: text.width
            visible: bubble.state === "unhighlightedSimilarEta"
        }

        function getComparisonText(relativeEte) {
            switch (relativeEte.comparison)
            {
            case RelativeEteComparisons.SIMILAR_ETA:
                return [translatedStrings["KIPRouteSimilar"], translatedStrings["KIPRouteEta"]];
            case RelativeEteComparisons.SLOWER:
                return [translatedStrings["KIPpredCardMapMinAltSlow"], ""];
            case RelativeEteComparisons.FASTER:
                return [translatedStrings["KIPpredCardMapMinAltFast"], ""];
            }
        }
    }

    MouseArea {
        id: bubbleMouseArea
        anchors.fill: parent
        onClicked: {
            tapped();
        }
    }

    states: [
        State {
            name: "highlighted"
            when: highlight
            PropertyChanges {
                target: eteDisplayer
//                bigFontStyle: "tnHighlightedFontSize29Style"
//                smallFontStyle: "tnHighlightedFontSize24Style"
//                eteObject: ete
            }
            PropertyChanges {
                target: bubble
                layoutId: "tnBubble1LineLayout"
            }
        },

        State {
            name: "unhighlightedSimilarEta"
            when: !highlight && showRelativeEte && relativeEte.comparison === RelativeEteComparisons.SIMILAR_ETA
            PropertyChanges {
                target: eteDisplayer
//                bigFontStyle: "tnBlackFontSize29Style"
//                smallFontStyle: "tnBlackFontSize24Style"
               // eteObject: ete
            }
            PropertyChanges {
                target: bubble
                layoutId: "tnBubble2LineLayout"
            }
        },

        State {
            name: "unhighlightedActualEte"
            when: !highlight && !showRelativeEte
            PropertyChanges {
                target: eteDisplayer
//                bigFontStyle: "tnBlackFontSize29Style"
//                smallFontStyle: "tnBlackFontSize24Style"
//                eteObject: ete
            }
            PropertyChanges {
                target: bubble
                layoutId: "tnBubble1LineLayout"
            }
        },

        State {
            name: "unhighlightedRelativeEte"
            when: !highlight && showRelativeEte && relativeEte.comparison !== RelativeEteComparisons.SIMILAR_ETA
            PropertyChanges {
                target: eteDisplayer
//                bigFontStyle: "tnBlackFontSize29Style"
//                smallFontStyle: "tnBlackFontSize24Style"
              //  eteObject: bubble.relativeEte.ete;
            }
            PropertyChanges {
                target: bubble
                layoutId: "tnBubble2LineLayout"
            }
        }
    ]

    function findProperPosition() {
        if (bubble.referenceOrigin && bubble.cursorOrientation && bubble.cursorPosition) {
            var offsets = getOffsetsBasedOnCursorPosition();
            var p = Qt.point(0,0);

            p.x = bubble.referenceOrigin.x + bubble.cursorPosition.x - offsets.x;
            p.y = bubble.referenceOrigin.y + bubble.cursorPosition.y - offsets.y;

            return p;
        }
        return null;
    }

    function getOffsetsBasedOnCursorPosition() {
        switch (bubble.cursorOrientation)
        {
        case TooltipCursorPositions.TOP_LEFT:
            return Qt.point(0, 0);
        case TooltipCursorPositions.TOP_CENTER:
            return Qt.point(bubble.width / 2, 0);
        case TooltipCursorPositions.TOP_RIGHT:
            return Qt.point(bubble.width, 0);
        case TooltipCursorPositions.CENTER_RIGHT:
            return Qt.point(bubble.width, bubble.height / 2);
        case TooltipCursorPositions.BOTTOM_RIGHT:
            return Qt.point(bubble.width, bubble.height);
        case TooltipCursorPositions.BOTTOM_CENTER:
            return Qt.point(bubble.width / 2, bubble.height);
        case TooltipCursorPositions.BOTTOM_LEFT:
            return Qt.point(0, bubble.height);
        case TooltipCursorPositions.CENTER_LEFT:
            return Qt.point(0, bubble.height / 2);
        }
    }
}
