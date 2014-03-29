import QtQuick 2.0
import Sailfish.Silica 1.0
import "../js/Logic.js" as Logic

SilicaListView {
    width: parent.itemWidth
    height: parent.height
    id: listView
    model: comingSoonModel
    header: PageHeader {
        title: "Najave"
    }
    PullDownMenu {
        MenuItem {
            text: "O aplikaciji"
            onClicked: pageStack.push(Qt.resolvedUrl("About.qml"));
        }
        MenuItem {
            text: "Refresh"
            onClicked: Logic.refreshComingSoon();
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
            anchors.right: parent.right
            elide: Text.ElideRight
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
            wrapMode: Text.WrapAnywhere
            color: delegate.highlighted ? Theme.secondaryHighlightColor : Theme.secondaryColor
            font.pixelSize: Theme.fontSizeSmall
        }
        Label {
            id: terminsLabel
            text: termini
            anchors.top: genreLabel.bottom
            anchors.left: moviePoster.right
            anchors.right: parent.right
            anchors.leftMargin: 5
            anchors.rightMargin: 5
            wrapMode: Text.WrapAnywhere
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
            wrapMode: Text.WrapAnywhere
            color: delegate.highlighted ? Theme.secondaryHighlightColor : Theme.secondaryColor
            font.pixelSize: Theme.fontSizeSmall
        }

    }
    VerticalScrollDecorator {}

    ListModel {
        id: comingSoonModel
    }

    Component.onCompleted: Logic.refreshComingSoon();
}