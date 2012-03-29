// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import QtQuick 1.0
FocusScope {
    id: container
    signal clicked
    property string source
    property string text
    property string color: "#ffffff"
    property int textSize: 8
    property string borderColor: "#00000000"
    property int borderWidth: 0
    property int radius: 0
    property int margin: 0

    Rectangle {
        id: buttonRectangle
        anchors.fill: parent
        color: "#00000000"
        radius: container.radius
        border.width: container.borderWidth
        border.color: container.borderColor

        Image {
            id: image
            smooth: true
            fillMode: Image.PreserveAspectFit
            anchors.right: parent.right
            anchors.top: parent.top
            height: 10
            width: parent.height
            anchors.topMargin: container.margin
            anchors.bottomMargin: container.margin
            anchors.leftMargin: container.margin
            anchors.rightMargin: container.margin
            source: container.source
        }

        Item {
            anchors.left: parent.left
            anchors.right: image.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: container.margin*2

            Text {
                color: container.color
                anchors.centerIn: parent
                font.pixelSize: container.textSize
                text: container.text+" "
                font.bold: true
            }
        }

        MouseArea {
            id: mouseArea;
            anchors.fill: parent
//            onDoubleClicked: {
//            comboBoxButton.opacity=0
//            }
            onClicked: {
//                if (buttonRectangle.state == "pressed")
//                {container.opacity =0}
//                else
//                {
//                  container.opacity =1
//                }
                buttonRectangle.state = "pressed"
                stateTimer.start()
                container.clicked()

//                urlString=text
//                text = ListElement.objectName
            }
        }

        states: State {
            name: "pressed"
            PropertyChanges { target: image; scale: 0.7 }
        }

        Timer {
            id: stateTimer
            interval: 200;
            repeat: false
            onTriggered: buttonRectangle.state = 'State0'
        }

        transitions: Transition {
            NumberAnimation { properties: "scale"; duration: 200; easing.type: Easing.InOutQuad }
        }
    }
}
