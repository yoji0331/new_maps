/*global google, markerclusterer*/
var spots = [
    {lat: 35.5614174, lng: 139.6928300},
    {lat: 32.5614162, lng: 139.6928388},
    {lat: 33.5614125, lng: 139.6928329},
    {lat: 34.5614176, lng: 139.6928363},
    {lat: 35.5614198, lng: 139.6928355}    
]

function initMap() {
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 3,
        center: {lat: 35.5614174, lng: 139.6928300}
    });

    var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

    var markers = locations.map(function(location, i) {
        return new google.maps.Marker({
            position: location,
            label: labels[i % labels.length]
        });
    });

    var markerCluster = new MarkerClusterer(map, markers,
        {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
}
var locations = [
    {lat: spots[0].lat, lng: spots[0].lng},
    {lat: spots[1].lat, lng: spots[1].lng},
    {lat: spots[2].lat, lng: spots[2].lng},
    {lat: spots[3].lat, lng: spots[3].lng},
    {lat: spots[4].lat, lng: spots[4].lng}
];
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
