import QtQuick 2.0
import QtQuick.Window 2.2

import "."

Grid {
    id: _grid
    rows: 4; columns: 5

    Repeater {
        model: ShipData.model

        delegate:
        Rectangle {
            width: Window.width / 5
            height: Window.height / 4
            color: "yellow"

            Text {
                anchors.centerIn: parent
                text: name
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                onEntered: {
                    _selectionPointer.visible = true
                }
                onExited: {
                    _selectionPointer.visible = false
                }
                onClicked: {
                    if (name == "N") {
                        name = "B";
                    }
                    else if (name == "B") {
                        name = "S";
                    }
                    else {
                        name = "N";
                    }
                }
            }

            SelectionPointer {
                id: _selectionPointer
                anchors.fill: parent
                visible: false
            }

            Timer {
                running: true; repeat: true;
                interval: 1000
                onTriggered: {
                    if (ShipData.model.get(index).name === "N") {
                        _leftBorder.visible = true;
                        _rightBorder.visible = true;
                    }
                    else {
                        _rightBorder.visible = ShipData.model.get(index + 1).name === "N"
                        _leftBorder.visible = ShipData.model.get(index - 1).name === "N"
                    }
                    if (ShipData.model.get(index).name === "S") {
                        _topBorder.visible = !ShipData.model.get(index - _grid.columns).name === "S"
                        _bottomBorder.visible = !ShipData.model.get(index + _grid.columns).name === "S";
                    }
                    else {
                        _topBorder.visible = true;
                        _bottomBorder.visible = true;
                    }
                }
            }

            Rectangle {
                id: _leftBorder

                anchors.left: parent.left
                width: 5
                height: parent.height
                color: "red"   
            }

            Rectangle {
                id: _rightBorder

                anchors.right: parent.right
                width: 5
                height: parent.height
                color: "blue"
            }

            Rectangle {
                id: _topBorder

                anchors.top: parent.top
                width: parent.width
                height: 5
                color: "black"
            }

            Rectangle {
                id: _bottomBorder

                anchors.bottom: parent.bottom
                width: parent.width
                height: 5
                color: "black"
            }
        }
    }
}
