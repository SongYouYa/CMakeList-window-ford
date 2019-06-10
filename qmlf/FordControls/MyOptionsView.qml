import QtQuick 2.7

import com.ford.hmicontrols 1.0 as FHC
import "../FordControls"
item {

    id: root

    /**
     * @property model - model and requests provider
     */
    property var model

    /**
     * @property rowCount - the number of rows from the grid
     */
    property int rowCount

    /**
     * @property columnCount - the number of columns from the grid
     */
    property int columnCount

    property bool isTrafficPopup: true
    property bool bMovingMapOnly: true

    // Signals
    signal backButtonActivated()
    signal closeButtonActivated()
    signal itemSelected(var itemName, var iconName)
    signal secretViewActivated

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        // currently just for secret view
        onPressAndHold: {
            if(width - mouse.x < 25 && height - mouse.y < 25)
                secretViewActivated()
        }
    }

    FHC.Layout {
        id: layout
        layoutId: "tnOptionsViewLayout"
        anchors.fill: parent

        FHC.AssetItem {
            id: background
            objectName: "background"
            anchors.fill: parent
        }

        FHC.StyleHelper {
            id: styleHelper
            styleId: "tnOptionsGridViewStyle"
        }

        OptionsGridView{
            id: optionsGridView
            width: 1020
            height: 960
            anchors {
                top:topBar.bottom
                left:parent.left
            }
            rows:2
            columns: 3
            model: 9
            gridViewHeight: optionsGridView.height
            bMovingMapOnly: root.bMovingMapOnly

            onItemSelected: {
                root.itemSelected(itemName, iconName)

                if (iconName === "Traffic")
                {
                    isTrafficPopup = true;
                    optionsPopupLoader.active = true;
                }
                else if(iconName === "Voice")
                {
                    isTrafficPopup = false;
                    optionsPopupLoader.active = true;
                }
            }
        }

        Loader{
            id: optionsPopupLoader
            anchors.fill: parent

            sourceComponent: OptionsScreenPopup{
                id: optionsScreenPopup

                selectedIndex: isTrafficPopup ? !SettingsModel.trafficEnabled : !SettingsModel.voiceEnabled
                popupTitle: isTrafficPopup ? translatedStrings["KIPoptionsTrafficonMap"] : translatedStrings["KIPoptionsVoice"]
                radioButtonModel: isTrafficPopup ? [translatedStrings["KIPoptionsTrafficOn"], translatedStrings["KIPoptionsTrafficOff"]] :
                                                                   [translatedStrings["KIPoptionsVoiceOn"], translatedStrings["KIPoptionsVoiceOff"]]
                onItemSelected: {
                    if(isTrafficPopup)
                    {
                        if(itemId === 0)
                            SettingsModel.trafficEnabled = true;
                        else
                            SettingsModel.trafficEnabled = false;
                    }
                    else
                    {
                        if(itemId === 0)
                            SettingsModel.voiceEnabled = true;
                        else
                            SettingsModel.voiceEnabled = false;
                    }
                }
                onCloseButtonActivated: {
                    active = false;
                }
            }

            active: false
        }

   }

}
