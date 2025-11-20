import QtQuick
import QtQuick.Controls
import QtQuick.Layouts



Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("ToDo List")
    ColumnLayout{
        Label{
            //anchors.centerIn: parent
            height :20
            width : 100
            text : "Tasks"
        }
        InputField{
            Layout.alignment: Qt.AlignHCenter
            Layout.fillWidth: true
            height: 100
            width:500
            //anchors.hghcenterIn: parent

            onClickedAdd: (inputValue) =>{
                //inputValue
                console.log("poiko :" + inputValue)
                todoModel.append({
                                    "title": inputValue,
                                    "done" : false,
                                    //"index" : todoModel.count

                                 })
            }
        }
        TaskPanel{
            Layout.alignment: Qt.AlignHCenter
            Layout.fillWidth: true
            Layout.leftMargin: 10
            taskModel : todoModel

            onTaskCompleted: (idx, state) => {
                todoModel.setProperty(idx, "done", state)
                console.log("complete:", idx, state)
            }

            onTaskDeleted: (idx) => {
                todoModel.remove(idx)
                console.log("deleted:", idx)
            }
        }
    }
    ListModel {
        id : todoModel
        //ListElement { title: "Buy milk"; done: false }
        //ListElement { title: "Finish project"; done: true }
    }
}
