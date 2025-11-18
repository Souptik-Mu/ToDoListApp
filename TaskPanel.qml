import QtQuick

//not in work, make it work, keep all the styles..
Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: 20

            ListView {
                id: taskList
                anchors.centerIn: parent          // THIS is the magic line
                width: 520                        // a bit wider than your cards
                height: parent.height
                clip: true
                spacing: 8

                model: todoModel
                delegate: TaskCard {
                    width: taskList.width
                    taskText: model.title
                    taskDone: model.done
                }
            }
        }
