import QtQuick 2.0
import Sailfish.Silica 1.0
import "../js/Logic.js" as Logic

SilicaListView {
    width: parent.itemWidth
    height: parent.height
    id: listView
    model: movieModel
    header: PageHeader {
        title: "Repertoar"
    }
    PullDownMenu {
        MenuItem {
            text: "O aplikaciji"
            onClicked: pageStack.push(Qt.resolvedUrl("About.qml"));
        }
        MenuItem {
            text: "Refresh"
            onClicked: Logic.refreshPlayingNow();
        }
    }
    BusyIndicator {
        id: loadingIndicator
        running: true
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        size: BusyIndicatorSize.Large
    }
    delegate: BackgroundItem {
        height: 200
        id: delegate
        Image {
            id: moviePoster
            source: image
            anchors.top: parent.top
            anchors.margins: {
                topMargin: 5
                bottomMargin: 5
            }
            anchors.bottom: parent.bottom
            x: Theme.paddingLarge
            fillMode: Image.PreserveAspectFit
        }
        Label {
            id: titleLabel
            text: title
            anchors.left: moviePoster.right
            anchors.right: parent.right
            anchors.leftMargin: 5
            anchors.rightMargin: 5
            wrapMode: Text.WordWrap
            color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor

        }
        Label {
            id: genreLabel
            text: genre
            anchors.top: titleLabel.bottom
            anchors.left: moviePoster.right
            anchors.right: parent.right
            anchors.leftMargin: 5
            anchors.rightMargin: 5
            elide: Text.ElideRight
            color: delegate.highlighted ? Theme.secondaryHighlightColor : Theme.secondaryColor
            font.pixelSize: Theme.fontSizeSmall
        }
        Label {
            id: terminsLabel
            text: termins
            anchors.top: genreLabel.bottom
            anchors.left: moviePoster.right
            anchors.right: parent.right
            anchors.leftMargin: 5
            anchors.rightMargin: 5
            elide: Text.ElideRight
            width: 200
            color: delegate.highlighted ? Theme.secondaryHighlightColor : Theme.secondaryColor
            font.pixelSize: Theme.fontSizeSmall
        }
        Label {
            id: runtimeLabel
            text: runtime
            anchors.top: terminsLabel.bottom
            anchors.left: moviePoster.right
            anchors.right: parent.right
            anchors.leftMargin: 5
            anchors.rightMargin: 5
            elide: Text.ElideRight
            color: delegate.highlighted ? Theme.secondaryHighlightColor : Theme.secondaryColor
            font.pixelSize: Theme.fontSizeSmall
        }

        onClicked: pageStack.push(Qt.resolvedUrl("Movie.qml"), {
                                      title: title,
                                      genre: genre,
                                      image: image,
                                      runtime: runtime,
                                      trailer: trailer,
                                      termins: termins,
                                      imdbid: imdbid
                                  })
    }
    VerticalScrollDecorator {}

    ListModel {
        id: movieModel
    }

    Component.onCompleted: Logic.refreshPlayingNow();
}

