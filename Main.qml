import QtQuick
import QtQuick.Controls

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


    TextField{
        placeholderText: "Enter Task  add"
    }
    InputField{

    }

}
