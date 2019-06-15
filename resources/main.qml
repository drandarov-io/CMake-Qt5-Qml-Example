import QtQuick 2.0
import QtQuick.Controls 1.0

ApplicationWindow
{
    visible: true
    width: 640
    height: 480
    title: qsTr("Cmake-Qt5-Qml-Example")

    TextEdit {
        id: textEdit
        x: 269
        y: 111
        width: 80
        height: 20
        text: qsTr("Text Edit")
        font.pixelSize: 12
    }

    Text {
        id: text1
        x: 147
        y: 200
        text: qsTr("Text")
        font.pixelSize: 12
    }

    Rectangle {
        id: rectangle
        x: 373
        y: 261
        width: 200
        height: 200
        color: "#ffffff"
    }

    MouseArea {
        id: mouseArea
        x: 462
        y: 91
        width: 100
        height: 100
    }
}

