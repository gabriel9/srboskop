import QtQuick 2.0
import Sailfish.Silica 1.0


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
                onClicked: refreshCinema();
            }
        }

        delegate: BackgroundItem {
            height: 100
            id: delegate
            Image {
                id: moviePoster
                source: image
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                x: Theme.paddingLarge
                fillMode: Image.PreserveAspectFit
            }
            Label {
                id: titleLabel
                text: title
                anchors.left: moviePoster.right
                color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor

            }
            Label {
                id: genreLabel
                text: genre
                anchors.left: moviePoster.right
                anchors.top: titleLabel.bottom
                color: delegate.highlighted ? Theme.secondaryHighlightColor : Theme.secondaryColor
                font.pixelSize: Theme.fontSizeSmall
            }
            Label {
                id: runtimeLabel
                text: runtime
                anchors.left: moviePoster.right
                anchors.top: genreLabel.bottom
                color: delegate.highlighted ? Theme.secondaryHighlightColor : Theme.secondaryColor
                font.pixelSize: Theme.fontSizeSmall
            }

            onClicked: pageStack.push(Qt.resolvedUrl("Movie.qml"), {title: title, genre: genre, image: image, runtime: runtime})
        }
        VerticalScrollDecorator {}
    }
    function refreshCinema() {
        var xmlHttp = new XMLHttpRequest();
        var data = null;
        xmlHttp.onreadystatechange = function() {
            if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
                try {
                    data = JSON.parse(xmlHttp.responseText);
                    model1.clear();
                    for (var i = 0; i < data.responseData.length; i++) {
                        model1.append({
                                          'title': data.responseData[i].title,
                                          'image': data.responseData[i].image,
                                          'genre': data.responseData[i].genre,
                                          'runtime': data.responseData[i].runtime,
                                          'trailer': data.responseData[i].trailer,
                                          'termini': data.responseData[i].termini,
                                          'imdbid': data.responseData[i].imdbid,
                                          'url': data.responseData[i].url,
                                          'rating': data.responseData[i].rating,
                                          'director': data.responseData[i].director,
                                          'writing': data.responseData[i].writing,
                                          'producer': data.responseData[i].producer,
                                          'composer': data.responseData[i].composer,
                                          'cast': data.responseData[i].cast,
                                          'title_loc': data.responseData[i].title_loc,
                                          'content': data.responseData[i].content,
                                          'year': data.responseData[i].year,
                                      })
                    }
                } catch(e) {
                    console.log(e)
                }


            }
        }
        xmlHttp.open('GET', 'http://api.grave-design.com/cinema/')
        xmlHttp.send();
    }
    ListModel {
        id: model1
    }

    Component.onCompleted: refreshCinema();
}
