import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1

Rectangle {
    visible: true
    objectName: "root"
    color: "#0C1F31"
    TableViewItem {
        id : item
        anchors.centerIn: parent
        objectName: "tableview"
        x : 30; y : 100

    }


}
