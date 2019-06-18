
import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick 2.0

Item {
    id: layout

    property string titleText: ""
    /**
      * @property isShowTitleBgImage - used for different title bar styles
      * default title bar will show background image there
      **/
    property alias isShowTitleBgImage: backgroundImage.visible

    /**
      * @property isShowTitleDivider - used for different title bar styles
      * default title bar will not show title divider on the top
      **/
    property alias isShowTitleDivider: titleDividerLoader.active

    /**
      * @property isShowInfoButton - used for different title bar styles
      * default title bar will not show info button
      **/
    property alias isShowInfoButton: infoButtonLoader.active

    /**
      * @property isShowSortButton - used for different title bar styles
      * default title bar will not show sort button
      **/
    property alias isShowSortButton: sortButtonLoader.active

    property bool isRatingSortAvailable: false
    property bool isPriceSortAvailable: false
    property int selectedSortOptionIndex: 0
    property string sortLabelText:  "sortLabelText"

    signal backButtonActivated()
    signal infoButtonActivated()
    signal sortOptionClicked(var text)

//    layoutId: "tnTitleBarLayout"

    property string titleBgImageAssetId: "titleBarBackground"

    property real sortOptionItemHeight
    property real twoLineSortOptionHeight
    property real threeLineSortOptionHeight
    property real fourLineSortOptionHeight
    property real fiveLineSortOptionHeight
    property real sortOptionBgTopMargin
    property real sortOptionListTopMargin
    property real sortOptionLisLeftMargin
    property real sortOptionLisWidth
    property real sortOptionTextTopMargin
    property real sortOptionTextBigLeftMargin
    property real sortOptionTextSmallLeftMargin
    property real sortOptionTextSmallWidth
    property real sortOptionTextBigWidth
    property real priceIconTopMargin
    property real priceIconRightMargin
    property real titleLabelRightMargin
    property real titleLabelSmallRightMargin

    ListModel {
        id: sortOptionListModel
        ListElement {
            sortOptionType: "Relevance"
            sortOptionText: "Relevance"
        }
        ListElement {
            sortOptionType: "Distance"
            sortOptionText: "Distance"
        }
    }

    onIsRatingSortAvailableChanged: {
        sortOptionListModel.append({"sortOptionType": "Rating", "sortOptionText": "Rating"});
    }

    onIsPriceSortAvailableChanged: {
        sortOptionListModel.append({"sortOptionType": "Price From Low", "sortOptionText": "Price"});
        sortOptionListModel.append({"sortOptionType": "Price From High", "sortOptionText": "Price"});
    }

//    FHC.AssetItem {
//        id: backgroundImage
//        anchors.fill: parent
//        assetId: titleBgImageAssetId
//    }

    Loader {
        id: titleDividerLoader
        objectName: "titleDividerLoader"
        anchors {
            top: parent.top
            left: parent.left
        }
        sourceComponent: titleDivider
        active: false
    }

    Component {
        id: titleDivider
//        FHC.AssetItem {
//            assetId: "tnFullScreenTitleDivider"
//        }
    }

    Button {
        id: backButton
        objectName: "backButton"

        anchors {
            top: parent.top
            left: parent.left
        }
        onClicked: {
            backButtonActivated();
        }
    }

    Text {
        id: title
        objectName: "title"
        anchors {
            left: parent.left
            right: infoButtonLoader.active ? infoButtonLoader.left
                                           : sortButtonLoader.active ? sortButtonLoader.left
                                                                     : parent.right

            rightMargin: infoButtonLoader.active ? titleLabelSmallRightMargin
                                                 : titleLabelRightMargin
            top: parent.top
        }
        maximumLineCount: 1
        text: titleText
    }

    Loader {
        id: infoButtonLoader
        objectName: "infoButtonLoader"
        anchors {
            top: parent.top
            left: parent.left
        }
        sourceComponent: infoButton
        active: false
    }

    Component {
        id: infoButton
        Button {
          //  styleId: "tnInfoButtonStyle"
            onClicked: {
                infoButtonActivated();
            }
        }
    }

    Loader {
        id: sortButtonLoader
        objectName: "sortButtonLoader"
        anchors {
            top: parent.top
            right: parent.right
        }
        width: 900
        sourceComponent: sortButtonComponent
        active: false
    }
    Component {
        id: sortButtonComponent
        Item {
            id: sortButtonItem
            anchors  {
                verticalCenter: sortButtonLoader.verticalCenter
                right: sortButtonLoader.right
            }
            width:sortButton.width + sortLabel.width

//            FHC.AssetItem {
//                id: sortButton
//                objectName: "sortButton"
//                anchors {
//                    verticalCenter: parent.verticalCenter
//                    right: parent.right
//                }
//                assetId: sortOptionListLoader.active ? "tnSortUpArrowButtonIcon" : "tnSortButtonIcon"
//            }

           Text {
                id: sortLabel
                objectName: "sortLabel"
                anchors {
                    right: sortButton.left
                    verticalCenter: parent.verticalCenter
                }
                width: text.width
                maximumLineCount: 1
                text: sortLabelText
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(sortOptionListLoader.active) {
                        sortOptionListLoader.active = false
                    }
                    else {
                        sortOptionListLoader.active = true
                    }
                }
            }
        }
    }

    Loader {
        id: sortOptionListLoader
        objectName: "sortOptionListLoader"
        anchors {
            top: parent.top
            right: parent.right
        }
        sourceComponent: sortOptionListComponent
        active: false
    }

    Component {
        id: sortOptionListComponent
        Item {
            anchors.fill: sortOptionListLoader
//            FHC.AssetItem {
//                id: sortOptionListArrow
//                objectName: "sortOptionListArrow"
//                anchors {
//                    top: parent.top
//                    horizontalCenter: parent.horizontalCenter
//                }
//                assetId: "tnSortOptionListArrow"
//            }
//            FHC.AssetItem {
//                id: sortOptionBg
//                objectName: "sortOptionBg"
//                anchors {
//                    top: sortOptionListArrow.bottom
//                    left: parent.left
//                    topMargin: sortOptionBgTopMargin
//                }
//                assetId: isRatingSortAvailable ? (isPriceSortAvailable ? "tnSortOptionListFiveOptionsBg"
//                                                                       : "tnSortOptionListThreeOptionsBg")
//                                               : (isPriceSortAvailable ? "tnSortOptionListFourOptionsBg"
//                                                                       : "tnSortOptionListTwoOptionsBg")
//            }

            ListView {
                id: sortOptionList
                objectName: "sortOptionList"
                anchors {
                    top: sortOptionBg.top
                    left: sortOptionBg.left
                    topMargin: sortOptionListTopMargin
                    leftMargin: sortOptionLisLeftMargin
                }
                interactive: false
                width: sortOptionLisWidth
                height: isRatingSortAvailable ? (isPriceSortAvailable ? fiveLineSortOptionHeight
                                                                      : threeLineSortOptionHeight)
                                              : (isPriceSortAvailable ? fourLineSortOptionHeight
                                                                      : twoLineSortOptionHeight)

                model: sortOptionListModel
                delegate: sortOptionComponent
            }
            Component {
                id: sortOptionComponent
                Item {
                    width: sortOptionList.width
                    height: sortOptionItemHeight
                    Text {
                        id: sortOptionText
                        anchors {
                            top: parent.top
                            left: parent.left
                            topMargin: sortOptionTextTopMargin
                            leftMargin: priceIcon.visible ? sortOptionTextBigLeftMargin : sortOptionTextSmallLeftMargin
                        }
                        width: priceIcon.visible ? sortOptionTextSmallWidth : sortOptionTextBigWidth

                        text: translatedStrings["KIPsortOption" + sortOptionListModel.get(index).sortOptionText]
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            sortOptionListLoader.active= false;
                            if(layout.selectedSortOptionIndex !== index) {
                                sortLabelText = translatedStrings["KIPsortDropDown" + sortOptionListModel.get(index).sortOptionText];
                                layout.selectedSortOptionIndex = index;
                                sortOptionClicked(sortOptionListModel.get(index).sortOptionType);
                            }
                        }
                    }
                }
            }


        }
    }

    function getPriceIconAssetId(index) {
        if(layout.selectedSortOptionIndex === index) {
            if(sortOptionListModel.get(index).sortOptionType === "Price From Low") {
                return "tnSortPriceSelectedUpIcon";
            }
            else if (sortOptionListModel.get(index).sortOptionType === "Price From High") {
                return "tnSortPriceSelectedDownIcon";
            }
        }
        else {
            if(sortOptionListModel.get(index).sortOptionType === "Price From Low") {
                return "tnSortPriceUpIcon";
            }
            else if (sortOptionListModel.get(index).sortOptionType === "Price From High") {
                return "tnSortPriceDownIcon";
            }
        }
        return "";
    }
}

