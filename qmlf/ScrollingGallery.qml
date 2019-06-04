import QtQuick 2.6
import com.ford.hmicontrols 1.0 as HMIControls

Gallery {
    id: root

    GalleryExhibit {
        label: "Scrollable region"
        HMIControls.Scrollable {
            height: 400
            width: 350
            content: [
                Repeater {
                    model: [ "red", "orange", "yellow", "green", "blue", "indigo", "violet",
                             "red", "orange", "yellow", "green", "blue", "indigo", "violet",
                             "red", "orange", "yellow", "green", "blue", "indigo", "violet",
                             "red", "orange", "yellow", "green", "blue", "indigo", "violet" ]
                    Rectangle {
                        height: 33
                        width: parent.width
                        color: modelData
                    }
                }
            ]
        }
    }

    GalleryExhibit {
        label: "Scrollable region"
        placard: "Styled to use buttons"
        HMIControls.Scrollable {
            styleId: "scrollableWithButtonsStyle"
            height: 400
            width: 350
            content: [
                Repeater {
                    model: [ "red", "orange", "yellow", "green", "blue", "indigo", "violet",
                             "red", "orange", "yellow", "green", "blue", "indigo", "violet",
                             "red", "orange", "yellow", "green", "blue", "indigo", "violet",
                             "red", "orange", "yellow", "green", "blue", "indigo", "violet" ]
                    Rectangle {
                        height: 33
                        width: parent.width
                        color: modelData
                    }
                }
            ]
        }
    }

    GalleryExhibit {
        label: "Scrollable region"
        placard: "Scrollbar has been auto-hidden because the content fits"
        HMIControls.Scrollable {
            id: scrollableNoScrollbar
            height: 400
            width: 350
            content: [
                Repeater {
                    model: [ "red", "orange", "yellow", "green" ]
                    Rectangle {
                        height: scrollableNoScrollbar.height / 4
                        width: parent.width
                        color: modelData
                    }
                }
            ]
        }
    }

    GalleryExhibit {
        label: "Scrollable region"
        placard: "No Arrows 1/4 size handle"
        HMIControls.Scrollable {
            id: scrollableNoArrows
            height: 400
            width: 350
            content: [
                Repeater {
                    model: [ "red", "orange", "yellow", "green" ]
                    Rectangle {
                        height: scrollableNoArrows.height
                        width: parent.width
                        color: modelData
                    }
                }
            ]
        }
    }

    GalleryExhibit {
        label: "Scrollable region"
        placard: "w/ Arrows 1/4 size handle"
        HMIControls.Scrollable {
            id: scrollbarWithArrows
            styleId: "scrollableWithButtonsStyle"
            height: 400
            width: 350
            content: [
                Repeater {
                    model: [ "red", "orange", "yellow", "green" ]
                    Rectangle {
                        height: scrollbarWithArrows.height
                        width: parent.width
                        color: modelData
                    }
                }
            ]
        }
    }

    GalleryExhibit {
        label: "Scrollable region"
        placard: "1/3 Size handle"
        // Scrollbar handle should be 1/3 height of bar area when there are 3 pages of items
        HMIControls.Scrollable {
            id: scrollbarWithArrowsThreePages
            styleId: "scrollableWithButtonsStyle"
            height: 400
            width: 350
            content: [
                Repeater {
                    model: [ "red", "orange", "yellow", "green", "blue", "indigo",
                             "red", "orange", "yellow", "green", "blue", "indigo"]
                    Rectangle {
                        height: scrollbarWithArrowsThreePages.height / 4
                        width: parent.width
                        color: modelData
                    }
                }
            ]
        }
    }

    GalleryExhibit {
        label: "Scrollable region"
        placard: "Min Size handle"
        HMIControls.Scrollable {
            id: scrollbarNoArrowsSixPages
            height: 400
            width: 350
            content: [
                // Should yield min handle size according to asset height,
                // even though there are lots of pages
                Repeater {
                    model: [ "red", "orange", "yellow", "green", "blue", "indigo",
                             "red", "orange", "yellow", "green", "blue", "indigo"]
                    Rectangle {
                        height: scrollbarNoArrowsSixPages.height / 2
                        width: parent.width
                        color: modelData
                    }
                }
            ]
        }
    }

    GalleryExhibit {
        label: "Scrollable region"
        placard: "Stop at bounds"
        HMIControls.Scrollable {
            id: scrollbarStopAtBounds
            height: 400
            width: 350

            //Set the scrollable to stop at the bounds of the control
            //so that content cannot leave the borders
            flickable.boundsBehavior: Flickable.StopAtBounds

            content: [
                Repeater {
                    model: [ "red", "orange", "yellow", "green", "blue", "indigo",
                             "red", "orange", "yellow", "green", "blue", "indigo"]
                    Rectangle {
                        height: scrollbarStopAtBounds.height / 2
                        width: parent.width
                        color: modelData
                    }
                }
            ]
        }
    }

    GalleryExhibit {
        label: "Content Margins"
        Rectangle {
            height: 170
            width: 350
            color: "#ff00ff"

            HMIControls.Scrollable {
                height: 170
                width: 350

                contentTopMargin: 10
                contentBottomMargin: 10
                contentLeftMargin: 20

                content: [
                    Repeater {
                        model: [ "red", "orange", "yellow", "green", "blue", "indigo", "violet",
                                 "red", "orange", "yellow", "green", "blue", "indigo", "violet",
                                 "red", "orange", "yellow", "green", "blue", "indigo", "violet",
                                 "red", "orange", "yellow", "green", "blue", "indigo", "violet" ]
                        Rectangle {
                            height: 33
                            width: parent.width
                            color: modelData
                        }
                    }
                ]
            }
        }
    }

    GalleryExhibit {
        label: "Normal Scrollbar"
        Rectangle {
            height: 170
            width: 350
            color: "#ff00ff"

            HMIControls.Scrollable {
                height: 170
                width: 350

                content: [
                    Repeater {
                        model: [ "red", "orange" ]
                        Rectangle {
                            height: 33
                            width: parent.width
                            color: modelData
                        }
                    }
                ]
            }
        }
    }

    GalleryExhibit {
        label: "Forced Scrollbar"
        Rectangle {
            height: 170
            width: 350
            color: "#ff00ff"

            HMIControls.Scrollable {
                height: 170
                width: 350

                showScrollbar: true

                content: [
                    Repeater {
                        model: [ "red", "orange" ]
                        Rectangle {
                            height: 33
                            width: parent.width
                            color: modelData
                        }
                    }
                ]
            }
        }
    }
}
