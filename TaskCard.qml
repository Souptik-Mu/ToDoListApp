import QtQuick
import QtQuick.Controls.Material  // or fusion or
import QtQuick.Layouts
//import QtQuick.

Item {
    property alias taskDone : checkBox.checked
    property alias taskText : taskName.text

    signal taskComplete(bool f)

    //Material.theme: Material.Dark
    //Material.accent: Material.Purple

    height: 100
    width:500
    Rectangle{
        //anchors.verticalCenter: parent
        implicitWidth: row.implicitWidth
        implicitHeight: row.implicitHeight

        RowLayout{
            id: row
            spacing: 5
            CheckBox{
                id: checkBox

                Layout.margins: 10
                onToggled: taskComplete(checked)


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

                text: "Some TEmporary Text HEre!" + Qt.application.style

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

            }


        }



    }
}
