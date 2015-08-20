(function(){
  var config = {
    container: document.getElementById('top-view')
  };
  var heatmapInstance_a = h337.create(config);
  var heatmapInstance_b = h337.create(config);
  var heatmapInstance_c = h337.create(config);
  var heatmapInstance_d = h337.create(config);
  var heatmapInstance_e = h337.create(config);
  var heatmapInstance_reception = h337.create(config);

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
    place: "track_a",
    points: [{x: 700, y: 1580}, {x: 900, y: 1530}, {x: 800, y: 1530}, {x: 870, y: 1470}, {x: 730, y: 1470}, {x: 880, y: 1650}, {x: 850, y: 1650}, {x: 750, y: 1660}],
    value: 1000,
    max: 1000 * 1.0
  }]
  var track_b = [{
    place: "track_b",
    points: [{x: 1100, y: 1120}, {x: 1200, y: 1120}, {x: 1150, y: 1150}],
    value: 100,
    max: 100 * 1.0
  }]
  var track_c = [{
    place: "track_c",
    points: [{x: 1100, y: 2030}, {x: 1200, y: 1980}, {x: 1150, y: 2000}],
    value: 122,
    max: 122 * 1.0
  }]
  var track_d = [{
    place: "track_d",
    points: [{x: 630, y: 350}, {x: 760, y: 440}, {x: 869, y: 350}],
    value: 288,
    max: 288 * 0.6
  }]
  var track_e = [{
    place: "track_e",
    points: [{x: 630, y: 530}, {x: 770, y: 610}, {x: 890, y: 520}],
    value: 288,
    max: 288 * 0.6
  }]
  var reception = [{
      place: "ap005",
      points: [{x: 990, y: 390}],
      max: 50
    },
    {
      place: "ap006",
      points: [{x: 990, y: 550}],
      max: 50
  }]

  function getData(track) {
    var dataPoints = [];
    track.forEach(function(ap) {
      var associations = getAssociations(ap.place)
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

  function lender() {

    var dataPoints = [];
    heatmapInstance_a.setData({data:[]}).setData(getData(track_a));
    heatmapInstance_b.setData({data:[]}).setData(getData(track_b));
    heatmapInstance_c.setData({data:[]}).setData(getData(track_c));
    heatmapInstance_d.setData({data:[]}).setData(getData(track_d));
    heatmapInstance_e.setData({data:[]}).setData(getData(track_e));
    heatmapInstance_reception.setData({data:[]}).setData(getData(reception));
    setTimeout(lender, 10000);
  }

  window.onload = function() {
    lender();
  };
})();
