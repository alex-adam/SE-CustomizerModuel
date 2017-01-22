import QtQuick 2.0

Rectangle {

    property int pointerWidth: 3
    color: "transparent"

    Rectangle {
        x: 0
        y: 0
        height: parent.height / 4
        width: parent.pointerWidth
        color: "white"
    }

    Rectangle {
        x: 0
        y: 0
        height: parent.pointerWidth
        width: parent.height / 4
        color: "gray"
    }

    Rectangle {
        x: parent.width - width
        y: 0
        height: parent.height / 4
        width: parent.pointerWidth
        color: "orange"
    }

    Rectangle {
        x: parent.width - width
        y: 0
        height: parent.pointerWidth
        width: parent.height / 4
        color: "red"
    }

    Rectangle {
        x: 0
        y: parent.height - height
        height: parent.height / 4
        width: parent.pointerWidth
        color: "blue"
    }

    Rectangle {
        x: 0
        y: parent.height - height
        height: parent.pointerWidth
        width: parent.height / 4
        color: "green"
    }

    Rectangle {
        x: parent.width - width
        y: parent.height - height
        height: parent.height / 4
        width: parent.pointerWidth
        color: "brown"
    }

    Rectangle {
        x: parent.width - width
        y: parent.height - height
        height: parent.pointerWidth
        width: parent.height / 4
        color: "black"
    }
}
