var playingNow = 'http://api.grave-design.com/cinema/';
var comingSoon = 'http://api.grave-design.com/cinema/najave.php';

// TODO: for this i need only one function. The JS is bound to QML code

function refreshComingSoon() {
    refreshCinema(comingSoon);
}

function refreshPlayingNow() {
    refreshCinema(playingNow);
}

function refreshCinema(URL) {
    var xmlHttp = new XMLHttpRequest();
    var data = null;

    loadingIndicator.running = true;
    xmlHttp.onreadystatechange = function() {
        if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
            try {
                loadingIndicator.running = false;
                data = JSON.parse(xmlHttp.responseText);
                movieModel.clear();
                for (var i = 0; i < data.responseData.length; i++) {
                    movieModel.append({
                                      'title': data.responseData[i].title,
                                      'image': data.responseData[i].image,
                                      'genre': data.responseData[i].genre,
                                      'runtime': data.responseData[i].runtime,
                                      'trailer': data.responseData[i].trailer,
                                      'termins': data.responseData[i].termini,
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
                                  });
                }

            } catch(e) {
                console.log(e)
            }


        }
    }
    xmlHttp.open('GET', URL)
    xmlHttp.send();
}
