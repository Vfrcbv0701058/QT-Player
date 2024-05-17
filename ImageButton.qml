import QtQuick

Image {
    id: root

    // Create a signal that the button has been pressed
    signal clicked()

    opacity: buttonMouseArea.containsMouse ? 0.75 : 1
    mipmap: true

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
