import QtQuick 2.7
import com.ford.hmicontrols 1.0 as FHC
//import QtArp 1.0
//import navHmi 1.0

FHC.Layout {
    id: root
    layoutId: "tnScaleBar"
    visible: true
    property alias text: scaleText.text
    property string textStyleId: "tnScaleBarTextStyle"

    property var indexInMeterImperial: [[6.096, ("20 " + "KIPcommonDistanceUnitFt")],
        [15.24, ("50 " + "KIPcommonDistanceUnitFt")],
        [30.48, ("100 " + "KIPcommonDistanceUnitFt")],
        [60.96, ("200 " + "KIPcommonDistanceUnitFt")],
        [152.4, ("500 " + "KIPcommonDistanceUnitFt")],
        [304.8, ("1000 " + "KIPcommonDistanceUnitFt")],
        [609.6, ("2000 " + "KIPcommonDistanceUnitFt")],
        [1207.008, (".75 " + "KIPcommonDistanceUnitMi")],
        ]
    property var indexInMeterMetric:   [[5, ("5 " + "KIPcommonDistanceUnitM")],
        [10, ("10 " + "KIPcommonDistanceUnitM")],
        [20, ("20 " + "KIPcommonDistanceUnitM")],
        [50, ("50 " + "KIPcommonDistanceUnitM")],
        [100, ("100 " + "KIPcommonDistanceUnitM")],
        [200, ("200 " + "KIPcommonDistanceUnitM")],
     ]
    property var targetMapView

//    DistanceConversion {
//        id : distanceConversion
//        format: QtArp.localizationManager.measurementUnit
//    }

    FHC.StyleHelper {
        id: styleHelper
        styleId: "tnScaleBarStyle"
    }

    Rectangle {
        id: verticalRect
        visible: readyToShow()
        objectName: "verticalRect"
        anchors.left: horizontalRect.left
        anchors.top: root.top
        color: styleHelper.style.get("backgroundRectColor")
    }
    Rectangle {
        id: horizontalRect
        visible: readyToShow()
        objectName: "horizontalRect"
        anchors.right: root.right
        anchors.bottom: root.bottom
        color: styleHelper.style.get("backgroundRectColor")
    }

    Rectangle {
        id: verticalRectInner
        visible: readyToShow()
        objectName: "verticalRectInner"
        anchors.left: verticalRect.left
        anchors.top: root.top
        color: styleHelper.style.get("foregroundRectColor")
    }
    Rectangle {
        id: horizontalRectInner
        visible: readyToShow()
        objectName: "horizontalRectInner"
        anchors.right: root.right
        anchors.bottom: root.bottom
        color: styleHelper.style.get("foregroundRectColor")
    }


    FHC.Text {
        id: scaleText
        visible: readyToShow()
        objectName: "scaleText"
        anchors.right: root.right
        anchors.bottom: root.bottom
        styleId: textStyleId
        maximumLineCount: 1
        elide: Text.ElideNone
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignRight
        text: "Outline"
        style: Text.Outline
        styleColor:  "#cc000000"
    }

    Timer {
        id: showTImer
        interval: 3000
        onTriggered: {
            root.visible = false;
        }
    }

//    Connections {
//        target: targetMapView

//        onZoomChanged: {
//            if (readyToShow()) {
//                update()
//            }
//        }

//        onBoundingBoxChanged: {
//            // if (readyToShow()) {
//            //     update()
//            // }
//        }

//        onMapViewStateChanged: {
//            if (readyToShow()) {
//                update()
//            }
//        }
//    }

    Connections {
        target: parent

        onVisibleChanged: {
            if (visible) {
                if (readyToShow()) {
                    update()
                }
            }
        }
    }

    onVisibleChanged: {
        if (visible) {
            if (readyToShow()) {
                showTImer.restart();
            } else {
                root.visible = false;
            }
        }
    }

    function readyToShow() {
        return targetMapView !== undefined && targetMapView.mapViewState === MapView.READY;
    }

    function update() {
        var sizeRatio = PlatformController.screenType === PlatformController.INCH_12 ? 1.8 : 1.0
        if (targetMapView.zoom > 16) // for > 1000 km/mi case
            sizeRatio *= 1.2
        var minLength = 70 * sizeRatio
        if (QtArp.localizationManager.measurementUnit === DistanceFormatter.METRIC) {
            if (targetMapView.zoom < 10)
                minLength = 60 * sizeRatio
        }
        var maxLength = minLength * 2.5

        var info = distanceConversion.calculateScaleBar({"windowLeftLon": targetMapView.boundingBox.bottomLeft.longitude, "windowRightLon": targetMapView.boundingBox.topRight.longitude,
                                                        "centerLat": (targetMapView.boundingBox.bottomLeft.latitude + targetMapView.boundingBox.topRight.latitude) / 2,
                                                        "mapPixelWidth": targetMapView.width, "maxBarLen": maxLength, "minBarLen": minLength,
                                                        "indexInMeter": QtArp.localizationManager.measurementUnit === DistanceFormatter.METRIC ? indexInMeterMetric : indexInMeterImperial})
        scaleText.text = info.text
        horizontalRectInner.width = info.length
        horizontalRect.width = info.length + 2
        root.visible = true;
        showTImer.restart();
    }
}
