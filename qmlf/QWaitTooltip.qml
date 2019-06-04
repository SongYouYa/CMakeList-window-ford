import QtQuick 2.9
import QtQuick.Controls 2.2
Rectangle{
    id:rect
    radius: width / 2
    property int i: 0
    color:"#C0C0C0"
    property bool isStop:false

    Rectangle {
        id: rectangle
        anchors.centerIn: parent
        width: parent.width - 6
        height: width
        radius: width / 2
        CustomAnimation{//动画视图
            id:customAnimation
            width: parent.width - 6
            height: width
            anchors.centerIn: parent
            currentValue: rotation - i;
        }
        RotationAnimation{//旋转动画
            id:rotationAnimation
            target: customAnimation
            from:i
            to:i + 90
            direction: RotationAnimation.Clockwise
            duration: 3002
            onStopped: {
                if(isStop) return;
                i += 90;
                rotationAnimation.start();
            }
        }
    }
    Component.onCompleted: {
        rotationAnimation.start();
    }
    function stop(){
        console.log("调用停止动画",isStop);
        isStop = true;
        console.log("是否停止+++++",isStop);
        rotationAnimation.stop();
        console.log("是否停止-------",isStop);
        numberAnimation.start();
    }
    NumberAnimation {//缩小动画
        id:numberAnimation
        target: rect;
        property: "scale"; to: 0.2;
        duration: 500
        onStopped: {
            isShowWeb = true;
        }
    }
}
