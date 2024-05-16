import QtQuick


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
            imageColor: "red"
        }

        // Second object AudioInfoBox which contains data about the second song
        AudioInfoBox{
            id: secondSong
            songIngex: 1
            tittle: "Symphone No. 5"
            authorName: "Ludwig Van Beethowen"
            imageColor: "yellow"
        }

        // Third object AudioInfoBox which contains data about the third song
        AudioInfoBox{
            id: thirdSong
            songIngex: 2
            tittle: "Air on the G Strings"
            authorName: "Johann Sebastian Bach"
            imageColor: "purple"
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

            TextButton{
                id: previousButton

                width: 50
                height: 50

                text: "<"

                onClicked: playerController.switchToPreviousSong()
            }

            TextButton{
                id: playPause

                width: 75
                height: 50

                text: playerController.playing ? "pause" : "Play"

                onClicked: playerController.playPause()
            }

            TextButton{
                id: nextButton

                width: 50
                height: 50

                text: ">"

                onClicked: playerController.switchToNextSong()
            }
        }
    }

    // This is an invisible object that is used to control the currently playing song and to switch songs
    QtObject{
        id: playerController

        property int curentSongIndex: 0
        property int songCount: 3
        property bool playing: false

        function playPause(){
            playing = !playing
        }

        function switchToPreviousSong(){
            if (curentSongIndex > 0){
                --curentSongIndex
            } else {
                curentSongIndex = songCount - 1
            }
        }

        function switchToNextSong(){
            if (curentSongIndex + 1 >= songCount){
                curentSongIndex = 0
            } else {
                ++curentSongIndex
            }
        }

    }
}
