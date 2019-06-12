import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import CTextQuery 1.0
Item {
//    width: 500
//    height: 400
anchors.fill: parent
    function addColunm(rolorstr, titlestr){

        var prefix = 'import QtQuick 2.7;import QtQuick.Controls 1.4;TableViewColumn {width: tableView.viewport.width/tableView.columnCount;';
        //创建TableViewColumn的代码
        //循环添加TableViewColumn
        var str = prefix  +"role:\"" + rolorstr + "\";title:\"" + titlestr + "\"}";
        tableView.addColumn(Qt.createQmlObject(str,tableView,"qrc:/TableViewItem.qml"));
    }

    function addRowData(d) {
        tablemode.append(d);
    }

    ListModel {
        id: tablemode
    }

    TableView{
        id :tableView
        anchors.fill: parent
        alternatingRowColors : false
        TableViewColumn {
            role: "Types"
            title: "Types"
            width: tableView.viewport.width/tableView.columnCount
        }
        TableViewColumn {
            role: "TimeCost"
            title: "TimeCost"
            width: tableView.viewport.width/tableView.columnCount
        }
        model: tablemode

        //自定义表头代理
        headerDelegate:
            Rectangle{
            //color: "#00498C"
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#085FB2" }
                GradientStop { position: 1.0; color: "#00498C" }
            }
            //color : styleData.selected ? "blue": "darkgray"
            width: 100;
            height: 40
            border.color: "black"
            //border.width: 1
            //radius: 5
            Text
            {
                anchors.centerIn : parent
                text: styleData.value
                font.pixelSize: parent.height*0.5
            }
        }

        //行代理可以修改行高等信息
        rowDelegate: Rectangle {
            height: 50
            color: "#052641"
            anchors.leftMargin: 2

        }
        itemDelegate: Rectangle{
            //color: "#052641"
            border.width: 1
            color : styleData.selected ? "#dd00498C": "#052641"
            Text {
                anchors.verticalCenter: parent.verticalCenter
                //anchors.fill: parent
                anchors.leftMargin: 5
                color : styleData.selected ? "#00CCFE": "white"
                text: styleData.value
                font.pixelSize: parent.height*0.4
            }
        }

        style: TableViewStyle{
            textColor: "white"
            highlightedTextColor : "#00CCFE"  //选中的颜色
            backgroundColor : "#052641"
        }
    }
    Component.onCompleted: {
        var mapdatas = taextQuery.getTypeAndCostTime()
        // var mapdatas = taextQuery.readMapData()
        console.log("begin to start .....")
        console.log(mapdatas)
        for(var i in mapdatas)
        {
            console.log("there is a num .....")
             console.log(i)
            item.addRowData({Types:i ,TimeCost:mapdatas[i]});
        }

    }
    CTextQuery{
        id:taextQuery
        //        onLoadData: {
        //            var mapdatas = taextQuery.readMapData()
        //             item.addRowData({title:"i" ,author:"aut"});
        //            console.log("begin to start .....")
        //             console.log(mapdatas)
        //            for(var i in mapdatas)
        //            {
        //                console.log("there is a num .....")
        //                //  modelDepartAirport.append({"text":i});//取Key
        //                //  modelDepartAirport.append({"text":departairPortlist[i]});//取Key对应的value
        //                item.addRowData({title:i ,author:mapdatas[i]});
        //                  item.addRowData({title:"1i" ,author:"a1ut"});
        //            }

        //        }
    }

}
