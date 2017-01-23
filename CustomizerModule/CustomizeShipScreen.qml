import QtQuick 2.0
import QtQuick.Window 2.2

import "."

Grid {
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
                        name = "N";
                    }
                    else {
                        console.log("ALEXDEB: unknown while changing " + name);
                    }
                }
            }

            SelectionPointer {
                id: _selectionPointer
                anchors.fill: parent
                visible: false
            }

            Rectangle {
                id: _leftBorder

                anchors.left: parent.left
                width: 5
                height: parent.height
                color: "red"

                visible: ShipData.model.get(index - 1).name === "N"


            }

            Rectangle {
                id: _rightBorder

                anchors.right: parent.right
                width: 5
                height: parent.height
                color: "blue"

                //TODO: Does not get updated
                visible: ShipData.model.get(index + 1).name === "N"

                //This works
                Timer {
                    running: true; repeat: true;
                    interval: 1000
                    onTriggered: {
                        _rightBorder.visible = ShipData.model.get(index + 1).name === "N"
                    }
                }
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

                //visible:
            }


        }
    }
}
