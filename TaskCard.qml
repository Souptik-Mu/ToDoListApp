import QtQuick
import QtQuick.Controls.Basic  // or fusion or
import QtQuick.Layouts
//import QtQuick.

Item {
    property bool taskDone: false
    property string taskText
    property int taskIndex

    signal taskComplete(int index , bool f)
    signal deleteTask(int index)

    //Material.theme: Material.Dark
    //Material.accent: Material.Purple



    height: 50
    width:500
    Rectangle{
        anchors.verticalCenter: parent.verticalCenter
        implicitWidth: row.implicitWidth
        implicitHeight: row.implicitHeight

        RowLayout{
            id: row
            spacing: 5
            CheckBox{
                id: checkBox

                Layout.margins: 10
                checked: taskDone
                onToggled: taskComplete(index,checked)


                //I dont like the style of the check button so change it
            }
            Label{
                id: taskName

                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: 320
                Layout.preferredHeight: 25
                Layout.margins: 8
                font {
                    family: "Ink Free"
                    pointSize: 14
                    strikeout: taskDone
                    //weight : taskDone ? 100 : 500

                }
                color: taskDone ? "#50000000" : "#000000"

                text: taskText.length==0 ? "Some TEmporary Text HEre!" : taskText

            }
            Button{
                Layout.alignment: Qt.AlignRight // Qt.AlignTrailing
                id: deleteButton
                display: AbstractButton.IconOnly
                hoverEnabled: true

                //Add delete(bin) icon as button
                icon.source : "qrc:/Assets/Images/Icons/trash.png"
                icon.height: 20

                background: Rectangle {
                    anchors.fill: parent
                    radius: width / 2
                    color: deleteButton.down      ? "#33000000"
                        : deleteButton.hovered ? "#1A000000"
                                                : "transparent"
                    border.width: 1
                }
                onClicked : deleteTask(index)

            }


        }



    }
}
