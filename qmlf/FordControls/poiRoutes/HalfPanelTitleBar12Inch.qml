import QtQuick 2.6

import com.ford.hmicontrols 1.0 as FHC

FHC.Layout {
    id: layout

    layoutId: isFloating ? "tn12InchFloatingPanelTitleBar" : "tn12InchHalfPanelTitleBarLayout"

    property string titleText: ""
    property bool isFloating: false
    property alias isShowSortButton: sortButtonLoader.active
    property alias isShowAvoidButton: avoidButtonLoader.active
    property string titleStyleId: "tnTitleBarTextStyle"

    property bool isRatingSortAvailable: false
    property bool isPriceSortAvailable: false
    property int selectedSortOptionIndex: 0

    property real sortOptionItemHeight
    property real twoLineSortOptionHeight
    property real threeLineSortOptionHeight
    property real fourLineSortOptionHeight
    property real fiveLineSortOptionHeight
    property real sortOptionBgTopMargin
    property real sortOptionBgLeftMargin
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
    property real dividerWidth
    property real dividerLeftMargin

    signal backButtonActivated()
    signal avoidButtonActivated()
    signal sortOptionClicked(var text)


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

    FHC.AssetItem {
        id: titleDivider
        objectName: "titleDivider"
        anchors {
            top: parent.top
            left: parent.left
        }
    }

    FHC.IconTextPushButton {
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

    FHC.Text {
        id: title
        objectName: "title"
        anchors {
            left: parent.left
            top: parent.top
        }
        wrapMode: Text.WordWrap
        maximumLineCount: 2
        text: titleText
        styleId: titleStyleId
    }

    Loader {
        id: sortButtonLoader
        objectName: "sortButtonLoader"
        anchors {
            top: layout.top
            left: layout.left
        }
        sourceComponent: sortButton
        active: false
    }

    Component {
        id: sortButton
        FHC.IconTextPushButton {
            objectName: "sortButton"
            styleId: "tnSortButtonStyle"
            isSelected: sortOptionListLoader.active
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

    Loader {
        id: avoidButtonLoader
        objectName: "avoidButtonLoader"
        anchors {
            top: layout.top
            left: layout.left
        }
        sourceComponent: avoidButton
        active: false
    }

    Component {
        id: avoidButton
        FHC.IconTextPushButton {
            objectName: "avoidButton"
            styleId: "tnAvoidButtonStyle"
            onClicked: {
                avoidButtonActivated();
            }
        }
    }

    Loader {
        id: sortOptionListLoader
        objectName: "sortOptionListLoader"
        anchors {
            top: layout.top
            left: layout.left
        }
        sourceComponent: sortOptionListComponent
        active: false
    }

    Component {
        id: sortOptionListComponent
        Item {
            anchors.fill: sortOptionListLoader
            FHC.AssetItem {
                id: sortOptionBg
                objectName: "sortOptionBg"
                anchors {
                    top: parent.top
                    left: parent.left
                }
                assetId: isRatingSortAvailable ? (isPriceSortAvailable ? "tnSortOptionListFiveOptionsBg"
                                                                       : "tnSortOptionListThreeOptionsBg")
                                               : (isPriceSortAvailable ? "tnSortOptionListFourOptionsBg"
                                                                       : "tnSortOptionListTwoOptionsBg")
            }

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
                    FHC.Text {
                        id: sortOptionText
                        anchors {
                            top: parent.top
                            left: parent.left
                            topMargin: sortOptionTextTopMargin
                            leftMargin: priceIcon.visible ? sortOptionTextBigLeftMargin : sortOptionTextSmallLeftMargin
                        }
                        width: priceIcon.visible ? sortOptionTextSmallWidth : sortOptionTextBigWidth
                        styleId: layout.selectedSortOptionIndex === index ? "tnSortOptionButtonTextSelectedStyle" : "tnSortOptionButtonTextStyle"
                        text: translatedStrings["KIPsortOption" + sortOptionListModel.get(index).sortOptionText]
                    }
                    FHC.AssetItem {
                        id: priceIcon
                        anchors {
                            top: parent.top
                            right: parent.right
                            topMargin:  priceIconTopMargin
                            rightMargin: priceIconRightMargin
                        }
                        assetId: getPriceIconAssetId(index)
                        visible: sortOptionListModel.get(index).sortOptionType === "Price From Low"
                                 || sortOptionListModel.get(index).sortOptionType === "Price From High"
                    }
                    FHC.AssetItem {
                        id: sortOptionDivider
                        anchors {
                            bottom: parent.bottom
                            left: parent.left
                            leftMargin: dividerLeftMargin
                        }
                        width: dividerWidth
                        assetId: "tnListDivider"
                        visible: index !== sortOptionList.count - 1
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            sortOptionListLoader.active= false;
                            if(layout.selectedSortOptionIndex !== index) {
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

