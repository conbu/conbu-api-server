(function(){
  var config = {
    container: document.getElementById('top-view')
  };
  var heatmapInstance_a = h337.create(config);
  var heatmapInstance_b = h337.create(config);
  var heatmapInstance_c = h337.create(config);
  var heatmapInstance_d = h337.create(config);
  var heatmapInstance_e = h337.create(config);

  var _dataPoint = {
    radius: 150,
//    opacity: 1,
    maxOpacity: .9,
    minOpacity: .3,
    blur: 1,
    gradient: {
      '.5': 'blue',
      '.7': 'red',
      '.95': 'white'
    }
  };

  var track_a = {
    place: "track_a",
    points: [{x: 700, y: 1530}, {x: 900, y: 1480}, {x: 800, y: 1480}, {x: 870, y: 1420}, {x: 730, y: 1420}, {x: 880, y: 1610}, {x: 850, y: 1590}, {x: 750, y: 1610}],
    value: 1000,
    max: 1000 * 1.3
  }
  var track_b = {
    place: "track_b",
    points: [{x: 1100, y: 1070}, {x: 1200, y: 1070}, {x: 1150, y: 1100}],
    value: 100,
    max: 100 * 1.3
  }
  var track_c = {
    place: "track_c",
    points: [{x: 1100, y: 1970}, {x: 1200, y: 1930}, {x: 1150, y: 1950}],
    value: 122,
    max: 122 * 1.3
  }
  var track_d = {
    place: "track_d",
    points: [{x: 750, y: 380}, {x: 710, y: 370}, {x: 810, y: 370}],
    value: 288,
    max: 288 * 1.3
  }
  var track_e = {
    place: "track_e",
    points: [{x: 750, y: 580}, {x: 710, y: 570}, {x: 810, y: 570}],
    value: 288,
    max: 288 * 1.3
  }

  function getData(track) {
    var dataPoints = [];
    associations = getAssociations(track.place)
    track.points.forEach(function(point) {
      var clonedDataPoint = (JSON.parse(JSON.stringify(_dataPoint)));
      clonedDataPoint.x = point.x;
      clonedDataPoint.y = point.y;
      clonedDataPoint.value = associations;
      dataPoints.push(clonedDataPoint);
    });
    var data = {
      max: track.max,
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
    httpRequest.open('GET', "http://dev-api.conbu.net/v1/associations/" + place + "/both", false);
    httpRequest.send();
    if (httpRequest.status === 200) {
      associations = JSON.parse(httpRequest.responseText).associations;
    } else {
      console.log("api error");
    }
    return associations;
  }

  function lender() {

    var dataPoints = [];
    heatmapInstance_a.setData({data:[]}).setData(getData(track_a));
    heatmapInstance_b.setData({data:[]}).setData(getData(track_b));
    heatmapInstance_c.setData({data:[]}).setData(getData(track_c));
    heatmapInstance_d.setData({data:[]}).setData(getData(track_d));
    heatmapInstance_e.setData({data:[]}).setData(getData(track_e));
    console.log(heatmapInstance_a.getData());
    setTimeout(lender,2000);
  }

  window.onload = function() {
    lender();
  };
})();
