import QtQuick
import com.company.PlayerContoller

Window {    // Main window
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Music player")

    Rectangle{      // Application top bar
        id: topBar

        anchors{
            top: parent.top
            left: parent.left
            right: parent.right
        }

        height: 50
        color: "#5F8575"
    }

    Rectangle{      // Application main bar
        id: mainBar

        anchors{
            top: topBar.bottom
            left: parent.left
            right: parent.right
            bottom: bottomBar.top
        }

        color: "#1e1e1e"

        // First object AudioInfoBox which contains data about the first song
        AudioInfoBox{
            id: firstSong
            songIngex: 0
            tittle: "Eine Kleine Nachtmusik"
            authorName: "Wolfgan Amadeus Mozart"
            imageSource: "assets/images/mozartNachtmusik.jpg"
        }

        // Second object AudioInfoBox which contains data about the second song
        AudioInfoBox{
            id: secondSong
            songIngex: 1
            tittle: "Symphone No. 5"
            authorName: "Ludwig Van Beethowen"
            imageSource: "assets/images/SymphonyNo5.jpg"
        }

        // Third object AudioInfoBox which contains data about the third song
        AudioInfoBox{
            id: thirdSong
            songIngex: 2
            tittle: "Air on the G Strings"
            authorName: "Johann Sebastian Bach"
            // For video we should write path like this
            videoSource: "qrc:/Musicplayer/assets/videos/air.mp4"
        }
    }

    Rectangle{      // Application bottom bar
        id: bottomBar

        anchors{
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        height: 100
        color: "#333333"

        Row{
            anchors.centerIn: parent
            spacing: 20

            ImageButton{
                id: previousButton

                width: 50
                height: 50

                source: "assets/icons/previous_icon.png"

                onClicked: PlayerController.switchToPreviousSong()
            }

            ImageButton{
                id: playPause

                width: 50
                height: 50

                source: PlayerController.playing ? "assets/icons/pause_icon.png" : "assets/icons/play_icon.png"

                onClicked: PlayerController.playPause()
            }

            ImageButton{
                id: nextButton

                width: 50
                height: 50

                source: "assets/icons/next_icon.png"

                onClicked: PlayerController.switchToNextSong()
            }
        }
    }
}

//     // This is an invisible object that is used to control the currently playing song and to switch songs
//     QtObject {
//         id: PlayerController

//         property int currentSongIndex: 0  // Index of the current song, initialized to 0
//         property int songCount: 3  // Total number of songs, initialized to 3
//         property bool playing: false  // Boolean indicating if the player is currently playing, initialized to false

//         function playPause() {
//             // Toggles the playing state between true and false
//             playing = !playing
//         }

//         function switchToPreviousSong() {
//             // Switches to the previous song in the playlist
//             if (currentSongIndex > 0) {
//                 // If the current song is not the first one, decrement the index
//                 --currentSongIndex
//             } else {
//                 // If the current song is the first one, wrap around to the last song
//                 currentSongIndex = songCount - 1
//             }
//         }

//         function switchToNextSong() {
//             // Switches to the next song in the playlist
//             if (currentSongIndex + 1 >= songCount) {
//                 // If the current song is the last one, wrap around to the first song
//                 currentSongIndex = 0
//             } else {
//                 // If the current song is not the last one, increment the index
//                 ++currentSongIndex
//             }
//         }
//     }
