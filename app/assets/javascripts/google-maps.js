/*global google, markerclusterer, $*/
var area = [];
var map = new google.maps.Map(
    document.getElementById('map'), {
        zoom: 3,
        center: {
            lat: 35.5614174,
            lng: 139.6928300
        }
    });
var markers = [];
$(document).ready(function(){
    $.getJSON("data.json", function(spots){
        var i;
        var isObject = function(o) {
            return (o instanceof Object && !(o instanceof Array)) ? true : false;
        };
        for(i=0;i<spots.length;i++){
            area[i] = {lat: spots[i].latitude, lng: spots[i].longitude};
            var LatLng = new google.maps.LatLng(spots[i].latitude,spots[i].longitude);
            var marker = new google.maps.Marker({position: LatLng});
            markers.push(marker);
        }
        var markerclusterer = new MarkerClusterer(map, markers, {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m' });
    });
});
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

# JSONフォーマットの例
[
    {
        "user": "澤田洋二",
        "survey": "尾駮小学校2016年秋",
        "researcher":  "尾駮小学校3年生",
        "site_name": "尾駮川上流",
        "lat": 142.2,
        "lng": 64.5.
        "mi0": 2.5,
        "mi1": 2.5,
        "mi2": 2.5,
        "mi3": 2.5,
        ...
    },
    ...
]*/
