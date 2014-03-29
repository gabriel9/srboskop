import QtQuick 2.0
import Sailfish.Silica 1.0
import "../js/Logic.js" as Logic

Page {
    id: page

    SilicaListView {
        id: listView
        model: model1
        anchors.fill: parent
        header: PageHeader {
            title: "Repertoar"
        }

        PullDownMenu {
            MenuItem {
                text: "Refresh"
                onClicked: Logic.refreshCinema();
            }
        }

        delegate: BackgroundItem {
            height: 150
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
                anchors.leftMargin: 5
                color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor

            }
            Label {
                id: genreLabel
                text: genre
                anchors.left: moviePoster.right
                anchors.top: titleLabel.bottom
                anchors.leftMargin: 5
                color: delegate.highlighted ? Theme.secondaryHighlightColor : Theme.secondaryColor
                font.pixelSize: Theme.fontSizeSmall
            }
            Label {
                id: terminsLabel
                text: termini
                anchors.left: moviePoster.right
                anchors.top: genreLabel.bottom
                anchors.leftMargin: 5
                color: delegate.highlighted ? Theme.secondaryHighlightColor : Theme.secondaryColor
                font.pixelSize: Theme.fontSizeSmall
            }
            Label {
                id: runtimeLabel
                text: runtime
                anchors.left: moviePoster.right
                anchors.top: terminsLabel.bottom
                anchors.leftMargin: 5
                color: delegate.highlighted ? Theme.secondaryHighlightColor : Theme.secondaryColor
                font.pixelSize: Theme.fontSizeSmall
            }

            onClicked: pageStack.push(Qt.resolvedUrl("Movie.qml"), {title: title, genre: genre, image: image, runtime: runtime})
        }
        VerticalScrollDecorator {}
    }

    ListModel {
        id: model1
    }

    Component.onCompleted: Logic.refreshCinema();
}
