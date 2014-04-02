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
            Image {
                id: moviePoster
                source: image
                fillMode: Image.PreserveAspectFit
                x: Theme.paddingLarge
            }
            Label {
                id: movieGenreLabel
                x: Theme.paddingLarge
                text: page.genre
                color: Theme.secondaryColor
                font.pixelSize: Theme.fontSizeMedium
            }
            Label {
                id: movieRuntimeLabel
                x: Theme.paddingLarge
                text: page.runtime
                color: Theme.secondaryColor
                font.pixelSize: Theme.fontSizeMedium

            }
            Label {
                id: movieTerminsLabel
                x: Theme.paddingLarge
                text: page.termins
                color: Theme.secondaryColor
                font.pixelSize: Theme.fontSizeMedium

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



