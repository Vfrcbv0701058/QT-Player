import QtQuick

Item {
    id: root

    property color color: "gray"    // Button layout colour
    property alias text: buttonText.text    //

    // Create a signal that the button has been pressed
    signal clicked()

    // The rectangle that plays the role of the background colour
    Rectangle{
        id:background
        anchors.fill: parent

        // Сolour change logic
        color: if (buttonMouseArea.containsPress){
                    return Qt.lighter(root.color)   // When the button is pressed, the colour of the button becomes lighter
                } else if (buttonMouseArea.containsMouse){
                    return Qt.darker(root.color)    // When the mouse is hovered over a button, the colour of the button becomes lighter
                } else {
                    return root.color   // In other cases, the colour remains unchanged
                }
    }

    // Button text
    Text{
        id: buttonText
        anchors.centerIn: parent
    }

    // Defines an area that can handle mouse events such as clicks and mouseovers
    MouseArea{
        id: buttonMouseArea
        // Fills the entire area of the parent element, i.e. Rectangle
        anchors.fill:parent
        // Enables handling of cursor pointing events
        hoverEnabled: true
        // Mouse click event handler
        onClicked: {
            // Emits a clicked signal at the root item (Item)
            root.clicked()
        }
    }
}
