import QtQuick

// This file is created to describe a layout that includes the basic elements of a song: its title, album artwork, and author

Item {
    id: root

    // Required property, without it the application will not work
    required property int songIngex     // Property that allows each song to have its own index
    property alias tittle: tittleText.text      // pass the song title to tittleText
    property alias authorName: authorText.text      // pass the author name to authorText
    property alias imageColor: albumImage.color     // set album's color for each song

    visible: playerController.curentSongIndex === root.songIngex

    // Create anchors for this layout
    anchors{
        verticalCenter: parent.verticalCenter
        left: parent.left
        right: parent.right
        margins: 20
    }

    // Song's image
    Rectangle{
        id: albumImage

        anchors{
            verticalCenter: parent.verticalCenter
            left: parent.left
        }

        // Sizes
        width: 150
        height: 150
    }

    //Song name's text style
    Text{
        id: tittleText

        anchors{
            left: albumImage.right
            right: parent.right
            bottom: parent.verticalCenter
            margins: 20
        }

        // Properties
        color: "white"
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere

        // Font
        font{
            pixelSize: 20
            bold: True
        }
    }

    //Author name's text style
    Text{
        id: authorText

        anchors{
            top: parent.verticalCenter
            left: tittleText.left
            right: parent.right
            topMargin: 5
        }

        // Properties
        color: "gray"
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere

        // Font
        font{
            pixelSize: 16
        }
    }
}
