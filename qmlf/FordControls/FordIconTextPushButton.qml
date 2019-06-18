import QtQuick 2.7

import QtGraphicalEffects 1.0
import com.ford.hmicontrols 1.0 as FHC

Column{
    Repeater{
        model:100
        FHC.IconTextPushButton {
            text: qsTr("Call Me")
            styleId: "rightIconTextPushButtonStyle"
            iconAssetId: "settingsBluetooth"
            width: 180
            height: 150
        }
    }
}

