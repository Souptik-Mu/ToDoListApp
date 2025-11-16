import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
//import QtQuick.

Item {
    property alias taskDone : checkBox.checked
    property alias taskText : taskName.text

    signal taskComplete(bool f)

    height: 100
    width:500
    Rectangle{
        anchors.verticalCenter: parent
        implicitWidth: row.implicitWidth
        implicitHeight: row.implicitHeight
        RowLayout{
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

                text: "Some TEmporary Text HEre!"

            }
            Button{
                Layout.alignment: Qt.AlignRight // Qt.AlignTrailing
                id: deleteButton

                //Add delete(bin) icon as button
                icon.source : "qrc:/Cross.png" // this is must be added in cmake manually
                implicitWidth: 86
                implicitHeight: 86

            }


        }



    }
}
