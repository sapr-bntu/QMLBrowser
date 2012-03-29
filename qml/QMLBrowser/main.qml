// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "Core"
import Qt 4.7
//import "storage.js" as Storage

Rectangle {
    id: webBrowser

    property string urlString : "http://www.bash.org.ru/"

    width: 960
    height: 600
    color: "#343434"

    Item { id: lineeditSpace
        width: parent.width
        height: 64}

    LineEdit {
        id: lineedit
        x: 0
        y: 0
        width: 745
        editUrl: webBrowser.urlString
        height: 70
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: comboBoxContainer.left
        anchors.rightMargin: 199
      // onUrlChangedChanged:   {comboBox.opacity=1}
    }


    WebView {
        id: webView
        x: 0
        y: 65
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        //progress: 0.800
        interactive: true
        boundsBehavior: Flickable.DragAndOvershootBounds
        anchors.topMargin: 1
        url: webBrowser.urlString
        onProgressChanged: lineedit.urlChanged = false
        anchors {
            top: lineeditSpace.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom }
    }

    Scroll {
        id: scroll1
        scrollArea: webView
        width: 15
        opacity: 1
        anchors {   right: parent.right
                    top: lineedit.bottom
                    bottom: parent.bottom
        }
    }

    //выплывающий  список

        ListModel {
            id: model

            ListElement {
                value: "http://www.google.com"
            }

            ListElement {
                value: "http://tut.by"

            }

            ListElement {
                value: "http://pogoda.by"
            }

            ListElement {
                value: "http://kinopoisk.ru"
            }

            ListElement {
                value: "http://filmix.com"
            }
        }

        Rectangle {
            id: comboBoxContainer
            x: 764
            y: 25
            width: 0
            height: 30

            anchors.right: parent.right
            anchors.top: parent.top


            anchors.leftMargin: parent.width/2

            color: "#343434"
            visible: true
            anchors.rightMargin: 16
            opacity: 1
            anchors.topMargin: 25


            ComboBox {
                id: comboBox
                x: -209
                y: 0
                width: 180
                height: 30
                anchors.top: parent.top
                anchors.topMargin: 0
                smooth: false
                visible: true
                opacity: 1
                initialText: ""
                maxHeight: webBrowser.height/5
                listModel: model

//                onExpanded: {
//                    comboBoxContainer.height = webBrowser.height/4
//                }

                onClosed: {
                    comboBoxContainer.height = 0
                }
            }
        }
        states: [
            State {
                name: "State1"
            }
        ]

}
