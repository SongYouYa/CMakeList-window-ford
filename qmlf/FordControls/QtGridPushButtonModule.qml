import QtQuick 2.6
import com.ford.hmicontrols 1.0 as HMIControls

Item {

    anchors.fill: parent
    Image {
        id: background
        fillMode: Image.TileHorizontally
        smooth: true
        anchors.fill: parent
        source: 'qrc:qmlf/8inch/bg-pop-up-no-headline.png'
    }

    property var carModel: [
        {"label":"Fusion 6", "icon":"laneKeeping"},
        {"label":"C-Max 6", "icon":"preCollision"},
        {"label":"Mustang 6", "icon":"trafficSignRecognition"},
        {"label":"Taurus 6", "icon":"rearViewCamera"},
        {"label":"Edge 6", "icon":"towHaul"},
        {"label":"Focus 6", "icon":"blindSpotDetection"},
        {"label":"Fusion 6", "icon":"crossTrafficAlert"},
        {"label":"C-Max 6", "icon":"wrongWayAlert"},
        {"label":"Focus 6", "icon":"tractionControl"},
        {"label":"Fusion 6", "icon":"laneKeeping"},
        {"label":"C-Max 6", "icon":"preCollision"},
        {"label":"Mustang 6", "icon":"trafficSignRecognition"},
        {"label":"Taurus 6", "icon":"rearViewCamera"},
        {"label":"Edge 6", "icon":"towHaul"},
        {"label":"Focus 6", "icon":"blindSpotDetection"},
        {"label":"Fusion 6", "icon":"crossTrafficAlert"},
        {"label":"C-Max 6", "icon":"wrongWayAlert"},
        {"label":"Focus 6", "icon":"tractionControl"},
        {"label":"Fusion 6", "icon":"laneKeeping"},
        {"label":"C-Max 6", "icon":"preCollision"},
        {"label":"Mustang 6", "icon":"trafficSignRecognition"},
        {"label":"Taurus 6", "icon":"rearViewCamera"},
        {"label":"Edge 6", "icon":"towHaul"},
        {"label":"Focus 6", "icon":"blindSpotDetection"},
        {"label":"Fusion 6", "icon":"crossTrafficAlert"},
        {"label":"C-Max 6", "icon":"wrongWayAlert"},
        {"label":"Focus 6", "icon":"tractionControl"}
    ]

    HMIControls.ListViewControl {
        id: carListView
        orientation: Qt.Horizontal
        hasScrollBar: false
        model: carModel
        width: parent.width
        height: 400
        rows: 1
        hasPageIndicator:FALSE
        listType: HMIControls.ListViewHelper.Type_Grid
        splitIntoPages: true
        //            listItemHeight: 100
        clip: false
        //this is just an example of a possible datamodel


    }

    Item {
        width: 20
        height: width
    }

}
