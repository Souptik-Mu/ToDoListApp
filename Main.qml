import QtQuick
import QtQuick.Controls

//import InputField

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("ToDo List")

    Label{
        anchors.centerIn: parent
        height :20
        width : 100
        text : "Tasks"
    }
    InputField{
        height: 100
        width:500
        anchors.centerIn: parent
    }

}
