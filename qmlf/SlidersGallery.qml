import QtQuick 2.6
import com.ford.hmicontrols 1.0 as HMIControls


Gallery {
    id: root

    property Item audio: Item {
        property double elapsed: 0
        property double total: 200
        property bool playing: !mediaSliderProgress.pressed && !verticalSlider.pressed && !appleSlider.pressed

        Timer {
            interval: 1000;
            running: audio.playing;
            repeat: true

            onTriggered: {
                audio.elapsed = audio.elapsed < audio.total ? (audio.elapsed + 1) : audio.elapsed
            }
        }
    }

    GalleryExhibit {
        label: "Progress Bar"
        HMIControls.ProgressBar {
            id: progressBar
            value: 0
            orientation: Qt.Horizontal
            preferredWidth: 260

            Timer {
                property bool increasing: false
                interval: 50; running: true; repeat: true
                onTriggered:{
                    increasing = progressBar.value >= 1.0 || progressBar.value <= 0 ? !increasing : increasing
                    progressBar.value = increasing ? progressBar.value + 0.01 : progressBar.value - 0.01
                }
            }
        }
    }

    GalleryExhibit {
        label: "Media Slider"
        HMIControls.MediaSlider {
            id: mediaSliderProgress
            value: audio.elapsed
            bufferedValue: audio.elapsed + 20
            minimumValue: 0
            maximumValue: audio.total

            showProgress: true
            showBufferProgress: true

            onUserTriggeredUpdate: {
                audio.elapsed = newValue;
            }
        }
    }

    GalleryExhibit {
        label: "Progress Bar"
        placard: "With media styling"
        HMIControls.ProgressBar {
            id: mediaProgressBar
            value: audio.elapsed / audio.total
            orientation: Qt.Horizontal
            preferredWidth: 260

            HMIControls.Text {
                id: beginningLabel
                property string minutes: "0"
                property string seconds: "00"
                text: minutes + ":" + seconds
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.right: parent.left
                styleId: "textStyleSmall"
                horizontalAlignment: Text.AlignRight
                width: beginningLabel.contentWidth
            }

            HMIControls.Text {
                id: endLabel
                property int minutes : Math.floor(audio.elapsed / 60)
                property string seconds : ("0" + Math.floor(audio.elapsed % 60)).slice(-2)
                text: minutes + ":" + seconds
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.right
                styleId: "textStyleSmall"
                width: endLabel.contentWidth
            }
        }
    }

    GalleryExhibit {
        label: "Slider with custom handle"
        HMIControls.Slider {
            id: appleSlider
            value: audio.elapsed
            minimumValue: 0
            maximumValue: audio.total

            orientation: Qt.Horizontal
            preferredWidth: progressBar.width

            showProgress: true
            showBufferProgress: false
            bufferedValue: audio.elapsed

            sliderHandle: HMIControls.AssetItem {
                height: 20
                width: 20
                assetId: "apple"
            }

            onUserTriggeredUpdate: {
                audio.elapsed = newValue;
            }
        }
    }

    GalleryExhibit {
        label: "Progress Bar"
        placard: "With indeterminate status set"
        HMIControls.ProgressBar {
            value: 0
            orientation: Qt.Horizontal
            preferredWidth: 260
            indeterminate: true
        }
    }

    GalleryExhibit {
        label: "Push Button Slider"
        HMIControls.PushButtonSlider {
            id: centeredSlider
            anchors.left: parent.left
            anchors.leftMargin: 250
            buttonWidth: 50
            buttonHeight: 50
            minimumValue: -5
            maximumValue: 5
            onUserTriggeredUpdate: {
                console.log("Moved push button slider to:", newValue);
            }
        }
    }

    GalleryExhibit {
        label: "Vertical variations"
        HMIControls.ProgressBar {
            id: navProgressBar
            value: 0
            orientation: Qt.Vertical
            height: 200
            preferredWidth: 260

            Timer {
                property bool increasing: true
                interval: 50; running: true; repeat: true
                onTriggered:{
                    increasing = parent.value >= 1.0 || parent.value <= 0 ? !increasing : increasing
                    navProgressBar.value = increasing ? navProgressBar.value + 0.01 : navProgressBar.value - 0.01
                }
            }
        }
        HMIControls.Slider {
            id: verticalSlider
            objectName: "AudioPage_mediaProgressBar"

            minimumValue: 0
            maximumValue: audio.total
            value: audio.elapsed
            bufferedValue: audio.elapsed + 20
            orientation: Qt.Vertical
            showBufferProgress: true

            preferredWidth: 200

            onUserTriggeredUpdate: {
                audio.elapsed = newValue;
            }
        }
        HMIControls.ProgressBar {
            id: verticalAudioProgressBar
            objectName: "AudioPage_progressBar"
            orientation: Qt.Vertical
            height: 200
            indeterminate: true
        }
    }

    GalleryExhibit {
        label: "Value on Release"
        HMIControls.Slider {
            id: onReleaseSlider
            updateValueWhileDragging: false
            preferredWidth: 200
            stepSize: 0.1

            onUserTriggeredUpdate: {
                onReleaseSliderValue.text = onReleaseSlider.value
            }
        }
        HMIControls.Text {
            id: onReleaseSliderValue
            text: onReleaseSlider.minimumValue
            width: onReleaseSliderValue.contentWidth
        }
    }

    GalleryExhibit {
        label: "Value While Dragging"
        HMIControls.Slider {
            id: dragSlider
            preferredWidth: 200
            stepSize: 0.1

            onUserTriggeredUpdate: {
                dragSliderValue.text = dragSlider.value
            }
        }
        HMIControls.Text {
            id: dragSliderValue
            text: dragSlider.minimumValue
            width: dragSliderValue.contentWidth
        }
    }

    GalleryExhibit {
        label: "Media Slider withoutHandle"
        HMIControls.MediaSlider {
            id: mediaSliderProgress1
            value: 0
            minimumValue: 0
            maximumValue: 10
            showProgress: true
            disableMediaSliderTouchEvents: true

            onUserTriggeredUpdate: {
                console.warn("This should not be printed")
            }
        }
    }
    GalleryExhibit {
        HMIControls.IconTextPushButton {
            id: btn1
            text: "Increase Slider value"
            width: 200
            height: 80
            onClicked: {
                mediaSliderProgress1.value = mediaSliderProgress1.value + 1
            }
        }
        HMIControls.IconTextPushButton {
            id: btn2
            text: "Decrease Slider value"
            width: 200
            height: 80
            onClicked: {
                mediaSliderProgress1.value = mediaSliderProgress1.value - 1
            }
        }
    }
}
