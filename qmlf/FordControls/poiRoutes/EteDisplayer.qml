import QtQuick 2.7
//import navHmi 1.0
import com.ford.hmicontrols 1.0 as FHC

FHC.Layout {
    id: root

    objectName: "tnEteDisplayer"

    width: row.width
    height: row.height

    property var eteObject: undefined
    property bool valueAndUnitSpacing: false

    property string bigFontStyle: PlatformController.screenType === PlatformController.INCH_8 ? "tnFontSize29Style" :
                                  PlatformController.screenType === PlatformController.INCH_12 ? "tnFontSize45Style" : ""

    property string smallFontStyle: PlatformController.screenType === PlatformController.INCH_8 ? "tnFontSize24Style" :
                                    PlatformController.screenType === PlatformController.INCH_12 ? "tnFontSize38Style" : ""

    layoutId: "tnEteDisplayerLayout"

    Row {
        id: row

        anchors.verticalCenter: parent.verticalCenter

        FHC.Text {
            id: eteDays
            styleId: root.bigFontStyle
            anchors.bottom: parent.bottom
            text: __impl.__eteDays
            width: text.width
            visible: root.eteObject !== undefined
        }

        FHC.Text {
            styleId: root.bigFontStyle
            anchors.bottom: parent.bottom
            text: " "
            width: text.width
            visible: __impl.__addSpace && __impl.__eteDays !== ""
        }

        FHC.Text {
            id: eteDaysUnit
            styleId: root.smallFontStyle
            objectName: "daysUnit"
            anchors.bottom: parent.bottom
            text: __impl.__eteDays !== "" ? translatedStrings["KIPcommonEteUnitDay"]
                                          : ""
            width: text.width
            visible: root.eteObject !== undefined
        }

        FHC.Text { // spacing between units
            styleId: root.smallFontStyle
            anchors.bottom: parent.bottom
            text: " "
            width: text.width
            visible: __impl.__eteDays !== "" && (__impl.__eteHours || __impl.__eteMinutes)
        }

        FHC.Text {
            id: eteHours
            styleId: root.bigFontStyle
            anchors.bottom: parent.bottom
            text: __impl.__eteHours
            width: text.width
            visible: root.eteObject !== undefined
        }

        FHC.Text {
            styleId: root.smallFontStyle
            anchors.bottom: parent.bottom
            text: " "
            width: text.width
            visible: __impl.__addSpace && __impl.__eteHours !== ""
        }

        FHC.Text {
            id: eteHoursUnit
            styleId: root.smallFontStyle
            objectName: "hoursUnit"
            anchors.bottom: parent.bottom
            text: __impl.__eteHours !== "" ? translatedStrings["KIPcommonEteUnitHour"]
                                           : ""
            width: text.width
            visible: root.eteObject !== undefined
        }

        FHC.Text { // spacing between units
            styleId: root.smallFontStyle
            anchors.bottom: parent.bottom
            text: " "
            width: text.width
            visible: __impl.__eteHours !== "" && __impl.__eteMinutes !== ""
        }

        FHC.Text {
            id: eteMinutes
            styleId: root.bigFontStyle
            anchors.bottom: parent.bottom
            text: __impl.__eteMinutes
            width: text.width
            visible: root.eteObject !== undefined
        }

        FHC.Text {
            styleId: root.smallFontStyle
            anchors.bottom: parent.bottom
            text: " "
            width: text.width
            visible: __impl.__addSpace && __impl.__eteMinutes !== ""
        }

        FHC.Text {
            id: eteMinutesUnit
            styleId: root.smallFontStyle
            objectName: "minutesUnit"
            anchors.bottom: parent.bottom
            text: __impl.__eteMinutes !== "" ? translatedStrings["KIPcommonEteUnitMin"]
                                             : ""
            width: text.width
            visible: root.eteObject !== undefined
        }

        FHC.Text {
            styleId: root.bigFontStyle
            height: eteDays.height
            anchors.bottom: parent.bottom
            visible: root.eteObject === undefined ||
                     (__impl.__eteMinutes === "" && __impl.__eteHours === "" && __impl.__eteDays === "")
            text: "- : -"
            width: text.width
        }
    }

    property QtObject __impl: QtObject {
        property bool __roundingMinutes: eteObject !== undefined && eteObject.days !== undefined ? eteObject.days > 0 : false

        property int minutes: typeof eteObject != "undefined" ? (eteObject.seconds > 0 ? ( eteObject.minutes > 0 ? eteObject.minutes
                                                                                                                 : 1)
                                                                                       : eteObject.minutes)
                                                              : 0

        property int hours: typeof eteObject != "undefined" ? (minutes === 60 ? (eteObject.hours + 1)
                                                                              : (__roundingMinutes ? (minutes > 30 ? (eteObject.hours + 1)
                                                                                                                   : eteObject.hours)
                                                                                                   : eteObject.hours))
                                                            : 0

        property int days: typeof eteObject != "undefined" ? (hours === 24 ? eteObject.days + 1
                                                                           : eteObject.days)
                                                           : 0

        property string __eteMinutes: __roundingMinutes ? "" : ( minutes === 0 ? "" : minutes)

        property string __eteHours: hours === 24 ? "" : (hours === 0 ? "" : hours)

        property string __eteDays: days === 0 ? "" : days

        property bool __addSpace: !((__eteDays !== "" && __eteHours !== "") || (__eteHours !== "" && __eteMinutes !== ""))
                                  && root.valueAndUnitSpacing
    }
}
