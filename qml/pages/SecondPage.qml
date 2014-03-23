import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    id: page
    SilicaListView {
        id: listView
        model: model1
        anchors.fill: parent
        header: PageHeader {
            title: "Nested Page"
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
                //                anchors.verticalCenter: parent.verticalCenter
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

            onClicked: {
                var xmlHttp = new XMLHttpRequest();
                var data = null;
                xmlHttp.onreadystatechange = function() {
                    if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
                        try {
                            data = JSON.parse(xmlHttp.responseText);
                            console.log(data.responseData);
                            model1.clear();
                            for (var i = 0; i < data.responseData.length; i++) {
                                console.log(data.responseData[i].title);

                                model1.append({
                                                  'title': data.responseData[i].title,
                                                  'image': data.responseData[i].image,
                                                  'genre': data.responseData[i].genre,
                                                  'runtime': data.responseData[i].runtime
                                              })
                            }
                        } catch(e) {
                            console.log(e)
                        }


                    }
                }
                xmlHttp.open('GET', 'http://api.grave-design.com/cinema/')
                xmlHttp.send();
                console.log("Clicked " + index)
            }
        }
        VerticalScrollDecorator {}
    }

    ListModel {
        id: model1
        ListElement {
            title: "jackfruit"
            image: ''
            genre: ''
            runtime: ''
        }
    }
}
