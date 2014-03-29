import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    id: page
    property string title: ""
    property string genre: ""
    property string image: ""
    property string runtime: ""
    // To enable PullDownMenu, place our content in a SilicaFlickable
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

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.

        Column {
            id: column
            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: page.title
            }
            Item {
                id: container1
                Image {
                    id: moviePoster
                    source: image
                    anchors.left: parent.left
                    fillMode: Image.PreserveAspectFit
                }
                Label {
                    id: movieGenreLabel
                    x: Theme.paddingLarge
                    text: page.genre
                    color: Theme.secondaryColor
                    font.pixelSize: Theme.fontSizeMedium
                    anchors.left: moviePoster.right
                }
                Label {
                    id: movieRuntimeLabel
                    x: Theme.paddingLarge
                    text: page.runtime
                    color: Theme.secondaryColor
                    font.pixelSize: Theme.fontSizeMedium
                    anchors.left: moviePoster.right
                    anchors.top: movieGenreLabel.bottom
                }
            }

        }
    }
}


