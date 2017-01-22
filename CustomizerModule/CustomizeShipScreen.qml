import QtQuick 2.0
import QtQuick.Window 2.2

Grid {
    rows: 4; columns: 5

    ShipData {
        id: _shipData
    }

    Repeater {
        model: _shipData.model

        delegate:
        Rectangle {
            width: Window.width / 5
            height: Window.height / 4
            color: "yellow"

            Text {
                anchors.centerIn: parent
                text: modelData
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
            }

            SelectionPointer {
                id: _selectionPointer
                anchors.fill: parent
                visible: false
            }
        }
    }
}
