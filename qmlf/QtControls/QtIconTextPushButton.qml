import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick 2.0
Item{
    Flickable {
        anchors.fill: parent
        contentWidth: parent.width * 2
        contentHeight: parent.height * 2

        ScrollBar.horizontal: ScrollBar { id: hbar; active: vbar.active }
        ScrollBar.vertical: ScrollBar { id: vbar; active: hbar.active }
        ScrollView{
            ScrollBar.vertical.policy: ScrollBar.AlwaysOn
            ScrollBar {
                id: scrollBar
                objectName: "scrollBar"
                hoverEnabled: true
                active: true
                orientation: Qt.Vertical
                size: frame.height / content.height
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.bottom: parent.bottom
            }
            ListModel {
                id: listModel

                ListElement { place:"Home"; details: "Set up and ge  there form anywhere"; distance:"3.3mi"}
                ListElement { place:"KFC"; details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
                ListElement { place:"Amarican"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
                ListElement { place:"China"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
                ListElement { place:"Crian";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "5.4mi" }
                ListElement { place:"Srtgf";details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
                ListElement { place:"Dlalihne";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
                ListElement { place:"Uk"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
                ListElement { place:"Home"; details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
                ListElement { place:"KFC"; details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
                ListElement { place:"Amarican"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
                ListElement { place:"China"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
                ListElement { place:"Crian";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "5.4mi" }
                ListElement { place:"Srtgf";details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
                ListElement { place:"Dlalihne";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
                ListElement { place:"Uk"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
                ListElement { place:"Home"; details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
                ListElement { place:"KFC"; details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
                ListElement { place:"Amarican"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
                ListElement { place:"China"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
                ListElement { place:"Home"; details: "Set up and ge  there form anywhere"; distance:"3.3mi"}
                ListElement { place:"KFC"; details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
                ListElement { place:"Amarican"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
                ListElement { place:"China"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
                ListElement { place:"Crian";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "5.4mi" }
                ListElement { place:"Srtgf";details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
                ListElement { place:"Dlalihne";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
                ListElement { place:"Uk"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
                ListElement { place:"Home"; details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
                ListElement { place:"KFC"; details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
                ListElement { place:"Amarican"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
                ListElement { place:"China"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
                ListElement { place:"Crian";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "5.4mi" }
                ListElement { place:"Srtgf";details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
                ListElement { place:"Dlalihne";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
                ListElement { place:"Uk"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
                ListElement { place:"Home"; details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
                ListElement { place:"KFC"; details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
                ListElement { place:"Amarican"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
                ListElement { place:"China"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
                ListElement { place:"Home"; details: "Set up and ge  there form anywhere"; distance:"3.3mi"}
                ListElement { place:"KFC"; details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
                ListElement { place:"Amarican"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
                ListElement { place:"China"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
                ListElement { place:"Crian";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "5.4mi" }
                ListElement { place:"Srtgf";details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
                ListElement { place:"Dlalihne";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
                ListElement { place:"Uk"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
                ListElement { place:"Home"; details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
                ListElement { place:"KFC"; details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
                ListElement { place:"Amarican"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
                ListElement { place:"China"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
                ListElement { place:"Crian";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "5.4mi" }
                ListElement { place:"Srtgf";details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
                ListElement { place:"Dlalihne";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
                ListElement { place:"Uk"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
                ListElement { place:"Home"; details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
                ListElement { place:"KFC"; details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
                ListElement { place:"Amarican"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
                ListElement { place:"China"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
                ListElement { place:"Home"; details: "Set up and ge  there form anywhere"; distance:"3.3mi"}
                ListElement { place:"KFC"; details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
                ListElement { place:"Amarican"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
                ListElement { place:"China"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
                ListElement { place:"Crian";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "5.4mi" }
                ListElement { place:"Srtgf";details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
                ListElement { place:"Dlalihne";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
                ListElement { place:"Uk"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
                ListElement { place:"Home"; details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
                ListElement { place:"KFC"; details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
                ListElement { place:"Amarican"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
                ListElement { place:"China"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
                ListElement { place:"Crian";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "5.4mi" }
                ListElement { place:"Srtgf";details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
                ListElement { place:"Dlalihne";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
                ListElement { place:"Uk"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
                ListElement { place:"Home"; details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
                ListElement { place:"KFC"; details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
                ListElement { place:"Amarican"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
                ListElement { place:"China"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
                ListElement { place:"Home"; details: "Set up and ge  there form anywhere"; distance:"3.3mi"}
                ListElement { place:"KFC"; details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
                ListElement { place:"Amarican"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
                ListElement { place:"China"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
                ListElement { place:"Crian";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "5.4mi" }
                ListElement { place:"Srtgf";details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
                ListElement { place:"Dlalihne";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
                ListElement { place:"Uk"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
                ListElement { place:"Home"; details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
                ListElement { place:"KFC"; details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
                ListElement { place:"Amarican"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
                ListElement { place:"China"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }
                ListElement { place:"Crian";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "5.4mi" }
                ListElement { place:"Srtgf";details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
                ListElement { place:"Dlalihne";details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
                ListElement { place:"Uk"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
                ListElement { place:"Home"; details: "Set up and ge  there form anywhere"; distance: "3.3mi"}
                ListElement { place:"KFC"; details: "KFC 12653 mICHIGAN Ave,Dearborn,MI 48..."; distance: "1.4mi"}
                ListElement { place:"Amarican"; details: "15712 Michigan Ave,Dearborn,MI 45343... "; distance: "5.3mi"}
                ListElement { place:"China"; details: "4603 Westland st, Dearborn, MI 48126......"; distance: "5.3mi" }

            }
            Column{
                //define a  sighnal distguish with the  pressed
                signal textButtonClicked()

                Repeater{
                    model:listModel
                    Rectangle{
                        id:contentRect
                        width: 170
                        height: 140
                        opacity: 0.7
                        Image {
                            anchors.fill: contentRect
                            source: "qrc:qmlf/8inch/btn-tile-disable.png"
                        }

                        Image {
                            id: pic
                            width: 50
                            height:50
                            anchors{
                                left:contentRect.left
                                leftMargin: 50
                                top:contentRect.top
                                topMargin: 7
                            }
                            //   anchors.top: rootRect.top
                            source: "qrc:qmlf/8inch/icon-60-call-disable.png"
                        }
                        Text {
                            id: label
                            anchors.top: pic.bottom
                            anchors.topMargin: 12
                            anchors.bottomMargin : 12
                            anchors.horizontalCenter: pic.horizontalCenter
                            text: place// This is available in all editors.
                            color: "#4b4e4f"
                            font.pixelSize :25

                        }

                        states: [
                            State{
                                name: "clicked"
                                PropertyChanges { target: label; color: "green"}
                                PropertyChanges { target: pic;  source: "qrc:qmlf/8inch/icon-60-call-green.png"}
                            },
                            State{
                                name: "unciked"
                                PropertyChanges { target: label; color: "#768085"}
                                PropertyChanges { target: pic;  source: "qrc:qmlf/8inch/icon-60-call-disable.png"}
                            }
                        ]

                        MouseArea{
                            anchors.fill: parent
                            onPressed: {
                                contentRect.state === "clicked" ? contentRect.state = "" : contentRect.state = "clicked";
                                contentRect.textButtonClicked()
                            }
                            onReleased: {
                                contentRect.state = "unciked"
                            }
                        }




                    }
                }
            }
        }
    }
}
