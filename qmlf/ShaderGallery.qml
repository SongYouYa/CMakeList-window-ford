import QtQuick 2.6
import QtQuick.Controls 1.1
import QtGraphicalEffects 1.0

import com.ford.hmicontrols 1.0 as HMIControls


HMIControls.Scrollable {
    id: root
    anchors.fill: parent

    content: [

        Item {
            id: mainContent
            property color shadedColor: controlColor.color

            HMIControls.AssetItem {
                id: backgroundAsset
                assetId: "gradientBackground"
                color: backgroundColor.color
            }

            HMIControls.AssetHelper {
                id: pagecurl
                assetId: "shaderPageCurl"
            }

            HMIControls.AssetHelper {
                id: colormap
                assetId: "shaderColormap"
            }

            HMIControls.AssetHelper {
                id: wobble
                assetId: "shaderWobble"
            }


            Item {
                id: buttonContent

                HMIControls.Text {

                    id: textItem
                    x: 17
                    y: 17
                    visible: false
                    font.pixelSize: 48
                    styleId: "BaseTextStyle"
                    text: qsTr("Random Text with GRADIENT shader")
                    width: textItem.contentWidth
                }

                LinearGradient {
                    anchors.fill: textItem
                    source: textItem
                    gradient: Gradient {
                        GradientStop { position: 0; color: "white" }
                        GradientStop { position: 1; color: mainContent.shadedColor }
                    }
                }


                Row {
                    id: rowContent
                    x: 17
                    anchors.top: textItem.bottom
                    anchors.topMargin: 50
                    spacing: 10

                    Item {
                        width: transparentButton.width
                        height: transparentButton.height

                        HMIControls.IconTextPushButton {
                            id: transparentButton
                            text: qsTr("Icon Button")
                            iconAssetId: "settingsClock"
                        }

                        HMIControls.ColorEffect {
                            target: transparentButton
                            anchors.fill: target
                            fragmentColor: mainContent.shadedColor
                            cacheItem: true
                        }
                    }

                    Item {
                        width: widthSlider.value
                        height: 100

                        HMIControls.IconTextPushButton {
                            id: smallButton
                            anchors.fill: parent
                            text: qsTr("Text")
                            styleId: "borderButtonStyle"
                            iconAssetId: "settingsClock"
                        }

                        HMIControls.ColorEffect {
                            target: smallButton
                            anchors.fill: target
                            fragmentColor: mainContent.shadedColor
                            cacheItem: true
                        }
                    }

                    Item {
                        width: 150
                        height: 150

                        HMIControls.IconTextPushButton {
                            id: mediumButton
                            anchors.fill: parent
                            styleId: "borderButtonStyle"
                            iconAssetId: "settingsClock"
                            text: qsTr("Wave")

                            onClicked: {
                                isSelected = !isSelected;
                            }
                        }

                        ShaderEffectSource {
                            id: medButtonSource
                            smooth: true
                            hideSource: true
                            sourceItem: mediumButton
                        }

                        ShaderEffect {
                            id: wobbleshader
                            anchors.fill: parent
                            property var source: medButtonSource
                            property real fragmentAmplitude: .15 * 0.05
                            property real fragmentFrequency: 20
                            property real fragmentTime: 0

                            NumberAnimation on fragmentTime { loops: Animation.Infinite; from: 0; to: Math.PI * 2; duration: 600 }

                            fragmentShader: mediumButton.isSelected ? wobble.contents : ""
                        }
                    }

                    Item {
                        width: 200
                        height: 200

                        Item {
                            id: container
                            anchors.fill: parent

                            HMIControls.IconTextPushButton {
                                id: bigbutton
                                anchors.fill: parent
                                styleId: "borderButtonStyle"
                                iconAssetId: "settingsClock"
                                text: qsTr("Peel")
                            }

                            ShaderEffectSource {
                                id: buttonSource
                                smooth: true
                                hideSource: true
                                sourceItem: bigbutton
                            }

                            ShaderEffect {
                                id: pagecurlshader
                                visible: true
                                anchors.fill: parent
                                property real fragmentCurlExtent: peelSlider.value
                                property var source: buttonSource
                                fragmentShader: pagecurl.contents
                            }
                        }

                        HMIControls.ColorEffect {
                            target: container
                            anchors.fill: container
                            fragmentColor: mainContent.shadedColor
                            cacheItem: true
                        }
                    }

                    Item {
                        width: 50
                        height: 200

                        HMIControls.ProgressBar {
                            id: progressbar
                            styleId: "progressBarShaderDemoStyle"
                            value: 0
                            orientation: Qt.Vertical
                            preferredWidth: 50
                            height: parent.height

                            Timer {
                                property bool increasing: true
                                interval: 50; running: true; repeat: true
                                onTriggered: {
                                    increasing = parent.value >= 1.0 || parent.value <= 0 ? !increasing : increasing
                                    parent.value = increasing ? parent.value + 0.01 : parent.value - 0.01
                                }
                            }
                        }

                        HMIControls.ColorEffect {
                            target: progressbar
                            anchors.fill: progressbar
                            fragmentColor: mainContent.shadedColor
                            cacheItem: true
                        }
                    }

                }


                Rectangle {
                    anchors.top: rowContent.bottom
                    anchors.left: rowContent.left
                    anchors.right: rowContent.right


                    height: 100
                    color: "#55555555"

                    Row {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.fill: parent
                        anchors.margins: 10
                        spacing: 10

                        Text {
                            text: qsTr("Background")
                            font.pixelSize: 14
                            color: "white"
                        }

                        RGBSlider {
                            id: backgroundColor
                            width: 120
                        }

                        Text {
                            text: qsTr("Controls")
                            font.pixelSize: 14
                            color: "white"
                        }

                        RGBSlider {
                            id: controlColor
                            width: 120
                        }

                        Text {
                            text: qsTr("Width")
                            font.pixelSize: 14
                            color: "white"
                        }

                        Slider {
                            id: widthSlider
                            maximumValue: 300.0
                            minimumValue: 100.0
                        }

                        Text {
                            text: qsTr("Peel")
                            font.pixelSize: 14
                            color: "white"
                        }

                        Slider {
                            id: peelSlider
                            maximumValue: 1.0
                            minimumValue: 0.0
                        }
                    }

                }
            }

        }

    ]

}
