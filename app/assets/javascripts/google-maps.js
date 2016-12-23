/*global google, markerclusterer, $, d3*/
var map = new google.maps.Map(
    document.getElementById('map'), {
        zoom: 3,
        center: {
            lat: 35.5614174,
            lng: 139.6928300
        }
    });
var markers = [];
var formatData = [];
var RADAR_CHART = {};
var score = 5;
var infowindows =[];
var maxZIndex = 2;
var markerclusterer;


$(document).ready(function(){
    $.getJSON("data.json", function(spots){
        var i;
        var isObject = function(o) {
            return (o instanceof Object && !(o instanceof Array)) ? true : false;
        };
        for(i=0;i<spots.length;i++){
            format(spots[i], i);
            var LatLng = new google.maps.LatLng(spots[i].latitude,spots[i].longitude);
            var marker = RADAR_CHART.createMarker(LatLng, i);
            console.log(marker);
            markers.push(marker);
        }
        markerclusterer = new MarkerClusterer(map, markers, {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m' });
    });
});

function format(spot, i){
    formatData[i] = new Array(6);
    formatData[i][0] = [spot.value1,spot.value2,spot.value3];
    formatData[i][1] = [spot.value4,spot.value5,spot.value6, spot.value7];
    formatData[i][2] = [spot.value8,spot.value9,spot.value10];
    formatData[i][3] = [spot.value11,spot.value12,spot.value13, spot.value14, spot.value15];
    formatData[i][4] = [spot.value16,spot.value17,spot.value18, spot.value19, spot.value20];
    formatData[i][5] = [spot.value21,spot.value22,spot.value23, spot.value24, spot.value25];
};

function Mouseclick(ele){
    console.log("click");
    var id_value = ele.id;
    console.log(id_value);
    var id = id_value.substr(7);
    console.log(id);
    console.log(markerclusterer.clusters_[id]);
    
}
RADAR_CHART.removeRadarchart = function(index){
    var svg = d3.select('#infodiv' + index).remove();
}
RADAR_CHART.createMarker = function(latlng, i){
    var marker = new google.maps.Marker({
        position: latlng,
        map: map
    });
    var infowindow  = null;
    function attachInfowindow(){
        if(infowindow === null){
            infowindow = new google.maps.InfoWindow({
                content: name + '<div id="infodiv' + i + '" onclick = Mouseclick(this)></div>',
                map: map,
                zIndex: 1
            });
            infowindows.push(infowindow);

            infowindow.close();
            infowindow.open(marker.getMap(),marker);
            google.maps.event.addListener(infowindow,'closeclick',function(){
                infowindow = null;
            console.log("close");

            });
        }
        var str = "#infodiv" + i;
        google.maps.event.addListener(infowindow, 'domready', function(){
            d3.select(str).selectAll('svg').remove();
            RADAR_CHART.radarchart(i, formatData[i][score]);
            console.log("domready");
        });
    };
    attachInfowindow();
    google.maps.event.addListener(marker,'click',function(){
        attachInfowindow();
        console.log("marker click");
    });
    return marker;
}
RADAR_CHART.radarchart = function(index, scores){
    'use strict';

    var w,
        h,
        padding,
        i,
        j,
        svg,
        dataset,
        paramCount,
        max,
        rScale,
        grid,
        label,
        line;

    w = 200;
    h = 200;
    padding = 30;


    svg = d3.select('#infodiv' + index)
        .append('svg')
        .attr('width', w)
        .attr('height', h);

    dataset = [scores];

    var k, axis =[], dataAxis;
    if(scores.length % 2 == 0){
        for (k=0;k < scores.length;k++){
            axis.push(0);    
            axis.push(3);    
            axis.push(0); 
        }   
    } else {
        for (k=0;k < scores.length;k++){
            axis.push(0);    
            axis.push(3);    
        }
    }
    

    dataAxis = [axis];
    




    paramCount = dataset[0].length;

    max = 3;

    rScale = d3.scale.linear()
        .domain([0, max])
        .range([0, w / 2 - padding]);

    grid = function () {
        var result = [],
            arr;
        for (i = 1; i <= max; i += 1) {
            arr = [];
            for (j = 0; j < paramCount; j += 1) {
                arr.push(i);
            }
            result.push(arr);
        }
        return result;
    };
    grid();


    label  = (function(){
        var result = [];
        for(var i=0; i<paramCount; i++){
          result.push(max + 1);
        }
        return result;
      })();

    line = d3.svg.line()
        .x(function (d, i) {
            return rScale(d) * Math.cos(2 * Math.PI / paramCount * i - (Math.PI / 2)) + w / 2;
        })
        .y(function (d, i) {
            return rScale(d) * Math.sin(2 * Math.PI / paramCount * i - (Math.PI / 2)) + w / 2;
        })
        .interpolate('linear');

    svg.selectAll('path')
        .data(dataset)
        .enter()
        .append('path')
        .attr('d', function (d, i) {
            return line(d) + "z";
        })
        .attr("stroke", function (d, i) {
            return d3.scale.category10().range()[i];
        })
        .attr("stroke-width", 2)
        .attr('fill', '#1f77b4');

    svg.selectAll('path.axis')
        .data(dataAxis)
        .enter()
        .append('path')
        .attr('d', function (d,i) {
            return line(d) + "z";
        })
        .attr("stroke", "black")
        .attr("stroke-width", "2")
        .attr('fill', 'none');


    svg.selectAll("path.grid")
        .data(grid)
        .enter()
        .append("path")
        .attr("d", function (d, i) {
            return line(d) + "z";
        })
        .attr("stroke", "black")
        .attr("stroke-dasharray", "2")
        .attr('fill', 'none');

     svg.selectAll("text")
     .data(label)
     .enter()
     .append('text')
     .text(function(d, i){ return i+1; })
     .attr("text-anchor", "middle")
     .attr("dominant-baseline", "middle")
     .attr('x', function(d, i){ return rScale(d) * Math.cos(2 * Math.PI / paramCount * i - (Math.PI / 2)) + w/2; })
     .attr('y', function(d, i){ return rScale(d) * Math.sin(2 * Math.PI / paramCount * i - (Math.PI / 2)) + w/2; })
     .attr("font-size", "15px");
}

/*# UI
- 情報ウィンドウ内の表示内容
    * 指標の主軸

- 情報ウィンドウの表示/非表示の切り替え
    * 時期
    * 調査
    * 文字列検索かも
      地名、調査者名、調査名...

    * 同じ地点: ズームに依存
    * データ

- イベント
    * ウィンドウの描画完了 jQueryの方で
        - 地図の描画
        - JSONの取得
            + ズーム応じたクラスター化
            + マーカーの表示
            + マーカーにイベントハンドラ
            + 情報ウィンドウの表示
    * 情報ウィンドウの閉じリンク
        - 情報ウィンドウが閉じる
    * 情報ウィンドウの閉じリンク以外をクリック
        - 情報ウィンドウが上に来る
    * マーカーをクリック
        - 情報ウィンドウを全部開く
    * ズームを変更
        - マーカーのクラスタリングが変更
            + (情報ウィンドウの表示/非表示が一部変更)

    * 情報ウィンドウの開閉
        - 情報ウィンドウの並べ替え

    * 画面のリサイズ

- イベントハンドラ
    * JSONのロードのコールバック
    * 地図のズームの変更
    * マーカー群のクリック
    * 情報ウィンドウの開閉

# データ構造
    * 指標の主軸

    * マップ
      * ズーム、中心の座標、etc.
      * マーカー群
      * マーカー
          * 情報ウィンドウ
      * データ
*/

/*
    開いている情報ウィンドウを配列に記憶しておく
    閉じる/開くに対して配列を操作
    配列を参照して情報ウィンドウを描画
*/