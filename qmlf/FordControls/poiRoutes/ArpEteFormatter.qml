import QtQuick 2.12
/**
 * @brief Provides a formatted ete based on an input object, the translations and a format.
 *
 *        Requires matching model and delegate.
 * @par Example usage
 * @code{.qml}

  ArpEteFormatter {
    id: eteFormatter
    minutesTranslation: "%1 Minuten"
    hoursTranslation: "%1 Stunden"
    daysTranslation: "%1 Tage"
    eteFormat: "%1, [%2 %3]"
    eteDurationObject: {"days":6; "hours":23; "minutes":59}
  }

  TextArea {
    id: textArea
    text: eteFormatter.formattedEte // actual: "6d 24h"
  }
 * @endcode
 */
QtObject {
    /**
     * @property eteDurationObject
     * @brief The ete structured in minutes, hours and days
     *        type:JSON
     */
    property var eteDurationObject: ({})

    /**
     * @property minutesTranslation
     * @brief The translation of "minutes" with a value argument placeholder
     *        type:string
     */
    property string minutesTranslation: ""

    /**
     * @property hoursTranslation
     * @brief The translation of "hours" with a value argument placeholder
     *        type:string
     */
    property string hoursTranslation: ""

    /**
     * @property minutesTranslation
     * @brief The translation of "days" with a value argument placeholder
     *        type:string
     */
    property string daysTranslation: ""

    /**
     * @property eteFormat
     * @brief The ete format containing placeholders for days, hours and minutes, in this order
     *        type:string
     */
    property string eteFormat: ""

    /**
     * @property formattedete
     * @brief The formatted ete
     *        type:string
     */
    readonly property string formattedEte: __impl.__eteStr

    /**
     * @property __impl
     * @brief Private implemenentation; shouldn't be used, nor it's child properties
     *        type:QtObject
     */
    property QtObject __impl: QtObject {
        /**
         * @property __eteMinutes
         * @brief when day is displayed, round up minutes
         *        type: bool
         */
        property bool __roundingMinutes: false

        /**
         * @property __eteMinutes
         * @brief ete minutes translated component
         *        type: int
         */
        property int __eteMinutes: 0
        /**
         * @property __eteHours
         * @brief ete hours translated component
         *        type: int
         */
        property int __eteHours: 0
        /**
         * @property __eteDays
         * @brief ete days translated component
         *        type:int
         */
        property int __eteDays:  0

        /**
         * @property __compressed
         * @brief display " " between value and unit
         *        type:bool
         */
        property bool __compressed: (__eteDays > 0 && __eteHours > 0 && __eteHours !== 24) || (__eteDays === 0 && __eteHours > 0 && __eteMinutes > 0)
        /**
         * @property __eteStr
         * @brief ete final formatted string
         *        type:string
         */
        property string __eteStr: eteDurationObject !== {} ? eteFormat.arg(__eteDays > 0 ? (__compressed ?  "%1" + daysTranslation : "%1 " + daysTranslation).arg(__eteDays) : "")
                                                                        .arg((__eteHours > 0 && __eteHours != 24)? (__compressed ?  "%1" + hoursTranslation : "%1 " + hoursTranslation).arg(__eteHours): "")
                                                                        .arg((__eteMinutes > 0 && !__roundingMinutes) ? (__compressed ?  "%1" + minutesTranslation : "%1 " + minutesTranslation).arg(__eteMinutes): "")
                                                                        .trim() : "---"
    }
}
