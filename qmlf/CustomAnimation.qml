import QtQuick 2.9
import QtQuick.Controls 2.2
Canvas {
    id: canvas
    width: canvas.width
    height: canvas.height
    antialiasing: true
    property string text
    property color primaryColor: "orange"
    property color secondaryColor: "magenta"
    property real centerWidth: width / 2
    property real centerHeight: height / 2
    property real radius: Math.min(canvas.width - 10, canvas.height - 10) / 2
    property real minimumValue: 0
    property real maximumValue: 180
    property real currentValue: 0
    property real angle:currentValue * 3 * Math.PI/maximumValue
    property real angleOffset: - Math.PI / 2
    onPrimaryColorChanged: requestPaint()
    onSecondaryColorChanged: requestPaint()
    onMinimumValueChanged: requestPaint()
    onMaximumValueChanged: requestPaint()
    onCurrentValueChanged: requestPaint()
    onPaint: {
            var ctx = getContext("2d");
            ctx.save();
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            ctx.beginPath();
            ctx.lineWidth = 3;
            ctx.strokeStyle = secondaryColor;
            ctx.arc(canvas.centerWidth,
                    canvas.centerHeight,
                    canvas.radius,
                    canvas.angleOffset,
                    canvas.angleOffset + canvas.angle);
            ctx.stroke();
            ctx.restore();
    }
}
