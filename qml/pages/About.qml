import QtQuick 2.0
import Sailfish.Silica 1.0
Page {
    id: aboutPage
    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        Column {
            id: column
            width: aboutPage.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: "O aplikaciji"
            }

        }
    }
}
