(function(){
  var config = {
    container: document.getElementById('top-view')
  };
  var heatmapInstance_a = h337.create(config);
  var heatmapInstance_b = h337.create(config);
  var heatmapInstance_c = h337.create(config);
  var heatmapInstance_d = h337.create(config);
  var heatmapInstance_e = h337.create(config);
  var heatmapInstance_reception_6f = h337.create(config);
  var heatmapInstance_reception_7f = h337.create(config);
  var heatmapInstance_lobby_1 = h337.create(config);
  var heatmapInstance_lobby_2 = h337.create(config);

  var _dataPoint = {
    radius: 150,
//    opacity: 1,
    maxOpacity: .9,
    minOpacity: .3,
    blur: 1,
    gradient: {
      '.3': 'blue',
      '.5': 'red',
      '.85': 'white'
    }
  };

  var track_a = [{
      place: "ap017",
      points: [{x: 700, y: 1320}],
      max: 1000 * 1.0 / 12
    },{
      place: "ap018",
      points: [{x: 850, y: 1320}],
    },{
      place: "ap105",
      points: [{x: 570, y: 1440}],
    },{
      place: "ap107",
      points: [{x: 750, y: 1440}],
    },{
      place: "ap111",
      points: [{x: 950, y: 1430}],
    },{
      place: "ap108",
      points: [{x: 700, y: 1520}],
    },{
      place: "ap110",
      points: [{x: 880, y: 1520}],
    },{
      place: "ap106",
      points: [{x: 570, y: 1600}],
    },{
      place: "ap109",
      points: [{x: 750, y: 1600}],
    },{
      place: "ap112",
      points: [{x: 950, y: 1600}],
    },{
      place: "ap019",
      points: [{x: 700, y: 1700}],
    },{
      place: "ap020",
      points: [{x: 850, y: 1700}]
    }];
  var track_b = [{
      place: "ap010",
      points: [{x: 1090, y: 1130}],
      max: 100 * 1.0 / 3
    },{
      place: "ap103",
      points: [{x: 1150, y: 1090}],
    },{
      place: "ap009",
      points: [{x: 1210, y: 1130}]
    }];
  var track_c = [{
      place: "ap014",
      points: [{x: 1090, y: 2000}],
      max: 122 * 1.0 / 2
    },{
      place: "ap104",
      points: [{x: 1250, y: 1960}]
    }];
  var track_d = [{
      place: "ap001",
      points: [{x: 630, y: 350}],
      max: 288 * 0.6 / 3
    },{
      place: "ap101",
      points: [{x: 760, y: 440}],
    },{
      place: "ap002",
      points: [{x: 869, y: 350}]
    }];
  var track_e = [{
      place: "ap003",
      points: [{x: 630, y: 530}],
      max: 288 * 0.6 / 3
    },{
      place: "ap102",
      points: [{x: 770, y: 610}],
    },{
      place: "ap004",
      points: [{x: 890, y: 520}]
    }];
  var reception_6f = [{
      place: "ap005",
      points: [{x: 990, y: 390}],
      max: 40
    },{
      place: "ap006",
      points: [{x: 990, y: 550}]
    }];
  var reception_7f = [{
      place: "ap007",
      points: [{x: 1220, y: 1430}],
      max: 40
    },{
      place: "ap008",
      points: [{x: 1220, y: 1620}],
    }];
  var lobby_1 = [{
      place: "ap012",
      points: [{x: 610, y: 1170}],
      max: 40
    },{
      place: "ap011",
      points: [{x: 920, y: 1170}],
    }];
  var lobby_2 = [{
      place: "ap016",
      points: [{x: 610, y: 1890}],
      max: 40
    },{
      place: "ap015",
      points: [{x: 920, y: 1890}],
    }];

  function getData(track) {
    var dataPoints = [];
    track.forEach(function(ap) {
      var associations = getAssociations(ap.place);
      ap.points.forEach(function(point) {
        var clonedDataPoint = (JSON.parse(JSON.stringify(_dataPoint)));
        clonedDataPoint.x = point.x;
        clonedDataPoint.y = point.y;
        clonedDataPoint.value = associations;
        dataPoints.push(clonedDataPoint);
      });
    });
    var data = {
      max: track[0].max,
      min: 0,
      data: dataPoints
    };
    return data;
  }

  function getAssociations(place) {
    var httpRequest;
    var associations;
    if (window.XMLHttpRequest) { // Mozilla, Safari, IE7+ ...
        httpRequest = new XMLHttpRequest();
    } else if (window.ActiveXObject) { // IE 6 and older
        httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
    }
    httpRequest.open('GET', "http://api.conbu.net/v1/associations/" + place + "/both", false);
    httpRequest.send();
    if (httpRequest.status === 200) {
      associations = JSON.parse(httpRequest.responseText).associations;
    } else {
      console.log("api error");
    }
    return associations;
  }

  function start() {

    var dataPoints = [];
    heatmapInstance_a.setData(getData(track_a));
    heatmapInstance_b.setData(getData(track_b));
    heatmapInstance_c.setData(getData(track_c));
    heatmapInstance_d.setData(getData(track_d));
    heatmapInstance_e.setData(getData(track_e));
    heatmapInstance_reception_6f.setData(getData(reception_6f));
    heatmapInstance_reception_7f.setData(getData(reception_7f));
    heatmapInstance_lobby_1.setData(getData(lobby_1));
    heatmapInstance_lobby_2.setData(getData(lobby_2));
    setTimeout(start, 10000);
  }

  window.onload = function() {
    start();
  };
})();
