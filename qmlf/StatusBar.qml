import QtQuick 2.0
import com.ford.hmicontrols 1.0 as HMIControls

Item {
    property alias currentPageText : currentPage.text

    height: backgroundImage.height

    HMIControls.AssetItem {
        id: backgroundImage
        assetId: "navbarBackground"
        width: parent.width
    }

    HMIControls.Text {
        id: currentPage
        styleId: "textStyleStatusBar"
        color: "#BBBBBB"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width: 290
        horizontalAlignment: Text.AlignHCenter
    }
}
