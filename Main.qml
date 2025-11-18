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
            //anchors.centerIn: parent

            onClickedAdd: (inputValue) =>{
                //inputValue
                console.log("poiko :" + inputValue)
                todoModel.append({
                                    "title": inputValue + ""+todoModel.count,
                                    "done" : false,
                                    //"index" : todoModel.count

                                 })
            }

        }
        ListView{
            Layout.alignment: Qt.AlignHCenter
            Layout.fillWidth: true
            Layout.leftMargin: 10
            id: taskList
            width: 500
            height: 400
            clip: true
            boundsBehavior: Flickable.StopAtBounds
            //ScrollBar.vertical: ScrollBar{}

            // model would be a cpp class which will inherit from QAbstructListModel class
            model: ListModel {
                id : todoModel
                //ListElement { title: "Buy milk"; done: false }
                //ListElement { title: "Finish project"; done: true }
            }

            delegate: TaskCard {
                id : taskDeligate
                taskText: todoModel.title
                taskDone: todoModel.done
                taskIndex:  todoModel.index

                onTaskComplete: (idx ,state) => {
                    todoModel.setProperty(idx, "done", state)
                                     console.log("chekc"+idx+"  , "+state)
                }

                onDeleteTask: (idx) => {
                    console.log("diy"+idx)
                    todoModel.remove(idx)

                }
            }

        }
    }

}
