
import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick 2.0


Component {
    id: root

    /**
     * @property - button label
     */
    property string goButtonText : "KIPPOIDetailsStartButton"

    /**
     * @property - duration until user arrives at destination
     */
    property string durationText

    /**
     * @property isEnabled - flag indicating whether the button is enabled or not
     */
    property bool isEnabled: true

    /**
     * @property routeCalculating - flag indicating whether the route calculating is in progress or not
     */
    property bool routeCalculating: false

    /**
     * @property textHorizontalAlignment - the horizontal alignment of goButtonTextId
     */
    property alias textHorizontalAlignment: goButtonTextId.horizontalAlignment

    /**
     * @signal - emitted when the goButton is activated
     */
    signal buttonActivated
Rectangle{

    color: "blue"
    anchors.fill: parent
     Button{
        id: button

        anchors.fill: parent
        enabled: root.isEnabled
        text: "Start"
        onClicked: {
            if (!routeCalculating)
            root.buttonActivated();
        }

        MouseArea {
            anchors.fill: parent
            propagateComposedEvents: true
            onPressed: {
                mouse.accepted = root.isEnabled && root.routeCalculating;
            }
        }
    }

}
}
