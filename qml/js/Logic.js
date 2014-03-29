var playingNow = 'http://api.grave-design.com/cinema/';
var comingSoon = 'http://api.grave-design.com/cinema/najave.php';

function refreshComingSoon() {
    refreshCinema(comingSoon, comingSoonModel);
}

function refreshPlayingNow() {
    refreshCinema(playingNow, nowPlayingModel);
}

function refreshCinema(URL, model) {
    var xmlHttp = new XMLHttpRequest();
    var data = null;
    xmlHttp.onreadystatechange = function() {
        if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
            try {
                data = JSON.parse(xmlHttp.responseText);
                model.clear();
                for (var i = 0; i < data.responseData.length; i++) {
                    model.append({
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
    xmlHttp.open('GET', URL)
    xmlHttp.send();
}
