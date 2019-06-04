import QtQuick 2.0
import QtQuick.Controls 1.4

Column {
    property alias red: redSlider.value
    property alias green: greenSlider.value
    property alias blue: blueSlider.value
    property alias alpha: alphaSlider.value
    property color color: Qt.rgba(red, green, blue, alpha)

    spacing: 6

    Slider {
        id: redSlider
        width: parent.width
        minimumValue: 0.0
        maximumValue: 1.0
        value: 1.0
        style: RGBSliderStyle {
            width: parent.width
            color: "red"
        }
    }
    Slider {
        id: greenSlider
        width: parent.width
        minimumValue: 0.0
        maximumValue: 1.0
        value: 1.0
        style: RGBSliderStyle {
            width: parent.width
            color: "green"
        }
    }
    Slider {
        id: blueSlider
        width: parent.width
        minimumValue: 0.0
        maximumValue: 1.0
        value: 1.0
        style: RGBSliderStyle {
            width: parent.width
            color: "blue"
        }
    }

    Slider {
        id: alphaSlider
        width: parent.width
        minimumValue: 0.0
        maximumValue: 1.0
        value: 1.0
        style: RGBSliderStyle {
            width: parent.width
            color: "black"
        }
    }
}
