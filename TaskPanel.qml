import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

//not in work, make it work, keep all the styles..
Item {
    property var taskModel

    signal taskCompleted(int idx, bool state)
    signal taskDeleted(int idx)
    height: 400
    width: 400
    Rectangle{
        anchors.fill: parent
        anchors.centerIn : parent
        color: "#a1a1e1"
        radius: 10

        border.width: 1


        ListView {
            id: taskList
            anchors.fill: parent


            spacing: 1
            clip: true
            boundsBehavior: Flickable.StopAtBounds
            ScrollBar.vertical: ScrollBar{}

            // Accept model from parent
            // model would be a cpp class which will inherit from QAbstructListModel clas

            model: taskModel

            delegate: TaskCard {
                //anchors.horizontalCenter: parent.horizontalCenter
                anchors.centerIn: taskList

                taskText: title
                taskDone: done
                taskIndex: index

                // Re-emit signals to parent
                onTaskComplete: (idx, state) => taskCompleted(idx, state)
                onDeleteTask:  (idx) => taskDeleted(idx)
            }
        }

    }
}
