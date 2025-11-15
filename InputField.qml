import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects

Item {
    //property string inputValue
    signal clickedAdd(string inputValue)

    height: 100
    width:500
    anchors.margins: 10
    Rectangle{
        //anchors.fill: parent
        anchors.centerIn : parent
        implicitWidth: row.implicitWidth
        implicitHeight: row.implicitHeight
        //color: "#a1a1e1"
        radius: 10
        border.width: 1

        RowLayout{
            id : row
            spacing: 2

            TextField{
                id : inputText
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: 320
                Layout.preferredHeight: 25
                Layout.margins: 8
                font {
                    family: "Comic Sans MS" //"Ink Free"
                    pointSize: 12
                }
                placeholderText: "Enter task to add..."
                background: Rectangle {
                                color: "white"
                                border.width: 0
                            }
                //onTextChanged: inputValue = text
            }
            RoundButton{
                id: addButton
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: 80
                Layout.preferredHeight: 25
                Layout.margins: 8

                text : "Add Task"
                font.family: "Comic Sans MS"

                background: Rectangle {
                    radius: parent.height/2
                    border.width: 1
                    border.color: "#2A000000"
                    color: addButton.hovered? "#ECEBf1": "#FFFFFF"
                }
                onClicked: clickedAdd(inputText.text)
            }
        }
    }


}
