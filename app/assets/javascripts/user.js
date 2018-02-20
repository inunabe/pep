$(document).ready(function() {
  $(".dropdown-button").dropdown();
  $('select').material_select();
});

var map;
function initMap() {
    map = new google.maps.Map(document.getElementById('fukuei-map'), { // #sampleに地図を埋め込む
        center: { // 地図の中心を指定
            lat: 34.719735, // 緯度
            lng: 135.418066 // 経度
        },
        zoom: 19 // 地図のズームを指定
    });
}
