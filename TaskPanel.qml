import QtQuick

Item {
    ListView{
        id: taskList
        width: 400
        height: 600

        // model would be a cpp class which will inherit from QAbstructListModel class
        model: ListModel {
            ListElement { title: "Buy milk"; done: false }
            ListElement { title: "Finish project"; done: true }
        }

        delegate: TaskCard {
            title: model.title
            done: model.done
        }

    }
}
