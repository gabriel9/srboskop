import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    id: page
    property string title
    property string genre
    property string image
    property string runtime
    property string trailer
    property string termins
    property string imdbid
    property string content
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        //        PullDownMenu {
        //            MenuItem {
        //                text: "Show Page 2"
        //                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
        //            }
        //        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        Column {
            id: column
            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: page.title
            }
            Row {
                anchors.leftMargin: Theme.paddingLarge
                anchors.left: parent.left
                anchors.right: parent.right
                Image {
                    id: moviePoster
                    source: image
                    fillMode: Image.PreserveAspectFit
                }
                Column {
                    Label {
                        id: movieGenreLabel
                        x: Theme.paddingLarge
                        text: page.genre
                        color: Theme.secondaryColor
                        font.pixelSize: Theme.fontSizeSmall
                    }
                    Label {
                        id: movieRuntimeLabel
                        x: Theme.paddingLarge
                        text: page.runtime
                        color: Theme.secondaryColor
                        font.pixelSize: Theme.fontSizeSmall
                    }
                    Label {

                        id: movieTerminsLabel
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: Theme.paddingLarge
                        text: page.termins
                        color: Theme.secondaryColor
                        font.pixelSize: Theme.fontSizeSmall
                        wrapMode: Text.WordWrap
                    }
                }
            }
            Label {
                id: movieDescription
                text: page.content
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: Theme.paddingLarge
                anchors.rightMargin: Theme.paddingLarge
                wrapMode: Text.WordWrap
                font.pixelSize: Theme.fontSizeExtraSmall
                color: Theme.secondaryColor
            }



            Button {
                id: trailerButton
                x: Theme.paddingLarge
                text: 'Trejler'
                onClicked: {
                    console.log("open trailer " + page.trailer)
                }
            }
            Button {
                id: imdButton
                x: Theme.paddingLarge
                text: 'Imdb'
                onClicked: {
                    console.log("open imdb " + page.imdbid)
                }
            }

        }

    }
}



