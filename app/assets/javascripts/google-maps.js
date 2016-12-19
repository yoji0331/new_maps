/*global google*/
/* グローバル関数の宣言 */
'use strict';

var blankScores = [],
    center,
    options,
    map,
    score,
    markers = [];

var lat_array = [];
var lng_array = [];
var window_open_array = [];
var obj = [];

var RADAR_CHART = {};

var formatData = [];
for(var i=0;i<4;i++){
    formatData[i] = new Array(6);
}
center = new google.maps.LatLng(35.5614174, 139.6928321);
options = {
    zoom: 10,
    center: center,
    mapTypeId: google.maps.MapTypeId.ROADMAP
};
map = new google.maps.Map($('#map').get(0), options);
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
