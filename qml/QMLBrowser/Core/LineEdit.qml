// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import QtQuick 1.0

Image {
    id: lineedit

    property alias editUrl: urlInput.url
    property bool urlChanged: false

    x: webView.contentX < 0 ? -webView.contentX : webView.contentX > webView.contentWidth-webView.width
              ? -webView.contentX+webView.contentWidth-webView.width : 0
    y: {
               if (webView.progress < 1.0)
                   return 0;
               else {
                   webView.contentY < 0 ? -webView.contentY : webView.contentY > webView.height
               ? -webView.height : -webView.contentY
               }
           }

    Column {
        width: parent.width

        Item {
            width: parent.width; height: 20
            Text {
                anchors.centerIn: parent
                text: webView.title
                font.pixelSize: 14
                font.bold: true
                color: "white"
                styleColor: "black"
                style: Text.Sunken
            }
        }

        Item {
            id: item1
            width: parent.width
            height: 40

            Button {
                id: backButton
                action: webView.back;
                image: "img/button_left2.bmp"
                anchors {   left: parent.left
                            bottom: parent.bottom }
            }

            Button {
                id: nextButton
                anchors.left: backButton.right
                action: webView.forward
                image: "img/batton_right2.bmp"
            }

            Url {
                id: urlInput
                x: 88
                y: 0
                height: 40
                anchors.right: parent.right
                anchors.rightMargin: 99
                anchors.leftMargin: 20
                anchors { left: nextButton.right
                }
                image: "img/display.png"
                onUrlEntered: {
                    webBrowser.urlString = url
                    webBrowser.focus = true
                    lineedit.urlChanged = false
                }
                onUrlChanged: lineedit.urlChanged = true
            }

            Button {
                id: reloadButton
                x: 619
                y: 0
                width: 33
                height: 40
                anchors.right: parent.right
                anchors.rightMargin: 66
                action: webView.reload
                image: "img/update4.bmp"
            }

            Text {
                id: quitButton
                style: Text.Sunken
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 18
                width: 60

           }

            Button {
                id: stopButton
                y: 0
                height: 40
                anchors.right: parent.right
                anchors.rightMargin: 48
                anchors.left: reloadButton.right
                anchors.leftMargin: 18
                opacity: 1
                action: webView.stop
                image: "img/x.bmp"

            }

        }
    }
}

